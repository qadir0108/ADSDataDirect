using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using ADSDataDirect.Enums;
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
            OrderNumber = "2199";

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
        
        public static void FetchAndUpdate(WFPICTContext db, string OrderNumber)
        {
            var campagin = db.Campaigns.FirstOrDefault(x => x.OrderNumber == OrderNumber && x.ParentOrderNumber == null);
            var proDatas = db.ProDatas.Where(x => x.CampaignId == campagin.Id);
            foreach (var proData in proDatas)
            {
                db.ProDatas.Remove(proData);
            }
            db.SaveChanges();

            foreach (var report in Fetch(OrderNumber).reports.report)
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
        }
    }
}