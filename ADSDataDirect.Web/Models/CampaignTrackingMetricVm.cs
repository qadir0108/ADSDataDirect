using System.Collections.Generic;
using System.Linq;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.ProData;
using ADSDataDirect.Core.Static;
using ADSDataDirect.Web.Async.Helpers;

namespace ADSDataDirect.Web.Models
{
    public class CampaignTrackingMetricVm
    {
        public string SFD_ID { get; set; }
        public string Client_ID { get; set; }
        public string Campaign_Name { get; set; }
        public string From_Line { get; set; }
        public string Subject_Line { get; set; }
        public string Deployment_Date { get; set; }
        public string Delivered { get; set; }
        public string Open_Rate { get; set; }
        public string Total_Opens { get; set; }
        public string Total_Clicks { get; set; }
        public string Click_Percentage { get; set; }
        public string HTML_CTR { get; set; }
        public string Desktop { get; set; }
        public string Mobile { get; set; }
        public string Image_URL { get; set; }
        
        public static CampaignTrackingMetricVm[] FromCampaignTracking(Campaign campaign, CampaignTracking campaignTracking)
        {
            string filePathLive = $"{S3FileManager.ServerPrefix}{campaign.Assets.OpenModelImageFile}";

            var metrics = new CampaignTrackingMetricVm[1]
            {
                new CampaignTrackingMetricVm
                {
                    SFD_ID = campaign.Assets.SFDClientId.ToString(),
                    Client_ID = SfidLookup.GetCampaignName(campaign.Assets.SFDClientId),
                    Campaign_Name = campaign.Approved.CampaignName,
                    From_Line = campaign.Approved.FromLine,
                    Subject_Line = campaign.Approved.SubjectLine,
                    Deployment_Date = campaign.Approved.DeployDate?.ToString(StringConstants.DateFormatDashes),
                    Delivered = string.Format("{0:n0}", campaignTracking.Quantity),
                    Open_Rate = campaignTracking.OpenedPercentage.ToString("0.00%"),
                    Total_Opens = campaignTracking.Opened == 0 ? "NA" : string.Format("{0:n0}", campaignTracking.Opened),
                    Total_Clicks = campaignTracking.Clicked == 0 ? "NA" : string.Format("{0:n0}", campaignTracking.Clicked),
                    Click_Percentage = campaignTracking.ClickedPercentage.ToString("0.00%"),
                    HTML_CTR = campaignTracking.ClickToOpenPercentage.ToString("0.00%"),
                    Mobile = string.Format("{0:n0}", campaignTracking.Mobile),
                    Desktop = string.Format("{0:n0}", campaignTracking.Desktop),
                    Image_URL = filePathLive
                }
            };
            return metrics;
        }
    }
}