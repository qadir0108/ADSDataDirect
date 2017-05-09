using System;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Http;
using Newtonsoft.Json;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Helpers
{
    public class ProDataHelper
    {
        private static string _url = "http://campaign-data-analytics.com/report_api/tracking/io/ADS{0}.json";
        private static string prodataAuth = "44d4a9a18500122703d608ed62c0c881";

        public static async void Load()
        {
            string json = File.ReadAllText("C:\\resp.txt");
            ProDataResponse m = JsonConvert.DeserializeObject<ProDataResponse>(json);
        }

        public static ProDataResponse Fetch(string OrderNumber)
        {
            if (ConfigurationManager.AppSettings["IsLive"] == "false")
            {
                OrderNumber = "2199";
            }
            
            ProDataResponse proDataResponse;
            string url = string.Format(_url, OrderNumber);
            using (HttpClient client = new HttpClient())
            {
                client.Timeout = TimeSpan.FromMinutes(1);
                client.DefaultRequestHeaders.Add("X-ProDataFeed-Auth", prodataAuth);
                using (HttpResponseMessage response = client.GetAsync(url).Result)
                using (HttpContent content = response.Content)
                {
                    string responseContent = content.ReadAsStringAsync().Result;
                    proDataResponse = JsonConvert.DeserializeObject<ProDataResponse>(responseContent);
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

        public static void FetchAndUpdate(WFPICTContext db, string OrderNumber)
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