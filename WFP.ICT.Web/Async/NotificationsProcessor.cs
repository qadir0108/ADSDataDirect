using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;

namespace WFP.ICT.Web.Async
{
    public class NotificationsProcessor
    {
        public static void CheckForQCRules()
        {
            Console.WriteLine("CheckForQCRules called at " + DateTime.Now);
            using (var db = new WFPICTContext())
            {
                List<Campaign> campaigns = db.Campaigns
                    .Where(x => x.Status == (int)CampaignStatusEnum.Traffic)
                    .ToList();

                // Update Tracking clicked opened
                foreach (var campaign in campaigns)
                {
                    ProDataAPIManager.FetchAndUpdateTrackings(db, campaign.OrderNumber);
                }

                // Check for QC Rules and Add into notifcation table if notification NOT already exits?

                // Expire notifications that are > 72 hrs
                var toBeExpired = db.Notifications
                        .Where(x => (DateTime.Now.TimeOfDay.Hours - x.FoundAt.Value.TimeOfDay.Hours) >= 72)
                        .ToList();
                foreach (var notification in toBeExpired)
                {
                    notification.Status = (int) NotificationStatusEnum.Expired;
                }
            }
        }
        
        public static void SendNotificationEmails()
        {
            using (var db = new WFPICTContext())
            {
                var campaignIds = db.Notifications
                    .Where(x => x.Status == (int) NotificationStatusEnum.Found)
                    .Select(x => x.CampaignId)
                    .ToList();

                List<Campaign> campaigns = db.Campaigns
                    .Include(x => x.Notifications)
                    .Where(x => campaignIds.Contains(x.Id))
                    .ToList();

                var vendor = db.Vendors.FirstOrDefault(x => x.Name.Contains("Pro"));
                
                if (campaigns.Count > 0)
                    EmailHelper.SendNotificationsToVendor(vendor, campaigns);

            }
        }

    }
}