using System.Collections.Generic;
using System.Linq;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Infrastructure.Db;

namespace ADSDataDirect.Infrastructure.TemplateReports
{
    public class TemplateReportVm
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

        public List<TemplateReportDetailVm> PerLink { get; set; }
        public List<CampaignSegmentVm> Segments { get; set; }

        public static TemplateReportVm FromCampaignTracking(Campaign campaign, CampaignTracking campaignTracking)
        {
            var model = new TemplateReportVm
            {
                CampaignId = campaign.Id.ToString(),
                TrackingId = campaignTracking.Id.ToString(),
                OrderNumber = string.IsNullOrEmpty(campaignTracking.SegmentNumber) ? campaignTracking.OrderNumber : campaignTracking.SegmentNumber,
                CampaignName = campaign.Approved.CampaignName,
                WhiteLabel = campaign.Approved.WhiteLabel,
                SubjectLine = campaign.Approved.SubjectLine,
                FromLine = campaign.Approved.FromLine,
                Quantity = campaignTracking.Quantity.ToString(),
                Status = ((CampaignStatus)campaign.Status).ToString(),
                OrderDate = campaign.CreatedAt.ToString(StringConstants.DateFormatSlashes),
                DateSent = campaignTracking.CreatedAt.ToString(StringConstants.DateFormatSlashes),
                SentOrder = campaignTracking.SentOrder,
                IsCreatedThroughApi = campaignTracking.IsCreatedThroughApi,
                QueuedCampaignId = campaignTracking.QueuedCampaignId,

                IoNumber = campaignTracking.IoNumber,
                StartDate = campaignTracking.StartDate?.ToString(StringConstants.DateFormatSlashes),
                Deployed = campaignTracking.Deployed.ToString(),
                Opened = campaignTracking.Opened.ToString(),
                Clicked = campaignTracking.Clicked.ToString(),
                Unsub = campaignTracking.Unsub.ToString(),
                Forwards = campaignTracking.Forwards.ToString(),
                Bounce = campaignTracking.Bounce.ToString(),
                Opt = campaignTracking.Opt.ToString(),
                Desktop = campaignTracking.Desktop.ToString(),
                Mobile = campaignTracking.Mobile.ToString(),
                RetargetingImpressions = campaignTracking.RetargetingImpressions.ToString(),
                RetargetingClicks = campaignTracking.RetargetingClicks.ToString(),

                DeliveryPercentage = campaignTracking.DeliveryPercentage.ToString("0.0000"),
                OpenedPercentage = campaignTracking.OpenedPercentage.ToString("0.0000"),
                ClickedPercentage = campaignTracking.ClickedPercentage.ToString("0.0000"),
                UnsubPercentage = campaignTracking.UnsubPercentage.ToString("0.0000"),
                ClickToOpenPercentage = campaignTracking.ClickToOpenPercentage.ToString("0.0000"),
                UnsubToOpenPercentage = campaignTracking.UnsubToOpenPercentage.ToString("0.0000"),
                Segments = new List<CampaignSegmentVm>(),
                PerLink = new List<TemplateReportDetailVm>()
            };

            model.Segments = campaign.Segments.Where(x => !string.IsNullOrEmpty(x.SegmentDataFileUrl))
                            .Select(x => new CampaignSegmentVm()
                            {
                                SegmentNumber = x.SegmentNumber,
                                SegmentDataFileUrl = x.SegmentDataFileUrl
                            }).OrderBy(x => x.SegmentNumber).ToList();
            var proDatas = campaign.ProDatas
                .Where(x => x.OrderNumber == campaignTracking.OrderNumber && x.SegmentNumber == campaignTracking.SegmentNumber)
                .OrderByDescending(x => x.ClickCount);

            if (proDatas.Count() == 0) throw new AdsException("Tracking links not found.");

            foreach (var proData in proDatas)
            {
                model.PerLink.Add(new TemplateReportDetailVm()
                {
                    Link = proData.Destination_URL,
                    ClickCount = proData.ClickCount,
                    UniqueCount = proData.UniqueCnt,
                    MobileCount = proData.MobileCnt
                });
            }

            return model;
        }
    }
}