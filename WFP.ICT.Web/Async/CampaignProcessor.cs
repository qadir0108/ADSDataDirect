using System;
using System.Data.Entity;
using System.IO;
using System.Linq;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.Async.Helpers;
using WFP.ICT.Web.Helpers;

namespace WFP.ICT.Web.Async
{
    public static class CampaignProcessor
    {
        public static void SendVendorEmail(Guid? vendorId, string orderNumber, string[] segmentsSelected)
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
                    EmailHelper.SendApprovedToVendor(vendor, campaign, null);

                    string orderNumberRdp;
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
                           db.CampaignTrackings.FirstOrDefault(x => x.CampaignId == campaign.Id && x.OrderNumber == orderNumberRdp && x.SegmentNumber == "");

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

                    if (!campaign.ReBroadcasted)
                    {
                        LogHelper.AddLog(db, LogType.ProData, orderNumber, "Order has been sent to vendor successfully.");
                    }
                    else
                    {
                        LogHelper.AddLog(db, LogType.ProData, orderNumber, "Order Rebroad has been sent to vendor sucessfully.");
                    }
                    db.SaveChanges();

                }
                else // Segments
                {
                    var segments = db.CampaignSegments
                                   .Where(c => c.CampaignId == campaign.Id && segmentsSelected.Contains(c.SegmentNumber))
                                   .ToList();

                    foreach (var segment in segments)
                    {
                        EmailHelper.SendApprovedToVendor(vendor, campaign, segment);

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
                                OrderNumber = orderNumber,
                                SegmentNumber = segment.SegmentNumber,
                                Quantity = segment.Quantity,
                                DateSent = DateTime.Now,
                                IsCreatedThroughApi = false
                            };
                            db.CampaignTrackings.Add(tracking);
                        }
                        LogHelper.AddLog(db, LogType.ProData, orderNumber, $"Segment {segment.SegmentNumber} has been sent to vendor successfully.");
                    }
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

    }
}