using ADSDataDirect.Core.Entities;
using ADSDataDirect.Core.Static;
using ADSDataDirect.Enums;
using System.Collections.Generic;
using System.Linq;

namespace ADSDataDirect.Infrastructure.DataReports
{
    public class CampaignTrackingMetricDetailVm
    {
        public string Deployment_Date { get; set; }
        public int SFD_ID { get; set; }
        public string Client_ID { get; set; }
        public string Campaign_Name { get; set; }
        public string From_Line { get; set; }
        public string Subject_Line { get; set; }
        public string URLS { get; set; }
        public long Total_Clicks { get; set; }
        public long Unique_Clicks { get; set; }
        public long Mobile_Clicks { get; set; }
        public int ID { get; set; }

        public static CampaignTrackingMetricDetailVm[] FromCampaignTracking(Campaign campaign, CampaignTracking campaignTracking)
        {
            var urls = new List<CampaignTrackingMetricDetailVm>();

            var proDatas = campaign.ProDatas
                .Where(x => x.OrderNumber == campaignTracking.OrderNumber && x.SegmentNumber == campaignTracking.SegmentNumber)
                .OrderByDescending(x => x.ClickCount);

            int index = 1;
            foreach (var proData in proDatas)
            {
                var model = new CampaignTrackingMetricDetailVm
                {
                    SFD_ID = campaign.Assets.SFDClientId,
                    Client_ID = SfidLookup.GetCampaignName(campaign.Assets.SFDClientId),
                    Campaign_Name = campaign.Approved.CampaignName,
                    From_Line = campaign.Approved.FromLine,
                    Subject_Line = campaign.Approved.SubjectLine,
                    Deployment_Date = campaign.Approved.DeployDate?.ToString(StringConstants.DateFormatSlashes),

                    URLS = proData.Destination_URL,
                    Total_Clicks = proData.ClickCount, //string.Format("{0:n0}", proData.ClickCount),
                    Unique_Clicks = proData.UniqueCnt,
                    Mobile_Clicks = proData.MobileCnt,
                    ID = index++
                };

                urls.Add(model);
            }
            return urls.ToArray();
        }
    }
}