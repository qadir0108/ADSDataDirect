using ADSDataDirect.Core;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Infrastructure.ClickMeter;
using ADSDataDirect.Infrastructure.Csv;
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

            // 20181214164423
            List<long> dayWise = new List<long>();
            var dayWiseGroups = hits.GroupBy(x => x.AccessTime.Substring(0,8)).OrderBy(x => x.Key);
            foreach (var group in dayWiseGroups)
            {
                dayWise.Add(group.Count());
            }

            SaveProDataNXS(db, campaign.Id, campaign.OrderNumber, string.Empty, data);
            var campaignTracking = UpdateTrackingNXS(db, campaign, campaign.OrderNumber, string.Empty, data, customer, dayWise);
            //var settings = SettingsManager.Instance.LoadSettings(db);
            //SaveNotification(db, settings, campaign.Id, campaign.OrderNumber, string.Empty, campaign.Approved.DeployDate, data.ResponseStatus, campaignTracking);
        }
    }
}