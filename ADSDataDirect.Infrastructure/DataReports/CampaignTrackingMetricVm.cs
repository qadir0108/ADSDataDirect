using System.Collections.Generic;
using System.Linq;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Core.Static;
using ADSDataDirect.Infrastructure.S3;

namespace ADSDataDirect.Infrastructure.DataReports
{
    public class CampaignTrackingMetricVm
    {
        public int SFD_ID { get; set; }
        public string Client_ID { get; set; }
        public string Campaign_Name { get; set; }
        public string From_Line { get; set; }
        public string Subject_Line { get; set; }
        public string Deployment_Date { get; set; }
        public long Delivered { get; set; }
        public double Open_Rate { get; set; }
        public long Total_Opens { get; set; }
        public long Total_Clicks { get; set; }
        public double Click_Percentage { get; set; }
        public double HTML_CTR { get; set; }
        public long Desktop { get; set; }
        public long Mobile { get; set; }
        public string Image_URL { get; set; }
        
        public static CampaignTrackingMetricVm[] FromCampaignTracking(Campaign campaign, CampaignTracking campaignTracking)
        {
            string filePathLive = $"{S3FileManager.ServerPrefix}{campaign.Assets.OpenModelImageFile}";

            var metrics = new CampaignTrackingMetricVm[1]
            {
                new CampaignTrackingMetricVm
                {
                    SFD_ID = campaign.Assets.SFDClientId,
                    Client_ID = SfidLookup.GetCampaignName(campaign.Assets.SFDClientId),
                    Campaign_Name = campaign.Approved.CampaignName,
                    From_Line = campaign.Approved.FromLine,
                    Subject_Line = campaign.Approved.SubjectLine,
                    Deployment_Date = campaign.Approved.DeployDate?.ToString(StringConstants.DateFormatDashes),
                    Delivered = campaignTracking.Quantity,
                    Open_Rate = campaignTracking.OpenedPercentage,
                    Total_Opens = campaignTracking.Opened,
                    Total_Clicks = campaignTracking.Clicked,
                    Click_Percentage = campaignTracking.ClickedPercentage,
                    HTML_CTR = campaignTracking.ClickToOpenPercentage,
                    Mobile = campaignTracking.Mobile,
                    Desktop = campaignTracking.Desktop,
                    Image_URL = filePathLive
                }
            };
            return metrics;
        }
    }
}