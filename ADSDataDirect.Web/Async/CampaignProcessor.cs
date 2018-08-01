using System;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using ADSDataDirect.Core;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.Async.Helpers;
using ADSDataDirect.Web.Helpers;
using ADSDataDirect.Web.ProData;

namespace ADSDataDirect.Web.Async
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
                FileProcessor.ProcessNewOrderFiles(db, campaign);
                EmailHelper.SendOrderEmailToClient(campaign, user);

                var ads = db.Vendors.FirstOrDefault(x => x.Name.Contains("ADS"));
                if (ads != null)
                {
                    EmailHelper.SendOrderEmailToAds(campaign, user, ads.Email, ads.CcEmails);
                }
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
                    .Include(x => x.Testing)
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
                string sentOrder, queuedCampaignId = null;
                switch (orderVia)
                {
                    case OrderVia.Email:
                        sentOrder = EmailHelper.SendApprovedToVendor(vendor, campaign, segment);
                        break;
                    case OrderVia.Api:
                        var response = ProDataApiManager.Create(campaign, segment, whiteLabelDomain);
                        if (response.status != ProDataApiManager.Success)
                        {
                            throw new AdsException(response.ErrorMessage);
                        }
                        sentOrder = response.RequestMessage;
                        queuedCampaignId = response.queued_pending_campaign_id.ToString();
                        break;
                    default:
                        throw new AdsException("Invalid orderVia while sending to vendor multiple");
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
                        SentOrder = sentOrder,
                        IsCreatedThroughApi = orderVia == OrderVia.Api,
                        QueuedCampaignId = queuedCampaignId
                    };
                    db.CampaignTrackings.Add(tracking);
                    db.SaveChanges();
                }

                LogHelper.AddLog(db, LogType.Vendor, campaign.OrderNumber, $"Multi {segment.SegmentNumber} has been sent to vendor successfully.");
            }
        }

        private static void SendToVendorSingle(OrderVia orderVia, WfpictContext db, Campaign campaign, Vendor vendor, string whiteLabelDomain)
        {
            string sentOrder, queuedCampaignId = null;
            switch (orderVia)
            {
                case OrderVia.Email:
                    sentOrder = EmailHelper.SendApprovedToVendor(vendor, campaign, null);
                    break;
                case OrderVia.Api:
                    var response = ProDataApiManager.Create(campaign, null, whiteLabelDomain);
                    if (response.status != ProDataApiManager.Success)
                    {
                        throw new AdsException(response.ErrorMessage);
                    }
                    sentOrder = response.RequestMessage;
                    queuedCampaignId = response.queued_pending_campaign_id.ToString();
                    break;
                default:
                    throw new AdsException("Invalid orderVia while sending to vendor single");
            }

            string orderNumberRdp = campaign.ReBroadcasted ? campaign.ReBroadcastedOrderNumber : campaign.OrderNumber;
            long quantity = campaign.ReBroadcasted ? campaign.ReBroadcastedQuantity : campaign.Approved.Quantity;

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
                    SentOrder = sentOrder,
                    IsCreatedThroughApi = orderVia == OrderVia.Api,
                    QueuedCampaignId = queuedCampaignId
                };
                db.CampaignTrackings.Add(tracking);
            } else
            {
                campaignTracking.Quantity = quantity;
                campaignTracking.DateSent = DateTime.Now;
                campaignTracking.SentOrder = sentOrder;
                campaignTracking.IsCreatedThroughApi = orderVia == OrderVia.Api;
                campaignTracking.QueuedCampaignId = queuedCampaignId;
            }
            db.SaveChanges();

            LogHelper.AddLog(db, LogType.Vendor, campaign.OrderNumber, !campaign.ReBroadcasted
                    ? "Order has been sent to vendor successfully."
                    : "Order Rebroad has been sent to vendor sucessfully.");
        }
    }
}