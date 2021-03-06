﻿using ADSDataDirect.Core;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Infrastructure.Csv;
using ADSDataDirect.Infrastructure.Notifications;
using ADSDataDirect.Infrastructure.ProData;
using ADSDataDirect.Infrastructure.S3;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace ADSDataDirect.Infrastructure.ReportingModel
{
    public class ReportingModelProcessor : NotificationRecorder
    {
        readonly static string clientCode = System.Configuration.ConfigurationManager.AppSettings["ClientCode"];
        static readonly Random Random = new Random();

        public static void PopulateFakeData(WfpictContext db, Campaign campaign, string orderNumber, string UploadPath)
        {
            // Process Links file
            string filePath = Path.Combine(UploadPath, campaign.Assets.OpenModelLinksFile);
            S3FileManager.Download(campaign.Assets.OpenModelLinksFile, filePath);
            List<string> links = CsvReader.ReadCsv(filePath);
            PopulateFakeData(db, campaign, orderNumber, links);
        }

        public static void PopulateFakeData(WfpictContext db, Campaign campaign, string orderNumber, List<string> links)
        {
            if(string.IsNullOrEmpty(campaign.Approved.WhiteLabel))
                throw new AdsException("Please select white label on campaign approved screen.");

            var customer = db.Customers.FirstOrDefault(x => x.WhiteLabel == campaign.Approved.WhiteLabel);
            if (customer == null)
                throw new AdsException("White label on campaign approved screen is invalid.");

            var keywords = db.OpenModelKeywords.ToList();

            Random r = new Random();
            int clicksRandom = r.Next((int)customer.ClickInitial, (int)customer.ClickEnd);
            long quantity = orderNumber.EndsWith("RDP") ? campaign.ReBroadcastedQuantity : campaign.Approved.Quantity;
            long clickCountTotal = (long)((clicksRandom * quantity / 100000.0) / 100.0);

            List<ClickModel> clicks = null;
            clicks = ClickModeler.GenerateClicks(links, clickCountTotal, keywords);

            List<Report> reports = new List<Report>();
            int counter = 0;
            foreach (var c in clicks)
            {
                reports.Add(new Report()
                {
                    IO = orderNumber,
                    CampaignName = campaign.Approved.CampaignName,
                    CampaignStartDate = campaign.Approved.DeployDate?.ToString(StringConstants.DateTimeFormatDashes),
                    Reportsite_URL = $"http://report-site.com/c/{orderNumber}/{counter}",
                    Destination_URL = c.Link,
                    ClickCount = c.Clicks.ToString()
                });
                counter++;
            }
            var data = new ProDataResponse()
            {
                reports = new ProData.Reports() {
                    report = reports.ToArray()
                }
            };

            SaveProDataNXS(db, campaign.Id, orderNumber, string.Empty, data);
            var campaignTracking = UpdateTrackingNXS(db, campaign, orderNumber, string.Empty, data, customer);
            //var settings = SettingsManager.Instance.LoadSettings(db);
            //SaveNotification(db, settings, campaign.Id, campaign.OrderNumber, string.Empty, campaign.Approved.DeployDate, data.ResponseStatus, campaignTracking);

        }

        protected static void SaveProDataNXS(WfpictContext db, Guid? campaignId, string orderNumber, string segmentNumber, ProDataResponse data)
        {
            if (data.reports == null || data.reports?.report == null || data.reports?.report.Length == 0)
                return;

            // Delete Old
            LogHelper.AddLog(db, LogType.Vendor, orderNumber, $"Deleting Old Vendor Data ");
            var proDatas = db.ProDatas.Where(x => x.CampaignId == campaignId && x.OrderNumber == orderNumber && x.SegmentNumber == segmentNumber);
            foreach (var proData in proDatas)
            {
                db.ProDatas.Remove(proData);
            }
            db.SaveChanges();

            // Add new ProData
            var reports = data.reports.report;
            LogHelper.AddLog(db, LogType.Vendor, orderNumber, $"{reports.Length} records fetched from Vendor");
            foreach (var report in reports)
            {
                var proData = new Core.Entities.ProData()
                {
                    Id = Guid.NewGuid(),
                    CreatedAt = DateTime.Now,
                    CampaignId = campaignId,
                    OrderNumber = orderNumber,
                    SegmentNumber = segmentNumber,

                    CampaignName = report.CampaignName,
                    Reportsite_URL = report.Reportsite_URL,
                    Destination_URL = report.Destination_URL,
                    CampaignStartDate = report.CampaignStartDate,
                    ClickCount = long.Parse(report.ClickCount),
                    //UniqueCnt = report.UniqueCnt, 
                    // unique should be 15-20% less then total click
                    UniqueCnt = long.Parse(report.ClickCount) * Random.Next(80, 85) / 100,
                    //MobileCnt = report.MobileCnt,
                    // mobile count should be 30-40 of total click
                    MobileCnt = long.Parse(report.ClickCount) * Random.Next(30, 40) / 100,
                    ImpressionCnt = report.ImpressionCnt,
                    IO = report.IO
                };
                db.ProDatas.Add(proData);
            }
            db.SaveChanges();
            LogHelper.AddLog(db, LogType.Vendor, orderNumber, $"Refresh completed successfully at {DateTime.Now} ");
        }

        protected static CampaignTracking UpdateTrackingNXS(WfpictContext db, Campaign campaign, string orderNumber, string segmentNumber, ProDataResponse data, Customer customer, List<long> dayWise = null)
        {
            var campaignTracking = campaign.Trackings.FirstOrDefault(x => x.OrderNumber == orderNumber && x.SegmentNumber == segmentNumber);

            long quantity = orderNumber.EndsWith("RDP") ? campaign.ReBroadcastedQuantity : campaign.Approved.Quantity;
            DateTime? startDateTime = orderNumber.EndsWith("RDP") ? campaign.ReBroadcastedDate : campaign.Approved.DeployDate;

            // Save tracking for Old orders
            if (campaignTracking == null)
            {
                var trackingId = Guid.NewGuid();
                campaignTracking = new CampaignTracking()
                {
                    Id = trackingId,
                    CreatedAt = DateTime.Now,
                    CampaignId = campaign.Id,
                    OrderNumber = orderNumber,
                    SegmentNumber = string.Empty,
                    Quantity = quantity,
                    DateSent = DateTime.Now,
                    IsCreatedThroughApi = false
                };
                db.CampaignTrackings.Add(campaignTracking);
                db.SaveChanges();
            }

            if (campaignTracking?.DateSent == null || data.reports?.report == null || data.reports.report.Length == 0) return campaignTracking;

            var reports = data.reports.report;
            var report = reports[0];
            campaignTracking.IoNumber = report.IO;
            campaignTracking.StartDate = startDateTime;
            campaignTracking.Deployed = (long)(campaignTracking.Quantity * (1 + Random.Next(2, 30) / 10000.0));
            
            // Prodata & ProData fake Open Modeler
            int openRandom = Random.Next((int)customer.OpenInitial, (int)customer.OpenEnd);
            long openCountTotal = (long)((openRandom * campaignTracking.Quantity / 100000.0) / 100.0);
            campaignTracking.Opened = openCountTotal;
            
            // Open by mobile, desktop
            campaignTracking.Desktop = (long)(((campaignTracking.Opened * Random.Next(50000, 60000)) / 1000.0) / 100.0);
            campaignTracking.Mobile = campaignTracking.Opened - campaignTracking.Desktop;

            campaignTracking.Clicked = reports.Sum(x => long.Parse(x.ClickCount));
            campaignTracking.Unsub = Random.Next(1, 100);
            campaignTracking.Forwards = Random.Next(1, 100);
            campaignTracking.Bounce = Random.Next(1, 25); //campaignTracking.Deployed - campaignTracking.Quantity;
            campaignTracking.Opt = Random.Next(1, 5);
            //var retargetingClicks = (long)(((campaignTracking.Quantity * Random.Next(160000, 190000)) / 100000.0) / 100.0);
            //campaignTracking.RetargetingClicks = retargetingClicks;
            //campaignTracking.RetargetingImpressions = (long)(retargetingClicks / (Random.Next(90, 130) / 10000.0));
            // 100-120% of qty
            campaignTracking.RetargetingImpressions = (long)((campaignTracking.Quantity * Random.Next(100000, 120000)) / 100000.0);
            // .8 to 1.0% of qty
            campaignTracking.RetargetingClicks = (long)((campaignTracking.Quantity * Random.Next(800, 1000)) / 100000.0);

            campaignTracking.DeliveryPercentage = campaignTracking.Quantity == 0 ? 0 : (double)campaignTracking.Quantity / campaignTracking.Deployed;
            campaignTracking.OpenedPercentage = campaignTracking.Quantity == 0 ? 0 : (double)campaignTracking.Opened / campaignTracking.Quantity;
            campaignTracking.ClickedPercentage = campaignTracking.Quantity == 0 ? 0 : (double)campaignTracking.Clicked / campaignTracking.Quantity;
            campaignTracking.UnsubPercentage = campaignTracking.Quantity == 0 ? 0 : (double)campaignTracking.Unsub / campaignTracking.Quantity;
            campaignTracking.ClickToOpenPercentage = campaignTracking.Opened == 0 ? 0 : (double)campaignTracking.Clicked / campaignTracking.Opened;
            campaignTracking.UnsubToOpenPercentage = campaignTracking.Opened == 0 ? 0 : (double)campaignTracking.Unsub / campaignTracking.Opened;

            if(dayWise != null)
            {
                campaignTracking.Day1Clicks = GetCount(dayWise, 0);
                campaignTracking.Day2Clicks = GetCount(dayWise, 1);
                campaignTracking.Day3Clicks = GetCount(dayWise, 2);
                campaignTracking.Day4Clicks = GetCount(dayWise, 3);
                campaignTracking.Day5Clicks = GetCount(dayWise, 4);
                campaignTracking.Day6Clicks = GetCount(dayWise, 5);
                campaignTracking.Day7Clicks = GetCount(dayWise, 6);
                campaignTracking.Day7PlusClicks = dayWise.Sum();
            }
            db.SaveChanges();

            return campaignTracking;
        }

        public static long GetCount(List<long> dayWise, int index)
        {
            long dayWiseCount = 0;
            try
            {
                dayWiseCount = dayWise[index];
                return dayWiseCount;
            }
            catch (Exception)
            {
                //
            }
            return dayWiseCount;
        }
    }
}