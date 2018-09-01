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
        public string SFD_ID { get; set; }
        public string Client_ID { get; set; }
        public string Campaign_Name { get; set; }
        public string From_Line { get; set; }
        public string Subject_Line { get; set; }
        public string URLS { get; set; }
        public string Total_Clicks { get; set; }
        public string Unique_Clicks { get; set; }
        public string Mobile_Clicks { get; set; }

        public static CampaignTrackingMetricDetailVm[] FromCampaignTracking(Campaign campaign, CampaignTracking campaignTracking)
        {
            var urls = new List<CampaignTrackingMetricDetailVm>();

            var proDatas = campaign.ProDatas
                .Where(x => x.OrderNumber == campaignTracking.OrderNumber && x.SegmentNumber == campaignTracking.SegmentNumber)
                .OrderByDescending(x => x.ClickCount);
            
            foreach (var proData in proDatas)
            {
                var model = new CampaignTrackingMetricDetailVm
                {
                    SFD_ID = campaign.Assets.SFDClientId.ToString(),
                    Client_ID = SfidLookup.GetCampaignName(campaign.Assets.SFDClientId),
                    Campaign_Name = campaign.Approved.CampaignName,
                    From_Line = campaign.Approved.FromLine,
                    Subject_Line = campaign.Approved.SubjectLine,
                    Deployment_Date = campaign.Approved.DeployDate?.ToString(StringConstants.DateFormatDashes),

                    URLS = proData.Destination_URL,
                    Total_Clicks = string.Format("{0:n0}", proData.ClickCount),
                    Unique_Clicks = string.Format("{0:n0}", proData.UniqueCnt),
                    Mobile_Clicks = string.Format("{0:n0}", proData.MobileCnt)
                };

                urls.Add(model);
            }
            return urls.ToArray();
        }
    }
}