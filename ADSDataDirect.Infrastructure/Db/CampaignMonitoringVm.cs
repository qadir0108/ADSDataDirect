using System.Collections.Generic;
using System.Linq;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Infrastructure.ProData;

namespace ADSDataDirect.Infrastructure.Db
{
    public class CampaignMonitoringVm
    {
        public string CampaignId { get; set; }
        public string TrackingId { get; set; }
        public string OrderNumber { get; set; }
        public string CampaignName { get; set; }
        public string Quantity { get; set; }
        public string ClicksNeeded { get; set; }
        public string AMPM { get; set; }
        public string StartDate { get; set; }
        public string ClickMeterLink { get; set; }
        public string Day1Clicks { get; set; }
        public string Day1 { get; set; }
        public string Day2Clicks { get; set; }
        public string Day2 { get; set; }
        public string Day3Clicks { get; set; }
        public string Day3 { get; set; }
        public string Day4Clicks { get; set; }
        public string Day4 { get; set; }
        public string Day5Clicks { get; set; }
        public string Day5 { get; set; }
        public string Day6Clicks { get; set; }
        public string Day6 { get; set; }
        public string Day7Clicks { get; set; }
        public string Day7 { get; set; }
        public string Total { get; set; }
        public string Day7PlusClicks { get; set; }
        public string CampaignFill { get; set; }

        public static CampaignMonitoringVm FromCampaignTracking(Campaign campaign, CampaignTracking campaignTracking)
        {
            long Needed = (long)(campaignTracking.Quantity * 3 / 100.0);
            long Total = campaignTracking.Day1Clicks + campaignTracking.Day2Clicks + campaignTracking.Day3Clicks + campaignTracking.Day4Clicks + campaignTracking.Day5Clicks + campaignTracking.Day6Clicks + campaignTracking.Day7Clicks;
            double CampaignFill =(double)Total / Needed;
            var model = new CampaignMonitoringVm
            {
                CampaignId = campaign.Id.ToString(),
                TrackingId = campaignTracking.Id.ToString(),
                OrderNumber = string.IsNullOrEmpty(campaignTracking.SegmentNumber) ? campaignTracking.OrderNumber : campaignTracking.SegmentNumber,
                CampaignName = campaign.Approved.CampaignName,
                Quantity = string.Format("{0:n0}", campaignTracking.Quantity),
                ClicksNeeded = string.Format("{0:n0}", Needed),
                StartDate = campaignTracking.StartDate?.ToString(StringConstants.DateFormatSlashes),
                AMPM = campaignTracking.StartDate?.ToString(StringConstants.TimeFormatAMPM),
                ClickMeterLink = campaign.Testing.ClickMeterRotatorLink,
                Day1 = campaignTracking.StartDate?.ToString(StringConstants.DateFormatSlashes),
                Day2 = campaignTracking.StartDate?.AddDays(1).ToString(StringConstants.DateFormatSlashes),
                Day3 = campaignTracking.StartDate?.AddDays(2).ToString(StringConstants.DateFormatSlashes),
                Day4 = campaignTracking.StartDate?.AddDays(3).ToString(StringConstants.DateFormatSlashes),
                Day5 = campaignTracking.StartDate?.AddDays(4).ToString(StringConstants.DateFormatSlashes),
                Day6 = campaignTracking.StartDate?.AddDays(5).ToString(StringConstants.DateFormatSlashes),
                Day7 = campaignTracking.StartDate?.AddDays(6).ToString(StringConstants.DateFormatSlashes),
                Day1Clicks = string.Format("{0:n0}", campaignTracking.Day1Clicks),
                Day2Clicks = string.Format("{0:n0}", campaignTracking.Day2Clicks),
                Day3Clicks = string.Format("{0:n0}", campaignTracking.Day3Clicks),
                Day4Clicks = string.Format("{0:n0}", campaignTracking.Day4Clicks),
                Day5Clicks = string.Format("{0:n0}", campaignTracking.Day5Clicks),
                Day6Clicks = string.Format("{0:n0}", campaignTracking.Day6Clicks),
                Day7Clicks = string.Format("{0:n0}", campaignTracking.Day7Clicks),
                Day7PlusClicks = string.Format("{0:n0}", campaignTracking.Day7PlusClicks),
                Total = string.Format("{0:n0}", Total),
                CampaignFill = CampaignFill.ToString("0.00%")
            };
            return model;
        }
    }
}