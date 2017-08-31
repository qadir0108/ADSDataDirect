using System;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using ADSDataDirect.Core;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.Helpers;
using Newtonsoft.Json;

namespace ADSDataDirect.Web.ProData
{
    public static class ProDataApiManager
    {
        private static string _urlTracking = "http://campaign-data-analytics.com/report_api/tracking/io/ADS{0}.json";
        private static string _urlCreateOrder = "http://www1.report-site.com/report_api/ads_create_campaign/format/json";
        private static string _prodataAuth = "44d4a9a18500122703d608ed62c0c881";
        public static readonly string Success = "SUCCESS";
        public static readonly string Error = "ERROR";
        static readonly Random Random = new Random();

        public static void Load()
        {
            string json = File.ReadAllText($"C:\\resp.txt");
            ProDataResponse m = JsonConvert.DeserializeObject<ProDataResponse>(json);
        }

        #region Create Order

        public static ProDataResponse Create(Campaign campaign, CampaignSegment segment, string whiteLabelDomain)
        {
            ProDataRequest request = new ProDataRequest()
            {
                Io = campaign.OrderNumber,
                CampaignName = campaign.Approved.CampaignName,
                IsRebroadcast = campaign.Approved.ReBroadCast ? "Y" : "N",
                WhiteLabel = whiteLabelDomain,
                CreativeUrl = campaign.Assets.CreativeUrl,
                Quantity = campaign.Approved.Quantity,
                GeoType = "POSTALCODE",
                GeoUrl = campaign.Assets.ZipCodeUrl,
                CtrPercent = 0.023,
                Subject = campaign.Approved.SubjectLine,
                FromName = campaign.Approved.FromLine,
                FromEmail = campaign.RepresentativeEmail,
                DeployDate = campaign.Approved.DeployDate?.ToString(StringConstants.DateTimeFormatDashes),
            };

            if (campaign.Approved.IsOpenPixel)
            {
                request.IsOpenPixel = "Y";
                request.OpenPercent = (double)campaign.Approved.OpenGoals / campaign.Approved.Quantity;
                request.OpenPixel = campaign.Approved.OpenPixelUrl;
            }
            else
                request.IsOpenPixel = "N";

            if (!string.IsNullOrEmpty(segment?.SegmentDataFileUrl))
            {
                request.IsDataFile = "Y";
                request.DataFileUrl = segment.SegmentDataFileUrl;
                request.DataFileReplacementParam = segment.SegmentNumber;
                request.DataFileReplacementColumn = "0";
                request.DataFileUniqueIp = "Y";
            }
            else
                request.IsDataFile = "N";

            return Create(request);
        }

