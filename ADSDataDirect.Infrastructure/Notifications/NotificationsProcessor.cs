﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using ADSDataDirect.Core;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using Z.EntityFramework.Plus;
using ADSDataDirect.Infrastructure.Emails;
using ADSDataDirect.Infrastructure.ProData;
using ADSDataDirect.Infrastructure.ClickMeter;

namespace ADSDataDirect.Infrastructure.Notifications
{
    public static class NotificationsProcessor
    {
        static string ClientCode { get; } = System.Configuration.ConfigurationManager.AppSettings["ClientCode"];

        static bool IsNxs => ClientCode == Client.NXS.ToString();

        public static void FetchAndCheckForQcRules()
        {
            //DateTime dtFrom = DateTime.ParseExact("10/15/2017", "MM/dd/2017",CultureInfo.InvariantCulture);
            // For only campaigns of last 15 days 
            DateTime dtFrom = DateTime.Now.AddDays(-30);
            using (var db = new WfpictContext())
            {
                bool isAutoProcessTracking = false;
                var settingAuto = db.Settings.FirstOrDefault(x => x.Key == StringConstants.KeyAutoProcessTracking);
                if (settingAuto != null) isAutoProcessTracking = int.Parse(settingAuto.Value) == 1;
                if (isAutoProcessTracking)
                {
                    // Delete old log
                    db.SystemLogs.Where(x => x.LogType == (int)LogType.RulesProcessing || x.LogType == (int)LogType.Vendor).Delete();
                    db.SaveChanges();

                    LogHelper.AddLog(db, LogType.RulesProcessing, "", $"FetchAndCheckForQCRules started at {DateTime.Now}");
                    // any camp that is in monitoring or any whose any segment is in monitoring
                   
                    List<Campaign> campaigns = db.Campaigns
                        .Include(x => x.Testing)
                        .Include(x => x.Approved)
                        .Include(x => x.Segments)
                        .Include(x => x.Trackings)
                        .Where(x => x.Status == (int)CampaignStatus.Monitoring || x.Segments.Any(s => s.SegmentStatus == (int)SegmentStatus.Monitoring))
                        .Where(x => x.Approved != null)
                        .Where(x => DbFunctions.TruncateTime(x.CreatedAt) >= dtFrom)
                        .Where(x => !string.IsNullOrEmpty(x.Testing.ClickMeterRotatorLinkId))
                        .ToList();

                    LogHelper.AddLog(db, LogType.RulesProcessing, "", $"FetchAndCheckForQCRules processing {campaigns.Count} campaigns.");

                    // Update Tracking clicked opened
                    int index = 1;
                    foreach (var campaign in campaigns)
                    {
                        if (IsNxs)
                        {
                            ClickMeterModelProcessor.PopulateFromClickMeter(db, campaign);
                        }
                        else
                        {
                            ProDataApiManager.FetchAndUpdateTrackings(db, campaign);
                        }
                        LogHelper.AddLog(db, LogType.RulesProcessing, "", $"FetchAndCheckForQCRules completed {index} out of {campaigns.Count} campaigns.");
                        index++;
                    }

                    // Send them 5 days = 120
                    // Expire notifications that are > 120 hrs
                    var toBeExpired = db.Notifications.ToList()
                            .Where(x => x.FoundAt != null && DateTime.Now.Subtract(x.FoundAt.Value).Hours >= 120)
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

                    LogHelper.AddLog(db, LogType.RulesProcessing, "", $"FetchAndCheckForQCRules finished at {DateTime.Now}, {campaigns.Count} campaigns refreshed.");
                }
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
                                && (c.Status == (int)CampaignStatus.Monitoring || 
                                    c.Segments.Any(s => s.SegmentStatus == (int)SegmentStatus.Monitoring))
                                 select c)
                                .Distinct()
                                .Include(x => x.Testing)
                                .Include(x => x.Trackings)
                                .Include(x => x.Notifications)
                                .OrderByDescending(x => x.CreatedAt)
                                .ThenBy(x => x.OrderNumber)
                                .ToList();

                var vendor = db.Vendors.FirstOrDefault(x => x.Name.ToLower().Contains("nxsda"));
                if (vendor == null)
                    vendor = db.Vendors.FirstOrDefault(x => x.Name.ToLower().Contains("test"));

                if (campaigns.Count > 0)
                {
                    LogHelper.AddLog(db, LogType.RulesProcessing, "", "Sending Notification Emails");
                    EmailHelper.SendNotificationsToVendor(vendor, campaigns);
                }
            }
        }

    }
}