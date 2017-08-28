using System.Collections.Generic;
using System.Linq;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.ProData;

namespace WFP.ICT.Web.Models
{
    public class CampaignTrackingVm
    {
        public string CampaignId { get; set; }
        public string TrackingId { get; set; }
        public string OrderNumber { get; set; }
        public string CampaignName { get; set; }
        public string WhiteLabel { get; set; }
        public string FromLine { get; set; }
        public string SubjectLine { get; set; }
        public string OrderDate { get; set; }
        public string Quantity { get; set; }
        public string Status { get; set; }

        public string IoNumber { get; set; }
        public string StartDate { get; set; }
        public string Opened { get; set; }
        public string Clicked { get; set; }
        public string Unsub { get; set; }
        public string Forwards { get; set; }
        public string OpenedPercentage { get; set; }
        public string ClickedPercentage { get; set; }
        public string UnsubPercentage { get; set; }
        public string ClickToOpenPercentage { get; set; } // CtrPercentage
        public string UnsubToOpenPercentage { get; set; }
        public string Bounce { get; set; }
        public string Opt { get; set; }
        public string Desktop { get; set; }
        public string Mobile { get; set; }

        public List<CampaignTrackingDetailVm> PerLink { get; set; }

        public static CampaignTrackingVm FromCampaignTracking(Campaign campaign, CampaignTracking campaignTracking)
        {
            var model = new CampaignTrackingVm
            {
                CampaignId = campaign.Id.ToString(),
                TrackingId = campaignTracking.Id.ToString(),
                OrderNumber = string.IsNullOrEmpty(campaignTracking.SegmentNumber) ? campaignTracking.OrderNumber : campaignTracking.SegmentNumber,
                CampaignName = campaign.Approved.CampaignName,
                WhiteLabel = campaign.Approved.WhiteLabel,
                SubjectLine = campaign.Approved.SubjectLine,
                FromLine = campaign.Approved.FromLine,
                OrderDate = campaign.CreatedAt.ToString(StringConstants.DateFormatSlashes),
                Status = ((CampaignStatus)campaign.Status).ToString(),

                Quantity = campaignTracking.Quantity.ToString(),
                IoNumber = campaignTracking.IoNumber,
                StartDate = campaignTracking.StartDate?.ToString(StringConstants.DateFormatSlashes),
                Opened = campaignTracking.Opened == 0 ? "NA" : campaignTracking.Opened.ToString(),
                Clicked = campaignTracking.Clicked == 0 ? "NA" : campaignTracking.Clicked.ToString(),
                Unsub = campaignTracking.Unsub == 0 ? "NA" : campaignTracking.Unsub.ToString(),
                Forwards = campaignTracking.Forwards == 0 ? "NA" : campaignTracking.Forwards.ToString(),
                Mobile = campaignTracking.Mobile.ToString(),
                Desktop = campaignTracking.Desktop.ToString(),
                Bounce = campaignTracking.Bounce.ToString(),
                Opt = campaignTracking.Opt.ToString(),
                OpenedPercentage = campaignTracking.OpenedPercentage.ToString("0.00%"),
                ClickedPercentage = campaignTracking.ClickedPercentage.ToString("0.00%"),
                UnsubPercentage = campaignTracking.UnsubPercentage.ToString("0.00%"),
                ClickToOpenPercentage = campaignTracking.ClickToOpenPercentage.ToString("0.00%"),
                UnsubToOpenPercentage = campaignTracking.UnsubToOpenPercentage.ToString("0.00%"),

                PerLink = new List<CampaignTrackingDetailVm>()
            };

            var proDatas = campaign.ProDatas
                .Where(x => x.OrderNumber == campaignTracking.OrderNumber && x.SegmentNumber == campaignTracking.SegmentNumber)
                .OrderBy(x => ProDataHelper.GetIndex(x.Reportsite_URL));

            foreach (var proData in proDatas)
            {
                model.PerLink.Add(new CampaignTrackingDetailVm
                {
                    IoNumber = proData.IO,
                    OrderNumber = proData.Reportsite_URL,
                    Link = proData.Destination_URL,
                    ClickCount = proData.ClickCount.ToString(),
                    UniqueCount = proData.UniqueCnt.ToString(),
                    MobileCount = proData.MobileCnt.ToString()
                });
            }

            return model;
        }
    }
}