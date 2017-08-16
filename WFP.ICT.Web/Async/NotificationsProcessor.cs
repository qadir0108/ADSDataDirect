using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.Helpers;

namespace WFP.ICT.Web.Async
{
    public class NotificationsProcessor
    {
        public static void CheckForQCRules()
        {
            //Console.WriteLine("CheckForQCRules called at " + DateTime.Now);
            using (var db = new WFPICTContext())
            {
                LogHelper.AddLog(db, LogTypeEnum.RulesProcessing, "", "CheckForQCRules started successfully.");

                List<Campaign> campaigns = db.Campaigns
                    .Where(x => x.Status == (int)CampaignStatusEnum.Monitoring)
                    .ToList();

                // Update Tracking clicked opened
                foreach (var campaign in campaigns)
                {
                    ProDataAPIManager.FetchAndUpdateTrackings(db, campaign.OrderNumber);

                    // Check for QC Rules and Add into notifcation table if notification NOT already exits?
                    bool found = false;

                    var qcRule = QCRuleEnum.NotStartedInFirst4Hours;

                    var alreadyNoted =
                        db.Notifications.FirstOrDefault(x => x.CampaignId == campaign.Id && x.QCRule == (int)qcRule && x.Status == (int)NotificationStatusEnum.Found);

                    if (alreadyNoted == null)
                    {
                        LogHelper.AddLog(db, LogTypeEnum.RulesProcessing, campaign.OrderNumber, "Problem found. QCRule " + qcRule);
                        db.Notifications.Add(new Notification()
                        {
                            Id = Guid.NewGuid(),
                            CreatedAt = DateTime.Now,

                            CampaignId = campaign.Id,
                            OrderNumber = campaign.OrderNumber,
                            Status = (int)NotificationStatusEnum.Found,

                            CheckTime = DateTime.Now,
                            FoundAt = DateTime.Now,
                            QCRule = (int)qcRule
                        });
                        db.SaveChanges();
                    }
                }
                
                // Expire notifications that are > 72 hrs
                var toBeExpired = db.Notifications.ToList()
                        .Where(x => (DateTime.Now.TimeOfDay.Hours - x.FoundAt?.TimeOfDay.Hours) >= 72)
                        .ToList();
                if (toBeExpired.Count > 0)
                {
                    LogHelper.AddLog(db, LogTypeEnum.RulesProcessing, "", "Expiring 72hrs old notifications");
                    foreach (var notification in toBeExpired)
                    {
                        notification.Status = (int)NotificationStatusEnum.Expired;
                    }
                }
                
            }
        }
        
        public static void SendNotificationEmails()
        {
            using (var db = new WFPICTContext())
            {
                //var campaignIds = db.Notifications
                //    .Where(x => x.Status == (int) NotificationStatusEnum.Found)
                //    .Select(x => x.CampaignId)
                //    .ToList();
                //List<Campaign> campaigns = db.Campaigns
                //    .Include(x => x.Notifications)
                //    .Where(x => campaignIds.Contains(x.Id))
                //    .ToList();

                var campaigns = (from c in db.Campaigns
                                join n in db.Notifications on c.Id equals n.CampaignId
                                where n.Status == (int)NotificationStatusEnum.Found
                                select c).Distinct().Include(x => x.Notifications).ToList();

                var vendor = db.Vendors.FirstOrDefault(x => x.Name.Contains("Pro") || x.Name.Contains("Test"));

                if (campaigns.Count > 0)
                {
                    LogHelper.AddLog(db, LogTypeEnum.RulesProcessing, "", "Sending Notification Emails");
                    EmailHelper.SendNotificationsToVendor(vendor, campaigns);
                }
            }
        }

    }
}