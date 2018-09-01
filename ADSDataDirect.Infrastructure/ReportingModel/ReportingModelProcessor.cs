using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Infrastructure.Csv;
using ADSDataDirect.Infrastructure.ProData;
using ADSDataDirect.Infrastructure.S3;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace ADSDataDirect.Infrastructure.ReportingModel
{
    public class OpenModelProcessor : ProDataApiManager
    {
        readonly static string clientCode = System.Configuration.ConfigurationManager.AppSettings["ClientCode"];

        public static void PopulateFakeData(WfpictContext db, Campaign campaign, string UploadPath)
        {
            // Process Links file
            string filePath = Path.Combine(UploadPath, campaign.Assets.OpenModelLinksFile);
            S3FileManager.Download(campaign.Assets.OpenModelLinksFile, filePath);
            List<string> links = CsvReader.ReadCsv(filePath);
            PopulateFakeData(db, campaign, links);
        }

        public static void PopulateFakeData(WfpictContext db, Campaign campaign, List<string> links)
        {
            if(string.IsNullOrEmpty(campaign.Approved.WhiteLabel))
                throw new AdsException("Please select white label on campaign approved screen.");

            var customer = db.Customers.FirstOrDefault(x => x.WhiteLabel == campaign.Approved.WhiteLabel);
            if (customer == null)
                throw new AdsException("White label on campaign approved screen is invalid.");

            Random r = new Random();
            int clicksRandom = r.Next((int)customer.ClickInitial, (int)customer.ClickEnd);
            long clickCountTotal = (long)((clicksRandom * campaign.Approved.Quantity / 100000.0) / 100.0);

            var keywords = db.OpenModelKeywords.ToList();

            double firstPercentage = (double)(r.Next(120000, 150000));
            double percentage = firstPercentage;
            List<ClickModel> clicks = new List<ClickModel>();
            foreach (var l in links)
            {
                var m = new ClickModel()
                {
                    Link = l,
                };

                float overRidePercentage = -1f;

                foreach (var k in keywords)
                {
                    if (l.Contains(k.Keyword)) {
                        overRidePercentage = k.RulePercentage;
                        break;
                    }
                }
                if (overRidePercentage != -1) {
                    m.Percentage = overRidePercentage;
                } else
                {
                    m.Percentage = percentage / 10000.0;
                    // decrement random for next link  0.1 - firstPercentage
                    percentage = firstPercentage - (r.Next(2000, (int)firstPercentage));
                }
                m.Clicks = (int) (m.Percentage / 100.0 * (double)clickCountTotal);
                clicks.Add(m);
            }

            string orderNumber = campaign.ReBroadcasted ? $"{clientCode}{campaign.ReBroadcastedOrderNumber}" : $"{clientCode}{campaign.OrderNumber}";

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

            SaveProData(db, campaign.Id, campaign.OrderNumber, string.Empty, data);
            var campaignTracking = UpdateTracking(db, campaign, campaign.OrderNumber, string.Empty, data, customer);
            //var settings = SettingsManager.Instance.LoadSettings(db);
            //SaveNotification(db, settings, campaign.Id, campaign.OrderNumber, string.Empty, campaign.Approved.DeployDate, data.ResponseStatus, campaignTracking);

        }
    }
}