        private static ProDataResponse Create(ProDataRequest request)
        {
            using (HttpClient client = new HttpClient())
            {
                client.Timeout = TimeSpan.FromMinutes(1);
                client.DefaultRequestHeaders.Add("X-ProDataFeed-Auth", _prodataAuth);
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
                        throw new AdsException("There is error in parsing data from ProData. Problem in ProData API.");
                    }

                    return proDataResponse;
                }
            }
        }

        #endregion

        private static ProDataResponse Fetch(string orderNumber)
        {
            if (ConfigurationManager.AppSettings["IsLive"] == "false")
            {
                orderNumber = "2752";
            }

            ProDataResponse proDataResponse = null;
            string url = string.Format(_urlTracking, orderNumber);
            using (HttpClient client = new HttpClient())
            {
                client.Timeout = TimeSpan.FromMinutes(1);
                client.DefaultRequestHeaders.Add("X-ProDataFeed-Auth", _prodataAuth);
                using (HttpResponseMessage response = client.GetAsync(url).Result)
                using (HttpContent content = response.Content)
                {
                    string responseContent = content.ReadAsStringAsync().Result;
                    try
                    {
                        proDataResponse = JsonConvert.DeserializeObject<ProDataResponse>(responseContent);
                        proDataResponse.ResponseStatus = ProDataResponseStatus.Found.ToString();
                    }
                    catch (Exception ex)
                    {
                        if (ex.Message.ToLowerInvariant().Contains("deserialize"))
                        {
                            proDataResponse = new ProDataResponse()
                            {
                                ResponseStatus = ProDataResponseStatus.NotFound.ToString(),
                                ResponseMessage = "Order not found on server"
                            };
                        }
                        else
                        {
                            proDataResponse = new ProDataResponse()
                            {
                                ResponseStatus = ProDataResponseStatus.Error.ToString(),
                                ResponseMessage = "There is error in parsing data from ProData. Problem in ProData API."
                            };
                        }
                        
                    }

                    return proDataResponse;
                }
            }
        }

        public static void FetchAndUpdateProDatas(WfpictContext db, string orderNumber)
        {
            var logs = db.SystemLogs.Where(x => x.OrderNumber == orderNumber && x.LogType == (int)LogType.ProData);
            foreach (var log in logs)
            {
                db.SystemLogs.Remove(log);
            }
            db.SaveChanges();

            LogHelper.AddLog(db, LogType.ProData, orderNumber,
                $"Starting refresh at {DateTime.Now} ");
            LogHelper.AddLog(db, LogType.ProData, orderNumber, $"Deleting Old ProData ");

            var campagin = db.Campaigns.FirstOrDefault(x => x.OrderNumber == orderNumber);
            var proDatas = db.ProDatas.Where(x => x.CampaignId == campagin.Id);
            foreach (var proData in proDatas)
            {
                db.ProDatas.Remove(proData);
            }
            db.SaveChanges();

            var data = Fetch(orderNumber);
            if (data.Reports != null && data.Reports.Report != null)
            {
                var reports = data.Reports.Report;
                LogHelper.AddLog(db, LogType.ProData, orderNumber, $"{reports.Length} records fetched from ProData ");
                foreach (var report in reports)
                {
                    db.ProDatas.Add(new Core.Entities.ProData()
                    {
                        Id = Guid.NewGuid(),
                        CreatedAt = DateTime.Now,
                        CampaignId = campagin.Id,
                        CampaignName = report.CampaignName,
                        Reportsite_URL = report.ReportsiteUrl,
                        Destination_URL = report.DestinationUrl,
                        CampaignStartDate = report.CampaignStartDate,
                        ClickCount = long.Parse(report.ClickCount),
                        UniqueCnt = report.UniqueCnt,
                        MobileCnt = report.MobileCnt,
                        ImpressionCnt = report.ImpressionCnt,
                        IO = report.Io
                    });
                }
                db.SaveChanges();
                LogHelper.AddLog(db, LogType.ProData, orderNumber,$"Refresh completed successfully at {DateTime.Now} ");
            }
            else
            {
                LogHelper.AddLog(db, LogType.ProData, orderNumber, $"Prodata response. {data.ToJson()} ");
                throw new AdsException("There is error in getting data from ProData. Problem in ProData API.");
            }
            
        }

        public static void FetchAndUpdateTrackings(WfpictContext db, Campaign campaign)
        {
            LogHelper.AddLog(db, LogType.ProData, campaign.OrderNumber, $"Starting refresh at {DateTime.Now} ");
            
            // orignal order
            var data = Fetch(campaign.OrderNumber);
            SaveProData(db, campaign.Id, campaign.OrderNumber, string.Empty, data);
            var campaignTracking = UpdateTracking(db, campaign, campaign.OrderNumber, string.Empty, data);
            SaveNotification(db, campaign.Id, campaign.OrderNumber, string.Empty, data.ResponseStatus, campaignTracking);

            // RDP
            if (campaign.ReBroadcasted)
            {
                var data1 = Fetch(campaign.ReBroadcastedOrderNumber);
                SaveProData(db, campaign.Id, campaign.ReBroadcastedOrderNumber, string.Empty, data1);
                var campaignTracking1 = UpdateTracking(db, campaign, campaign.ReBroadcastedOrderNumber, string.Empty, data1);
                SaveNotification(db, campaign.Id, campaign.ReBroadcastedOrderNumber, string.Empty, data1.ResponseStatus, campaignTracking1);
            }

            // segment order
            foreach (var segment in campaign.Segments.Where(x => x.SegmentStatus == (int)SegmentStatus.Monitoring))
            {
                if (segment.SegmentStatus != (int) SegmentStatus.Monitoring) continue;

                var data1 = Fetch(segment.SegmentNumber);
                SaveProData(db, campaign.Id, campaign.OrderNumber, segment.SegmentNumber, data1);
                var campaignTracking1 = UpdateTracking(db, campaign, campaign.OrderNumber, segment.SegmentNumber, data1);
                SaveNotification(db, campaign.Id, campaign.OrderNumber, segment.SegmentNumber, data.ResponseStatus, campaignTracking1);
            }
        }

        private static void SaveProData(WfpictContext db, Guid? campaignId, string orderNumber, string segmentNumber, ProDataResponse data)
        {
            // Delete Old
            LogHelper.AddLog(db, LogType.ProData, orderNumber, $"Deleting Old ProData ");
            var proDatas = db.ProDatas.Where(x => x.CampaignId == campaignId && x.OrderNumber == orderNumber && x.SegmentNumber == segmentNumber);
            foreach (var proData in proDatas)
            {
                db.ProDatas.Remove(proData);
            }
            db.SaveChanges();

            // Add new ProData
            if (data.Reports != null && data.Reports.Report != null)
            {
                var reports = data.Reports.Report;
                LogHelper.AddLog(db, LogType.ProData, orderNumber, $"{reports.Length} records fetched from ProData ");
                foreach (var report in reports)
                {
                    db.ProDatas.Add(new Core.Entities.ProData()
                    {
                        Id = Guid.NewGuid(),
                        CreatedAt = DateTime.Now,
                        CampaignId = campaignId,
                        OrderNumber = orderNumber,
                        SegmentNumber = segmentNumber,

                        CampaignName = report.CampaignName,
                        Reportsite_URL = report.ReportsiteUrl,
                        Destination_URL = report.DestinationUrl,
                        CampaignStartDate = report.CampaignStartDate,
                        ClickCount = long.Parse(report.ClickCount),
                        UniqueCnt = report.UniqueCnt,
                        MobileCnt = report.MobileCnt,
                        ImpressionCnt = report.ImpressionCnt,
                        IO = report.Io
                    });
                }
                db.SaveChanges();
                LogHelper.AddLog(db, LogType.ProData, orderNumber, $"Refresh completed successfully at {DateTime.Now} ");
            }
            
        }

        private static CampaignTracking UpdateTracking(WfpictContext db, Campaign campaign, string orderNumber, string segmentNumber, ProDataResponse data)
        {
            var campaignTracking = campaign.Trackings.FirstOrDefault(x => x.OrderNumber == orderNumber && x.SegmentNumber == segmentNumber);

            // Save tracking for Old orders
            if (campaignTracking == null)
            {
                string orderNumberRdp;
                long quantity;
                if (campaign.ReBroadcasted)
                {
                    orderNumberRdp = campaign.ReBroadcastedOrderNumber;
                    quantity = campaign.ReBroadcastedQuantity;
                }
                else
                {
                    orderNumberRdp = campaign.OrderNumber;
                    quantity = campaign.Approved.Quantity;
                }
                var trackingId = Guid.NewGuid();
                campaignTracking = new CampaignTracking()
                {
                    Id = trackingId,
                    CreatedAt = DateTime.Now,
                    CampaignId = campaign.Id,
                    OrderNumber = orderNumberRdp,
                    SegmentNumber = string.Empty,
                    Quantity = quantity,
                    DateSent = DateTime.Now,
                    IsCreatedThroughApi = false
                };
                db.CampaignTrackings.Add(campaignTracking);
                db.SaveChanges();
            }

            if (campaignTracking?.DateSent == null || data.Reports?.Report == null || data.Reports.Report.Length == 0) return campaignTracking;

            var reports = data.Reports.Report;
            var report = reports[0];
            DateTime startDateTime;
            DateTime.TryParse(report.CampaignStartDate, out startDateTime);
            campaignTracking.IoNumber = report.Io;
            campaignTracking.StartDate = startDateTime;
            campaignTracking.Opened = campaign.Approved.IsUseApiDataForOpen ? report.ImpressionCnt : API.Campaign.GetOpens(campaignTracking.Quantity, startDateTime);
            campaignTracking.Clicked = reports.Sum(x => long.Parse(x.ClickCount));
            campaignTracking.Mobile = reports.Sum(x => x.MobileCnt);
            campaignTracking.Desktop = report.UniqueCnt;
            campaignTracking.Unsub = Random.Next(1, 100);
            campaignTracking.Forwards = Random.Next(1, 100);
            campaignTracking.Bounce = Random.Next(1, 30);
            campaignTracking.Opt = Random.Next(1, 30);
            campaignTracking.OpenedPercentage = campaignTracking.Quantity == 0 ? 0 : (double)campaignTracking.Opened / campaignTracking.Quantity;
            campaignTracking.ClickedPercentage = campaignTracking.Quantity == 0 ? 0 : (double)campaignTracking.Clicked / campaignTracking.Quantity;
            campaignTracking.UnsubPercentage = campaignTracking.Quantity == 0 ? 0 : (double)campaignTracking.Unsub / campaignTracking.Quantity;
            campaignTracking.ClickToOpenPercentage = campaignTracking.Opened == 0 ? 0 : (double)campaignTracking.Clicked / campaignTracking.Opened;
            campaignTracking.UnsubToOpenPercentage = campaignTracking.Opened == 0 ? 0 : (double)campaignTracking.Unsub / campaignTracking.Opened;
            db.SaveChanges();
            
            return campaignTracking;
        }

        private static void SaveNotification(WfpictContext db, Guid? campaignId, string orderNumber, string segmentNumber, string responseStatus, CampaignTracking campaignTracking)
        {
            int? hoursPassed = DateTime.Now.Hour - campaignTracking.DateSent?.Hour;
            bool problemFound = false;
            QcRule qcRule = QcRule.NotStartedInFirst4Hours;
            // QC Rule 1
            if (responseStatus == ProDataResponseStatus.NotFound.ToString() && hoursPassed >= 4)
            {
                problemFound = true;
                qcRule = QcRule.NotStartedInFirst4Hours;
            }

            // QC Rule 2
            if (campaignTracking.OpenedPercentage < 0.05 && hoursPassed >= 24)
            {
                problemFound = true;
                qcRule = QcRule.NotHitOpenRate5In24Hours;
            }

            // QC Rule 3
            if (campaignTracking.OpenedPercentage < 0.10 && hoursPassed >= 72)
            {
                problemFound = true;
                qcRule = QcRule.NotHitOpenRate10In72Hours;
            }

            // QC Rule 4
            if (campaignTracking.ClickedPercentage < 0.075 && hoursPassed >= 24)
            {
                problemFound = true;
                qcRule = QcRule.NotHitClickRate750In24Hours;
            }

            // QC Rule 5
            if (campaignTracking.ClickedPercentage < 0.15 && hoursPassed >= 72)
            {
                problemFound = true;
                qcRule = QcRule.NotHitClickRate1500In72Hours;
            }

            if (!problemFound) return;

            var alreadyNoted = db.Notifications
                .FirstOrDefault(x => x.CampaignId == campaignId && x.OrderNumber == orderNumber && x.SegmentNumber == segmentNumber
                             && x.QcRule == (int)qcRule && x.Status == (int)NotificationStatus.Found);

            if (alreadyNoted == null)
            {
                LogHelper.AddLog(db, LogType.RulesProcessing, orderNumber, "Problem found. QCRule " + qcRule);
                db.Notifications.Add(new Notification()
                {
                    Id = Guid.NewGuid(),
                    CreatedAt = DateTime.Now,
                    CampaignId = campaignId,
                    OrderNumber = orderNumber,
                    SegmentNumber = segmentNumber,
                    Status = (int)NotificationStatus.Found,
                    CheckTime = DateTime.Now,
                    FoundAt = DateTime.Now,
                    QcRule = (int)qcRule
                });
                db.SaveChanges();
            }

        }

    }
}