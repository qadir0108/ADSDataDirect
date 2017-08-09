using System;
using System.Data.Entity;
using System.IO;
using System.Linq;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;

namespace WFP.ICT.Web.Async
{
    public class CampaignProcessor
    {
        public static void SendVendorEmail(Guid? vendorId, string OrderNumber, string[] SegmentsSelected)
        {
            using (var db = new WFPICTContext())
            {
                Campaign campaign = db.Campaigns
                    .Include(x => x.Approved)
                    .Include(x => x.Trackings)
                    .FirstOrDefault(x => x.OrderNumber == OrderNumber);

                var vendor = db.Vendors.FirstOrDefault(x => x.Id == vendorId);

                var segments = db.CampaignSegments
                                   .Where(c => c.CampaignId == campaign.Id && SegmentsSelected.Contains(c.SegmentNumber))
                                   .ToList();

                foreach (var segment in segments)
                {
                    EmailHelper.SendApprovedToVendor(vendor, campaign, segment);

                    segment.SegmentStatus = (int)SegmentStatusEnum.Traffic;
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
                }
                
                campaign.Status = (int)CampaignStatusEnum.Traffic;
                db.SaveChanges();
            }
        }

    }
}