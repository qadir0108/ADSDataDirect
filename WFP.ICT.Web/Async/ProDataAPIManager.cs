using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using Newtonsoft.Json;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Async
{
    public class ProDataAPIManager
    {
        private static string _urlTracking = "http://campaign-data-analytics.com/report_api/tracking/io/ADS{0}.json";
        private static string _urlCreateOrder = "http://www1.report-site.com/report_api/ads_create_campaign/format/json";
        private static string prodataAuth = "44d4a9a18500122703d608ed62c0c881";
        public static readonly string SUCCESS = "SUCCESS";
        public static readonly string ERROR = "ERROR";

        private static readonly Dictionary<string, string> whiteLabelDictionary = new Dictionary<string, string>()
        {
            {"MM", "ameliorate-reporting.com"},
            {"A", "email.ach-reporting.com"},
            {"B", "email.digital2dealer-reporting.com"},
            {"C", "email.marketmasters-reporting.com"},
            {"D", "email.newfoundmedia-reporting.com"},
            {"E", "reporting.advantagedealsv.com"},
            {"F", "reporting.consumermkts.com"},
            {"G", "reporting.eworksemail.com"}
        };

        public static async void Load()
        {
            string json = File.ReadAllText("C:\\resp.txt");
            ProDataResponse m = JsonConvert.DeserializeObject<ProDataResponse>(json);
        }

        public static ProDataResponse Create(Campaign campaign, CampaignSegment segment)
        {
            string whiteLabel = whiteLabelDictionary.ContainsKey(campaign.Approved.WhiteLabel)
                ? whiteLabelDictionary[campaign.Approved.WhiteLabel]
                : whiteLabelDictionary["MM"];

            ProDataRequest request = new ProDataRequest()
            {
                io = campaign.OrderNumber,
                campaign_name = campaign.Approved.CampaignName,
                is_rebroadcast = campaign.Approved.ReBroadCast ? "Y" : "N",
                white_label = whiteLabel,
                creative_url = campaign.Assets.CreativeUrl,
                quantity = campaign.Approved.Quantity,
                geo_type = "POSTALCODE",
                geo_url = campaign.Assets.ZipCodeUrl,
                ctr_percent = 0.023,
                subject = campaign.Approved.SubjectLine,
                from_name = campaign.Approved.FromLine,
                from_email = campaign.RepresentativeEmail,
                deploy_date = campaign.Approved.DeployDate?.ToString(StringConstants.DateTimeFormatDashes),
            };

            if (campaign.Approved.IsOpenPixel)
            {
                request.is_open_pixel = "Y";
                request.open_percent = campaign.Approved.OpenGoals/campaign.Approved.Quantity;
                request.open_pixel = campaign.Approved.OpenPixelUrl;
            } else
                request.is_open_pixel = "N";

            if (segment != null)
            {
                request.is_data_file = "Y";
                request.data_file_url = segment.SegmentDataFileUrl;
                request.data_file_replacement_param = segment.SegmentNumber;
                request.data_file_replacement_column = "0";
                request.data_file_unique_ip = "Y";
            } else
                request.is_data_file = "N";
            
            return Create(request);
        }

        private static ProDataResponse Create(ProDataRequest request)
        {
            using (HttpClient client = new HttpClient())
            {
                client.Timeout = TimeSpan.FromMinutes(1);
                client.DefaultRequestHeaders.Add("X-ProDataFeed-Auth", prodataAuth);
                var httpContent = new StringContent(request.ToJson(), Encoding.UTF8, "application/json");
                using (HttpResponseMessage response = client.PostAsync(_urlCreateOrder, httpContent).Result)
                using (HttpContent content = response.Content)
                {
                    string responseContent = content.ReadAsStringAsync().Result;
                    ProDataResponse proDataResponse;
                    try
                    {
                        proDataResponse = JsonConvert.DeserializeObject<ProDataResponse>(responseContent);
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("There is error in parsing data from ProData. Problem in ProData API.");
                    }

                    return proDataResponse;
                }
            }
        }

        private static ProDataResponse Fetch(string OrderNumber)
        {
            if (ConfigurationManager.AppSettings["IsLive"] == "false")
            {
                OrderNumber = "2752";
            }

            ProDataResponse proDataResponse;
            string url = string.Format(_urlTracking, OrderNumber);
            using (HttpClient client = new HttpClient())
            {
                client.Timeout = TimeSpan.FromMinutes(1);
                client.DefaultRequestHeaders.Add("X-ProDataFeed-Auth", prodataAuth);
                using (HttpResponseMessage response = client.GetAsync(url).Result)
                using (HttpContent content = response.Content)
                {
                    string responseContent = content.ReadAsStringAsync().Result;
                    try
                    {
                        proDataResponse = JsonConvert.DeserializeObject<ProDataResponse>(responseContent);
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("There is error in parsing data from ProData. Problem in ProData API.");
                    }

                    return proDataResponse;
                }
            }
        }

        private static void AddLog(WFPICTContext db, string OrderNumber, string Message)
        {
            db.ProDataAPILogs.Add(new ProDataAPILog()
            {
                Id = Guid.NewGuid(),
                CreatedAt = DateTime.Now,
                OrderNumber = OrderNumber,
                Message = Message
            });
            db.SaveChanges();
        }

        public static void FetchAndUpdateProDatas(WFPICTContext db, string OrderNumber)
        {
            var logs = db.ProDataAPILogs.Where(x => x.OrderNumber == OrderNumber);
            foreach (var log in logs)
            {
                db.ProDataAPILogs.Remove(log);
            }
            db.SaveChanges();

            AddLog(db, OrderNumber, string.Format("Order Number:{0}, Starting refresh at {1} ", OrderNumber, DateTime.Now));
            AddLog(db, OrderNumber, string.Format("Order Number:{0}, Deleting Old ProData ", OrderNumber));

            var campagin = db.Campaigns.FirstOrDefault(x => x.OrderNumber == OrderNumber);
            var proDatas = db.ProDatas.Where(x => x.CampaignId == campagin.Id);
            foreach (var proData in proDatas)
            {
                db.ProDatas.Remove(proData);
            }
            db.SaveChanges();

            var data = Fetch(OrderNumber);
            if (data.reports != null && data.reports.report != null)
            {
                var reports = data.reports.report;
                AddLog(db, OrderNumber, string.Format("Order Number:{0}, {1} records fetched from ProData ", OrderNumber, reports.Length));
                foreach (var report in reports)
                {
                    db.ProDatas.Add(new ProData()
                    {
                        Id = Guid.NewGuid(),
                        CreatedAt = DateTime.Now,
                        CampaignId = campagin.Id,
                        CampaignName = report.CampaignName,
                        Reportsite_URL = report.Reportsite_URL,
                        Destination_URL = report.Destination_URL,
                        CampaignStartDate = report.CampaignStartDate,
                        ClickCount = long.Parse(report.ClickCount),
                        UniqueCnt = report.UniqueCnt,
                        MobileCnt = report.MobileCnt,
                        ImpressionCnt = report.ImpressionCnt,
                        IO = report.IO
                    });
                }
                db.SaveChanges();
                AddLog(db, OrderNumber, string.Format("Order Number:{0}, Refresh completed successfully at {1} ", OrderNumber, DateTime.Now));
            }
            else
            {
                AddLog(db, OrderNumber, string.Format("Order Number:{0}, Prodata response. {1} ", OrderNumber, data.ToJson()));
                throw new Exception("There is error in getting data from ProData. Problem in ProData API.");
            }
            
        }

        public static void FetchAndUpdateTrackings(WFPICTContext db, string OrderNumber)
        {
            var logs = db.ProDataAPILogs.Where(x => x.OrderNumber == OrderNumber);
            foreach (var log in logs)
            {
                db.ProDataAPILogs.Remove(log);
            }
            db.SaveChanges();

            AddLog(db, OrderNumber, string.Format("Order Number:{0}, Starting refresh at {1} ", OrderNumber, DateTime.Now));
            AddLog(db, OrderNumber, string.Format("Order Number:{0}, Deleting Old ProData ", OrderNumber));

            var campagin = db.Campaigns.FirstOrDefault(x => x.OrderNumber == OrderNumber);
            var proDatas = db.ProDatas.Where(x => x.CampaignId == campagin.Id);
            foreach (var proData in proDatas)
            {
                db.ProDatas.Remove(proData);
            }
            db.SaveChanges();

            var data = Fetch(OrderNumber);
            if (data.reports != null && data.reports.report != null)
            {
                var reports = data.reports.report;
                AddLog(db, OrderNumber, string.Format("Order Number:{0}, {1} records fetched from ProData ", OrderNumber, reports.Length));
                foreach (var report in reports)
                {
                    db.ProDatas.Add(new ProData()
                    {
                        Id = Guid.NewGuid(),
                        CreatedAt = DateTime.Now,
                        CampaignId = campagin.Id,
                        CampaignName = report.CampaignName,
                        Reportsite_URL = report.Reportsite_URL,
                        Destination_URL = report.Destination_URL,
                        CampaignStartDate = report.CampaignStartDate,
                        ClickCount = long.Parse(report.ClickCount),
                        UniqueCnt = report.UniqueCnt,
                        MobileCnt = report.MobileCnt,
                        ImpressionCnt = report.ImpressionCnt,
                        IO = report.IO
                    });
                }
                db.SaveChanges();
                AddLog(db, OrderNumber, string.Format("Order Number:{0}, Refresh completed successfully at {1} ", OrderNumber, DateTime.Now));
            }
            else
            {
                AddLog(db, OrderNumber, string.Format("Order Number:{0}, Prodata response. {1} ", OrderNumber, data.ToJson()));
                throw new Exception("There is error in getting data from ProData. Problem in ProData API.");
            }

        }

    }
}