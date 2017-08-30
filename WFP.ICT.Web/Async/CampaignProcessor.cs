using System;
using System.Data.Entity;
using System.Linq;
using System.Text;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;
using WFP.ICT.Web.Async.Helpers;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.ProData;

namespace WFP.ICT.Web.Async
{
    public static class CampaignProcessor
    {
        public static void ProcessNewOrder(string orderNumber, string userName)
        {
            using (var db = new WfpictContext())
            {
                var campaign = db.Campaigns.Include(x => x.Assets).Include(x => x.Segments)
                                 .FirstOrDefault(x => x.OrderNumber == orderNumber);

                var user = db.Users.FirstOrDefault(x => x.UserName == userName);
                var ads = db.Vendors.FirstOrDefault(x => x.Name.Contains("ADS"));

                FileProcessor.ProcessNewOrderFiles(db, campaign);
                EmailHelper.SendOrderEmailToClient(campaign, user, ads?.CcEmails);

                LogHelper.AddLog(db, LogType.Orders, campaign.OrderNumber, "New Order " + campaign.CampaignName + " has been entered into system successfully by " + campaign.RepresentativeName);
            }
        }

        public static void SendToVendor(OrderVia orderVia, Guid? vendorId, string orderNumber, string[] segmentsSelected, string whiteLabelDomain)
        {
            using (var db = new WfpictContext())
            {
                Campaign campaign = db.Campaigns
                    .Include(x => x.Assets)
                    .Include(x => x.Segments)
                    .Include(x => x.Approved)
                    .Include(x => x.Trackings)
                    .FirstOrDefault(x => x.OrderNumber == orderNumber);

                var vendor = db.Vendors.FirstOrDefault(x => x.Id == vendorId);

                if (segmentsSelected == null)
                {
                    SendToVendorSingle(orderVia, db, campaign, vendor, whiteLabelDomain);
                }
                else // Segments
                {
                    SendToVendorMulti(orderVia, db, campaign, vendor, segmentsSelected, whiteLabelDomain);
                }

                // Put campaign to monitoring if no segments is in generated/approved state
                var ifSomeSegmentsRemaining = db.CampaignSegments
                              .Where(c => c.CampaignId == campaign.Id)
                              .Any(x => x.SegmentStatus == (int)SegmentStatus.Generated || x.SegmentStatus == (int)SegmentStatus.Approved);
                if (!ifSomeSegmentsRemaining)
                {
                    campaign.Status = (int)CampaignStatus.Monitoring;
                    db.SaveChanges();
                }

            }
        }

        private static void SendToVendorMulti(OrderVia orderVia, WfpictContext db, Campaign campaign, Vendor vendor, string[] segmentsSelected, string whiteLabelDomain)
        {
            var segments = db.CampaignSegments
                                   .Where(c => c.CampaignId == campaign.Id && segmentsSelected.Contains(c.SegmentNumber))
                                   .ToList();

            foreach (var segment in segments)
            {
                switch (orderVia)
                {
                    case OrderVia.Email:
                        EmailHelper.SendApprovedToVendor(vendor, campaign, segment);
                        break;
                    case OrderVia.Api:
                        var response = ProDataApiManager.Create(campaign, segment, whiteLabelDomain);
                        if (response.status != ProDataApiManager.Success)
                        {
                            throw new AdsException(response.ErrorMessage);
                        }
                        break;
                    default:
                        throw new ArgumentOutOfRangeException(nameof(orderVia), orderVia, null);
                }

                segment.SegmentStatus = (int)SegmentStatus.Monitoring;

                var campaignTracking =
                    db.CampaignTrackings.FirstOrDefault(x => x.CampaignId == campaign.Id && x.SegmentNumber == segment.SegmentNumber);

                if (campaignTracking == null)
                {
                    var trackingId = Guid.NewGuid();
                    var tracking = new CampaignTracking()
                    {
                        Id = trackingId,
                        CreatedAt = DateTime.Now,
                        CampaignId = campaign.Id,
                        OrderNumber = campaign.OrderNumber,
                        SegmentNumber = segment.SegmentNumber,
                        Quantity = segment.Quantity,
                        DateSent = DateTime.Now,
                        IsCreatedThroughApi = false
                    };
                    db.CampaignTrackings.Add(tracking);
                }
                LogHelper.AddLog(db, LogType.ProData, campaign.OrderNumber, $"Segment {segment.SegmentNumber} has been sent to vendor successfully.");
            }
        }

        private static void SendToVendorSingle(OrderVia orderVia, WfpictContext db, Campaign campaign, Vendor vendor, string whiteLabelDomain)
        {
            switch (orderVia)
            {
                case OrderVia.Email:
                    EmailHelper.SendApprovedToVendor(vendor, campaign, null);
                    break;
                case OrderVia.Api:
                    var response = ProDataApiManager.Create(campaign, null, whiteLabelDomain);
                    if (response.status != ProDataApiManager.Success)
                    {
                        throw new AdsException(response.ErrorMessage);
                    }
                    break;
                default:
                    throw new ArgumentOutOfRangeException(nameof(orderVia), orderVia, null);
            }

            string orderNumberRdp = campaign.OrderNumber;
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

            var campaignTracking =
                   db.CampaignTrackings.FirstOrDefault(x => x.CampaignId == campaign.Id && x.OrderNumber == orderNumberRdp && string.IsNullOrEmpty(x.SegmentNumber));

            if (campaignTracking == null)
            {
                var trackingId = Guid.NewGuid();
                var tracking = new CampaignTracking()
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
                db.CampaignTrackings.Add(tracking);
            }

            LogHelper.AddLog(db, LogType.ProData, campaign.OrderNumber, !campaign.ReBroadcasted
                    ? "Order has been sent to vendor successfully."
                    : "Order Rebroad has been sent to vendor sucessfully.");
            db.SaveChanges();
        }
    }
}