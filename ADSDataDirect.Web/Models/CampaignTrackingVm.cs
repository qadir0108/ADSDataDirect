using System.Collections.Generic;
using System.Linq;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.ProData;

namespace ADSDataDirect.Web.Models
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
        public string Quantity { get; set; }
        public string Status { get; set; }
        public string OrderDate { get; set; }
        public string DateSent { get; set; }
        public string SentOrder { get; set; }
        public bool IsCreatedThroughApi { get; set; }
        public string QueuedCampaignId { get; set; }

        public string IoNumber { get; set; }
        public string StartDate { get; set; }
        public string Deployed { get; set; }
        public string Opened { get; set; }
        public string Clicked { get; set; }
        public string Unsub { get; set; }
        public string Forwards { get; set; }
        public string DeliveryPercentage { get; set; }
        public string OpenedPercentage { get; set; }
        public string ClickedPercentage { get; set; }
        public string UnsubPercentage { get; set; }
        public string ClickToOpenPercentage { get; set; } // CtrPercentage
        public string UnsubToOpenPercentage { get; set; }
        public string Bounce { get; set; }
        public string Opt { get; set; }
        public string Desktop { get; set; }
        public string Mobile { get; set; }
        public string RetargetingImpressions { get; set; }
        public string RetargetingClicks { get; set; }

        public List<CampaignTrackingDetailVm> PerLink { get; set; }
        public List<CampaignSegmentVm> Segments { get; set; }

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
                Quantity = string.Format("{0:n0}", campaignTracking.Quantity),
                Status = ((CampaignStatus)campaign.Status).ToString(),
                OrderDate = campaign.CreatedAt.ToString(StringConstants.DateFormatSlashes),
                DateSent = campaignTracking.CreatedAt.ToString(StringConstants.DateFormatSlashes),
                SentOrder = campaignTracking.SentOrder,
                IsCreatedThroughApi = campaignTracking.IsCreatedThroughApi,
                QueuedCampaignId = campaignTracking.QueuedCampaignId,

                IoNumber = campaignTracking.IoNumber,
                StartDate = campaignTracking.StartDate?.ToString(StringConstants.DateFormatSlashes),
                Deployed = campaignTracking.Deployed == 0 ? "NA" : string.Format("{0:n0}", campaignTracking.Deployed),
                Opened = campaignTracking.Opened == 0 ? "NA" : string.Format("{0:n0}", campaignTracking.Opened),
                Clicked = campaignTracking.Clicked == 0 ? "NA" : string.Format("{0:n0}", campaignTracking.Clicked),
                Unsub = campaignTracking.Unsub == 0 ? "NA" : string.Format("{0:n0}", campaignTracking.Unsub),
                Forwards = campaignTracking.Forwards == 0 ? "NA" : string.Format("{0:n0}", campaignTracking.Forwards),
                Bounce = string.Format("{0:n0}", campaignTracking.Bounce),
                Opt = string.Format("{0:n0}", campaignTracking.Opt),
                Desktop = string.Format("{0:n0}", campaignTracking.Desktop),
                Mobile = string.Format("{0:n0}", campaignTracking.Mobile),
                RetargetingImpressions = string.Format("{0:n0}", campaignTracking.RetargetingImpressions),
                RetargetingClicks = string.Format("{0:n0}", campaignTracking.RetargetingClicks),

                DeliveryPercentage = campaignTracking.DeliveryPercentage.ToString("0.00%"),
                OpenedPercentage = campaignTracking.OpenedPercentage.ToString("0.00%"),
                ClickedPercentage = campaignTracking.ClickedPercentage.ToString("0.00%"),
                UnsubPercentage = campaignTracking.UnsubPercentage.ToString("0.00%"),
                ClickToOpenPercentage = campaignTracking.ClickToOpenPercentage.ToString("0.00%"),
                UnsubToOpenPercentage = campaignTracking.UnsubToOpenPercentage.ToString("0.00%"),
                Segments = new List<CampaignSegmentVm>(),
                PerLink = new List<CampaignTrackingDetailVm>()
            };

            model.Segments = campaign.Segments.Where(x => !string.IsNullOrEmpty(x.SegmentDataFileUrl))
                            .Select(x => new CampaignSegmentVm()
                            {
                                SegmentNumber = x.SegmentNumber,
                                SegmentDataFileUrl = x.SegmentDataFileUrl
                            }).OrderBy(x => x.SegmentNumber).ToList();
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
                    ClickCount = string.Format("{0:n0}", proData.ClickCount),
                    UniqueCount = string.Format("{0:n0}", proData.UniqueCnt),
                    MobileCount = string.Format("{0:n0}", proData.MobileCnt)
                });
            }
            return model;
        }
    }
}