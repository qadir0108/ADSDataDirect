﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using ADSDataDirect.Core;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.Async.Helpers;
using ADSDataDirect.Web.Helpers;

namespace ADSDataDirect.Web.ProData
{
    public static class NotificationsProcessor
    {
        public static void FetchAndCheckForQcRules()
        {
            using (var db = new WfpictContext())
            {
                bool isAutoProcessTracking = false;
                var settingAuto = db.Settings.FirstOrDefault(x => x.Key == StringConstants.KeyAutoProcessTracking);
                if (settingAuto != null) isAutoProcessTracking = int.Parse(settingAuto.Value) == 1;
                if(!isAutoProcessTracking) return;

                LogHelper.AddLog(db, LogType.RulesProcessing, "", $"FetchAndCheckForQCRules started at {DateTime.Now}");

                // any camp that is in monitoring or any whose any segment is in monitoring
                List<Campaign> campaigns = db.Campaigns
                    .Include(x => x.Approved)
                    .Include(x => x.Segments)
                    .Include(x => x.Trackings)
                    .Where(x => x.Status == (int)CampaignStatus.Monitoring || x.Segments.Any(s => s.SegmentStatus == (int)SegmentStatus.Monitoring))
                    .Where(x => x.Approved != null)
                    .ToList();

                LogHelper.AddLog(db, LogType.RulesProcessing, "", $"FetchAndCheckForQCRules processing {campaigns.Count} campaigns.");

                // Update Tracking clicked opened
                int index = 1;
                foreach (var campaign in campaigns)
                {
                    ProDataApiManager.FetchAndUpdateTrackings(db, campaign);
                    LogHelper.AddLog(db, LogType.RulesProcessing, "", $"FetchAndCheckForQCRules completed {index} out of {campaigns.Count} campaigns.");
                    index++;
                }

                // Send them 5 days = 120
                // Expire notifications that are > 120 hrs
                var toBeExpired = db.Notifications.ToList()
                        .Where(x => (DateTime.Now.TimeOfDay.Hours - x.FoundAt?.TimeOfDay.Hours) >= 120)
                        .ToList();
                if (toBeExpired.Count > 0)
                {
                    LogHelper.AddLog(db, LogType.RulesProcessing, "", "Expiring 120hrs old notifications");
                    foreach (var notification in toBeExpired)
                    {
                        notification.Status = (int)NotificationStatus.Expired;
                    }
                    db.SaveChanges();
                }

                // Delete prodata log with time >= 12 hrs
                var logs = db.SystemLogs.ToList()
                    .Where(x => (x.LogType == (int)LogType.RulesProcessing || x.LogType == (int)LogType.ProData) &&
                                (DateTime.Now.TimeOfDay.Hours - x.CreatedAt.TimeOfDay.Hours) >= 12).ToList();

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
                bool isSendNotificationEmails = false;
                var settingSendNotifications = db.Settings.FirstOrDefault(x => x.Key == StringConstants.KeySendNotificationEmails);
                if (settingSendNotifications != null) isSendNotificationEmails = int.Parse(settingSendNotifications.Value) == 1;
                if(!isSendNotificationEmails) return;

                // pick all those notifications where status = found
                // pick camps of those notifs
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