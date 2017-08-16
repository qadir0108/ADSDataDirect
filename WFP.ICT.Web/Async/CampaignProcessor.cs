using System;
using System.Data.Entity;
using System.IO;
using System.Linq;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.Helpers;

namespace WFP.ICT.Web.Async
{
    public class CampaignProcessor
    {
        public static void SendVendorEmail(Guid? vendorId, string OrderNumber, string[] SegmentsSelected)
        {
            using (var db = new WFPICTContext())
            {
                Campaign campaign = db.Campaigns
                    .Include(x => x.Assets)
                    .Include(x => x.Segments)
                    .Include(x => x.Approved)
                    .Include(x => x.Trackings)
                    .FirstOrDefault(x => x.OrderNumber == OrderNumber);

                var vendor = db.Vendors.FirstOrDefault(x => x.Id == vendorId);

                if (SegmentsSelected == null)
                {
                    EmailHelper.SendApprovedToVendor(vendor, campaign, null);

                    var campaignTracking =
                           db.CampaignTrackings.FirstOrDefault(x => x.CampaignId == campaign.Id && x.SegmentNumber == "");

                    if (campaignTracking == null)
                    {
                        var trackingId = Guid.NewGuid();
                        var tracking = new CampaignTracking()
                        {
                            Id = trackingId,
                            CreatedAt = DateTime.Now,
                            CampaignId = campaign.Id,
                            SegmentNumber = string.Empty,
                            DateSent = DateTime.Now,
                            IsCreatedThroughApi = false
                        };
                        db.CampaignTrackings.Add(tracking);
                    }

                    if (!campaign.ReBroadcasted)
                    {
                        LogHelper.AddLog(db, LogTypeEnum.ProData, OrderNumber, "Order has been sent to vendor successfully.");
                    }
                    else
                    {
                        LogHelper.AddLog(db, LogTypeEnum.ProData, OrderNumber, "Order Rebroad has been sent to vendor sucessfully.");
                    }

                    campaign.Status = (int)CampaignStatusEnum.Monitoring;
                    db.SaveChanges();

                }
                else // Segments
                {
                    var segments = db.CampaignSegments
                                   .Where(c => c.CampaignId == campaign.Id && SegmentsSelected.Contains(c.SegmentNumber))
                                   .ToList();

                    foreach (var segment in segments)
                    {
                        EmailHelper.SendApprovedToVendor(vendor, campaign, segment);

                        segment.SegmentStatus = (int)SegmentStatusEnum.Monitoring;
                        segment.DateSent = DateTime.Now;

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
                                SegmentNumber = segment.SegmentNumber,
                                DateSent = DateTime.Now,
                                IsCreatedThroughApi = false
                            };
                            db.CampaignTrackings.Add(tracking);
                        }

                        if(!campaign.ReBroadcasted)
                        {
                            LogHelper.AddLog(db, LogTypeEnum.ProData, OrderNumber, "Segment " + segment.SegmentNumber + " has been sent to vendor successfully.");
                        }
                        else
                        {
                            LogHelper.AddLog(db, LogTypeEnum.ProData, OrderNumber, "Segment " + segment.SegmentNumber + " Rebroad has been sent to vendor successfully.");
                        }
                        
                    }

                    // Put campaign to monitoring if no segments is in generated/approved state
                    var ifSomeSegmentsRemaining = db.CampaignSegments
                                  .Where(c => c.CampaignId == campaign.Id)
                                  .Any(x => x.SegmentStatus == (int)SegmentStatusEnum.Generated || x.SegmentStatus == (int)SegmentStatusEnum.Approved);
                    if (!ifSomeSegmentsRemaining)
                    {
                        campaign.Status = (int)CampaignStatusEnum.Monitoring;
                        db.SaveChanges();
                    }
                }
                
            }
        }

    }
}