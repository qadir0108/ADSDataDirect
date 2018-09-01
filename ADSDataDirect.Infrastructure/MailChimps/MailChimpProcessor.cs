using System.Linq;
using System.Threading;
using ADSDataDirect.Core;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using MailChimp.Net;
using MailChimp.Net.Core;
using MailChimp.Net.Interfaces;
using MailChimp.Net.Models;

namespace ADSDataDirect.Infrastructure.MailChimps
{
    public class MailChimpProcessor
    {
        protected MailChimpProcessor()
        {
            
        }

        public static void QucikTestSend(CreativeVm model)
        {
                string campaignId = CreateCampignWithContent(model);
                QuickTestSendCampaign(model, campaignId, model.QuickTestEmails.Split(",".ToCharArray()));
        }

        private static void QuickTestSendCampaign(CreativeVm model, string campaignId, string[] testEmails)
        {
            IMailChimpManager manager = new MailChimpManager();
            var testSend = manager.Campaigns.TestAsync(campaignId, new CampaignTestRequest
            {
                //Emails = new string[] { "qadir010@gmail.com", "josh.silver@adsdatadirect.com" },
                Emails = testEmails,
                EmailType = "html"
            }).ConfigureAwait(false);

        }

        public static void TestSend(CreativeVm model)
        {
            using (var db = new WfpictContext())
            {
                var logs = db.SystemLogs.Where(x => x.OrderNumber == model.OrderNumber && x.LogType == (int)LogType.MailChimp);
                foreach (var log in logs)
                {
                    db.SystemLogs.Remove(log);
                }
                db.SaveChanges();

                LogHelper.AddLog(db, LogType.MailChimp, model.OrderNumber, "Starting Test send. Order Number : " + model.OrderNumber);
                string listId = CreateList(db, model);
                CreateMembers(db, listId, model);

                // Wait 5 min
                Thread.Sleep(1000 * 60 * 5);

                //CreateTemplateFolder(model);
                int templateId = CreateTemplate(db, model);

                string campaignId = CreateCampignWithTemplate(db, model, listId, templateId);
                
                SendCampaign(db, model, campaignId);

                LogHelper.AddLog(db, LogType.MailChimp, model.OrderNumber, "Test send completed successfully.");
            }
        }

        private static void SendCampaign(WfpictContext db, CreativeVm model, string campaignId)
        {
            IMailChimpManager manager = new MailChimpManager();
            LogHelper.AddLog(db, LogType.MailChimp, model.OrderNumber, "Sending to Test list");
            var sent = manager.Campaigns.SendAsync(campaignId).ConfigureAwait(false);
          
        }

        private static string CreateCampignWithContent(CreativeVm model)
        {
            IMailChimpManager manager = new MailChimpManager();
            //AddLog(db, model.OrderNumber, "Creating campaign with contents");
            var campaign = manager.Campaigns.AddAsync(new MailChimp.Net.Models.Campaign
            {
                Settings = new Setting
                {
                    ReplyTo = "donotreply@adsdatadirect.com",
                    Title = model.SubjectLine,
                    FromName = "Josh Silver",
                    SubjectLine = model.SubjectLine,
                },
                Type = CampaignType.Regular,
            }).ConfigureAwait(false);

            var campaignId = campaign.GetAwaiter().GetResult().Id;

            var content = new ContentRequest
            {
                //PlainText = model.Creatives,
                Html = model.Creatives,
            };
            manager.Content.AddOrUpdateAsync(campaignId, content);
            return campaignId;
        }

        private static string CreateCampignWithTemplate(WfpictContext db, CreativeVm model, string listId, int templateId)
        {
            IMailChimpManager manager = new MailChimpManager();
            LogHelper.AddLog(db, LogType.MailChimp, model.OrderNumber, "Creating campaign with template");
            var campaign = manager.Campaigns.AddAsync(new MailChimp.Net.Models.Campaign
            {
                Recipients = new Recipient
                {
                    ListId = listId
                },
                Settings = new Setting
                {
                    ReplyTo = "donotreply@adsdatadirect.com",
                    Title = model.SubjectLine,
                    FromName = "Josh Silver",
                    SubjectLine = model.SubjectLine,
                    TemplateId = templateId,
                },
                Type = CampaignType.Regular,
            }).ConfigureAwait(false);

            var campaignId = campaign.GetAwaiter().GetResult().Id;
            return campaignId;
        }

