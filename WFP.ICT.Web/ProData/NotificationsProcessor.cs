using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.Async;
using WFP.ICT.Web.Async.Helpers;
using WFP.ICT.Web.Helpers;

namespace WFP.ICT.Web.ProData
{
    public static class NotificationsProcessor
    {
        public static void FetchAndCheckForQcRules()
        {
            using (var db = new WfpictContext())
            {
                LogHelper.AddLog(db, LogType.RulesProcessing, "", $"FetchAndCheckForQCRules started at {DateTime.Now}");

                // any camp that is in monitoring or any whose any segment is in monitoring
                List<Campaign> campaigns = db.Campaigns
                    .Include(x => x.Approved)
                    .Include(x => x.Segments)
                    .Include(x => x.Trackings)
                    .Where(x => x.Status == (int)CampaignStatus.Monitoring || x.Segments.Any(s => s.SegmentStatus == (int)SegmentStatus.Monitoring))
                    .Where(x => x.Approved != null)
                    //.Where(x => x.OrderNumber == "2750" || x.ReBroadcastedOrderNumber == "2557RDP")
                    .ToList();

                LogHelper.AddLog(db, LogType.RulesProcessing, "", $"FetchAndCheckForQCRules processing {campaigns.Count} campaigns.");

                // Update Tracking clicked opened
                int index = 0;
                foreach (var campaign in campaigns)
                {
                    ProDataApiManager.FetchAndUpdateTrackings(db, campaign);
                    LogHelper.AddLog(db, LogType.RulesProcessing, "", $"FetchAndCheckForQCRules completed {index} out of {campaigns.Count} campaigns.");
                    index++;
                }
                
                // Send them 5 days = 120hrs
                // Expire notifications that are > 120 hrs
                var toBeExpired = db.Notifications.ToList()
                        .Where(x => (DateTime.Now.TimeOfDay.Hours - x.FoundAt?.TimeOfDay.Hours) >= 120)
                        .ToList();
                if (toBeExpired.Count > 0)
                {
                    LogHelper.AddLog(db, LogType.RulesProcessing, "", "Expiring 72hrs old notifications");
                    foreach (var notification in toBeExpired)
                    {
                        notification.Status = (int)NotificationStatus.Expired;
                    }
                    db.SaveChanges();
                }

                // Delete prodata log with time >= 2 hrs
                var logs = db.SystemLogs.Where(x => (x.LogType == (int)LogType.RulesProcessing || x.LogType == (int)LogType.ProData) &&
                                                    (DateTime.Now.TimeOfDay.Hours - x.CreatedAt.TimeOfDay.Hours) >= 2).ToList();
                if (logs.Count > 0)
                {
                    foreach (var log in logs)
                    {
                        db.SystemLogs.Remove(log);
                    }
                    db.SaveChanges();
                }

                LogHelper.AddLog(db, LogType.RulesProcessing, "", $"FetchAndCheckForQCRules finished at {DateTime.Now}, {campaigns.Count} campaigns refreshed.");

            }
        }
        
        public static void SendNotificationEmails()
        {
            using (var db = new WfpictContext())
            {
                //var campaignIds = db.Notifications
                //    .Where(x => x.Status == (int) Enum.NotificationStatus.Found)
                //    .Select(x => x.CampaignId)
                //    .ToList();
                //List<Campaign> campaigns = db.Campaigns
                //    .Include(x => x.Notifications)
                //    .Where(x => campaignIds.Contains(x.Id))
                //    .ToList();

                var campaigns = (from c in db.Campaigns
                                join n in db.Notifications on c.Id equals n.CampaignId
                                where n.Status == (int)NotificationStatus.Found
                                select c).Distinct().Include(x => x.Notifications).ToList();

                var vendor = db.Vendors.FirstOrDefault(x => x.Name.Contains("Pro") || x.Name.Contains("Test"));

                if (campaigns.Count > 0)
                {
                    LogHelper.AddLog(db, LogType.RulesProcessing, "", "Sending Notification Emails");
                    EmailHelper.SendNotificationsToVendor(vendor, campaigns);
                }
            }
        }

    }
}