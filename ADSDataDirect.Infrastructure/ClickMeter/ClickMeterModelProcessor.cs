using ADSDataDirect.Core;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Infrastructure.ClickMeter;
using ADSDataDirect.Infrastructure.Csv;
using ADSDataDirect.Infrastructure.Db;
using ADSDataDirect.Infrastructure.ProData;
using ADSDataDirect.Infrastructure.ReportingModel;
using ADSDataDirect.Infrastructure.S3;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace ADSDataDirect.Infrastructure.ClickMeter
{
    public class ClickMeterModelProcessor : ReportingModelProcessor
    {
        public static void PopulateFromClickMeter(WfpictContext db, Campaign campaign)
        {
            if (string.IsNullOrEmpty(campaign.Approved.WhiteLabel))
                throw new AdsException("Please select white label on campaign approved screen.");

            var customer = db.Customers.FirstOrDefault(x => x.WhiteLabel == campaign.Approved.WhiteLabel);
            if (customer == null)
                throw new AdsException("White label on campaign approved screen is invalid.");

            //campaign.Testing.ClickMeterRotatorLinkId = "358427750";
            if (string.IsNullOrEmpty(campaign.Testing.ClickMeterRotatorLinkId))
                throw new AdsException("Click Meter RotatorLink is not generated yet.");

            var hits = ClickMeterManager.GetDatapointsHits(campaign.Testing.ClickMeterRotatorLinkId);
            
            var groups = hits.GroupBy(x => x.RealDestinationUrl);
            
            List<Report> reports = new List<Report>();
            int counter = 0;
            foreach (var g in groups)
            {
                var first = g.FirstOrDefault();
                reports.Add(new Report()
                {
                    IO = campaign.OrderNumber,
                    CampaignName = campaign.Approved.CampaignName,
                    CampaignStartDate = campaign.Approved.DeployDate?.ToString(StringConstants.DateTimeFormatDashes),
                    Reportsite_URL = first.Entity.TrackingCode,
                    Destination_URL = first.RealDestinationUrl.ToString(),
                    ClickCount = g.Count().ToString()
                });
                counter++;
            }
            var data = new ProDataResponse()
            {
                reports = new ProData.Reports()
                {
                    report = reports.ToArray()
                }
            };

            if (hits.Count == 0)
                data.ResponseStatus = ProDataResponseStatus.NotFound.ToString();

            // 20181214164423
            List<long> dayWise = new List<long>();
            var dayWiseGroups = hits.GroupBy(x => x.AccessTime.Substring(0,8)).OrderBy(x => x.Key);
            foreach (var group in dayWiseGroups)
            {
                dayWise.Add(group.Count());
            }

            SaveProDataNXS(db, campaign.Id, campaign.OrderNumber, string.Empty, data);
            var campaignTracking = UpdateTrackingNXS(db, campaign, campaign.OrderNumber, string.Empty, data, customer, dayWise);
            var settings = SettingsManager.Instance.LoadSettings(db);
            SaveNotificationNXS(db, settings, campaign.Id, campaign.OrderNumber, string.Empty, campaign.Approved.DeployDate, data.ResponseStatus, campaignTracking);
        }

        private static void SaveNotificationNXS(WfpictContext db, SettingsVm settings, Guid? campaignId, string orderNumber, string segmentNumber, DateTime? deployDate, string responseStatus, CampaignTracking campaignTracking)
        {
            if (!deployDate.HasValue) return;

            string message;

            int hoursPassed = (int)DateTime.Now.Subtract(deployDate.Value).TotalHours;
            
            // If Started
            if (hoursPassed < 96 && hoursPassed >= 72) // < 4 days
            {
                // QC Rule 3
                if (campaignTracking.OpenedPercentage < (settings.NotHitOpenRateIn72HoursValue / 100.0))
                {
                    message = $"{campaignTracking.Opened} / {campaignTracking.Quantity} is Less than required value {settings.NotHitOpenRateIn72HoursValue}% in 3 days";
                    SaveNotificationRecord(db, campaignId, orderNumber, segmentNumber, QcRule.NotHitOpenRateIn3Days, message);
                }
                // QC Rule 5
                if (campaignTracking.ClickedPercentage < (settings.NotHitClickRateIn72HoursValue / 100.0))
                {
                    message = $"{campaignTracking.Clicked} / {campaignTracking.Quantity} is Less than required value {settings.NotHitClickRateIn72HoursValue}% in 3 days";
                    SaveNotificationRecord(db, campaignId, orderNumber, segmentNumber, QcRule.NotHitClickRateIn3Days, message);
                }
                return;
            }

            if (hoursPassed < 72 && hoursPassed >= 48)
            {
                // QC Rule 3
                if (campaignTracking.OpenedPercentage < (settings.NotHitOpenRateIn48HoursValue / 100.0))
                {
                    message = $"{campaignTracking.Opened} / {campaignTracking.Quantity} is Less than required value {settings.NotHitOpenRateIn48HoursValue}% in 2 days";
                    SaveNotificationRecord(db, campaignId, orderNumber, segmentNumber, QcRule.NotHitOpenRateIn2Days, message);
                }
                // QC Rule 5
                if (campaignTracking.ClickedPercentage < (settings.NotHitClickRateIn48HoursValue / 100.0))
                {
                    message = $"{campaignTracking.Clicked} / {campaignTracking.Quantity} is Less than required value {settings.NotHitClickRateIn48HoursValue}% in 2 days";
                    SaveNotificationRecord(db, campaignId, orderNumber, segmentNumber, QcRule.NotHitClickRateIn2Days, message);
                }
                return;
            }

            if (hoursPassed < 48 && hoursPassed >= 24)
            {
                // QC Rule 2
                if (campaignTracking.OpenedPercentage < (settings.NotHitOpenRateIn24HoursValue / 100.0))
                {
                    message = $"{campaignTracking.Opened} / {campaignTracking.Quantity} is Less than required value {settings.NotHitOpenRateIn24HoursValue}% in 1 day";
                    SaveNotificationRecord(db, campaignId, orderNumber, segmentNumber, QcRule.NotHitOpenRateIn1Day, message);
                }
                // QC Rule 4
                if (campaignTracking.ClickedPercentage < (settings.NotHitClickRateIn24HoursValue / 100.0))
                {
                    message = $"{campaignTracking.Clicked} / {campaignTracking.Quantity} is Less than required value {settings.NotHitClickRateIn24HoursValue}% in 1 day";
                    SaveNotificationRecord(db, campaignId, orderNumber, segmentNumber, QcRule.NotHitClickRateIn1Day, message);
                }
            }

            //if (hoursPassed < 24 && hoursPassed >= settings.NotStartedInXHoursValue)
            //{
            //    if (campaignTracking.OpenedPercentage < 0.001 && hoursPassed > 0) // less than 0.1% and deploy date time passed
            //    {
            //        message = $"Number of Opens in last 24hrs, No Open Traffic in 24hrs.";
            //        SaveNotificationRecord(db, campaignId, orderNumber, segmentNumber, QcRule.OpenTrafficInLast24Hours, message);
            //    }
            //    // QC Rule 10
            //    if (campaignTracking.ClickedPercentage < 0.001 && hoursPassed > 0) // less than 0.1% and deploy date time passed
            //    {
            //        message = $"Number of Click in last 24hrs, No Click Traffic in 24hrs.";
            //        SaveNotificationRecord(db, campaignId, orderNumber, segmentNumber, QcRule.ClickTrafficInLast24Hours, message);
            //    }
            //    return;
            //}

            // QC Rule 1, Not Started
            if (responseStatus == ProDataResponseStatus.NotFound.ToString() && hoursPassed >= settings.NotStartedInXHoursValue)
            {
                message = $"Campaign to be started {deployDate.Value} as of {DateTime.Now}, Campaign has not started within {settings.NotStartedInXHoursValue} hours.";
                SaveNotificationRecord(db, campaignId, orderNumber, segmentNumber, QcRule.NotStartedInFirstXHours,
                    message);
            }
        }
    }
}