        private static int CreateTemplate(WfpictContext db, CreativeVm model)
        {
            IMailChimpManager manager = new MailChimpManager();
            LogHelper.AddLog(db, LogType.MailChimp, model.OrderNumber, "Creating template from creatives");
            var allTemplatesRequest = manager.Templates.GetAllAsync().ConfigureAwait(false);
            var allTemplates = allTemplatesRequest.GetAwaiter().GetResult();
            int templateIdOld = -1;
            foreach (var allTemplate in allTemplates)
            {
                if (allTemplate.Name == model.OrderNumber)
                {
                    templateIdOld = allTemplate.Id;
                    break;
                }
            }
            if (templateIdOld != -1)
            {
                LogHelper.AddLog(db, LogType.MailChimp, model.OrderNumber, "Template " + model.OrderNumber + " already exists. Deleting old one.");
                var deleteTemplateRequest = manager.Templates.DeleteAsync(templateIdOld.ToString()).ConfigureAwait(false);
            }

            var template = manager.Templates.CreateAsync(model.OrderNumber, "", model.Creatives).ConfigureAwait(false);
            var templateId = template.GetAwaiter().GetResult().Id;
            LogHelper.AddLog(db, LogType.MailChimp, model.OrderNumber, "Template creatives created successfully.");
            return templateId;
        }

        private static void CreateTemplateFolder(CreativeVm model)
        {
            IMailChimpManager manager = new MailChimpManager();
            var folder =manager.TemplateFolders.AddAsync(model.OrderNumber).ConfigureAwait(false);
            var folderStatus = folder.GetAwaiter().GetResult();
        }

        private static void CreateMembers(WfpictContext db, string listId, CreativeVm model)
        {
            IMailChimpManager manager = new MailChimpManager();
            LogHelper.AddLog(db, LogType.MailChimp, model.OrderNumber, "Creating members");
            foreach (var email in model.TestEmails)
            {
                var member = new Member { EmailAddress = email.Text, StatusIfNew = Status.Subscribed };
                var memberResult = manager.Members.AddOrUpdateAsync(listId, member).ConfigureAwait(false);
                var result = memberResult.GetAwaiter().GetResult();

                var exists = manager.Members.ExistsAsync(listId, email.Text).Result;
            }
            LogHelper.AddLog(db, LogType.MailChimp, model.OrderNumber, "Members created successfully.");
        }

        private static string CreateList(WfpictContext db, CreativeVm model)
        {
            bool isListExists = false;
            string listId = string.Empty;
            IMailChimpManager manager = new MailChimpManager();
            var lists = manager.Lists.GetAllAsync().ConfigureAwait(false);
            foreach (var list in lists.GetAwaiter().GetResult())
            {
                if (list.Name == model.OrderNumber)
                {
                    isListExists = true;
                    listId = list.Id;
                    break;
                }
            }

            if (isListExists)
            {
                LogHelper.AddLog(db, LogType.MailChimp, model.OrderNumber, "List " + model.OrderNumber + " already exists.");
            }
            else
            {
                LogHelper.AddLog(db, LogType.MailChimp, model.OrderNumber, "Creating list");
                var testList = manager.Lists.AddOrUpdateAsync(
                        new List()
                        {
                            Name = model.OrderNumber,
                            PermissionReminder = "none",
                            Contact = new Contact
                            {
                                Address1 = "TEST",
                                City = "Bettendorf",
                                Country = "USA",
                                State = "IA",
                                Zip = "61250",
                                Company = "TEST"
                            },
                            CampaignDefaults = new CampaignDefaults
                            {
                                FromEmail = "josh@nxsda.com", //"josh.silver@adsdatadirect.com",
                                FromName = model.FromLine,
                                Language = "EN",
                                Subject = model.SubjectLine
                            }
                        }).ConfigureAwait(false);
                var list = testList.GetAwaiter().GetResult();
                listId = list.Id;
                LogHelper.AddLog(db, LogType.MailChimp, model.OrderNumber, "List created successfully.");
            }

            return listId;
        }

        
    }
}