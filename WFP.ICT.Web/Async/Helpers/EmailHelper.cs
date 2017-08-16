using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Threading.Tasks;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.Helpers;

namespace WFP.ICT.Web.Async
{
    public class EmailHelper
    {
        private const string Footer = @"<br/><br/>Thanks<br/>
                                        <b>ADS Data Direct</b><br/>http://www.adsdatadirect.com";

        public static async Task SendOrderEmailToClient(Campaign campaign, WFPUser loggedInUser, string bccEmails)
        {
            string subject = string.Format("Order # {0}, Campaign Date {1}, QTY {2} , Date Submitted {3}",
                                    campaign.OrderNumber, campaign.BroadcastDate.Value.ToString("d"), campaign.Quantity, campaign.CreatedAt.ToString("d"));

            string body = string.Format(@"<br/><p>Dear {0}</p><br/>
                                       We have recevied your order.<br/><br/>
                                        <table border=""2"">
                                        <tr><th align=""left"">Order #:</th><td>{1}</td></tr>
                                        <tr><th align=""left"">Status:</th><td>{2}</td></tr>
                                        <tr><th align=""left"">Username:</th><td>{3}</td></tr>
                                        <tr><th align=""left"">User Email:</th><td>{4}</td></tr>
                                        <tr><th align=""left"">Campaign Name:</th><td>{5}</td></tr>
                                        <tr><th align=""left"">Broadcast Date:</th><td>{6}</td></tr>
                                        <tr><th align=""left"">Rebroadcast:</th><td>{7}</td></tr>
                                        <tr><th align=""left"">Rebroadcast Date:</th><td>{8}</td></tr>
                                        <tr><th align=""left"">From Line:</th><td>{9}</td></tr>
                                        <tr><th align=""left"">Subject Line:</th><td>{10}</td></tr>
                                        <tr><th align=""left"">Personalization:</th><td>{11}</td></tr>
                                        <tr><th align=""left"">Matchback:</th><td>{12}</td></tr>
                                        <tr><th align=""left"">Suppression:</th><td>{13}</td></tr>
                                        <tr><th align=""left"">White Label:</th><td>{14}</td></tr>
                                        <tr><th align=""left"">HTML File:</th><td>{15}</td></tr>
                                        <tr><th align=""left"">Test Seed:</th><td>{16}</td></tr>  
                                        <tr><th align=""left"">Live Seed:</th><td>{17}</td></tr>   
                                        <tr><th align=""left"">Special Instructions:</th><td>{18}</td></tr>                                     
                                        <tr><th align=""left"">Start Time:</th><td>{19}</td></tr>
                                        <tr><th align=""left"">IP:</th><td>{20}</td></tr>
                                        <tr><th align=""left"">Browser:</th><td>{21}</td></tr>
                                        <tr><th align=""left"">OS:</th><td>{22}</td></tr>
                                        <tr><th align=""left"">Referrer:</th><td>{23}</td></tr>
                                        </table></p> <p>We will soon contact you and update you about your order.</p> {24}"
                                      , loggedInUser.UserName.ToCapitalLetterString().ToCapitalized(), campaign.OrderNumber, (CampaignStatusEnum)campaign.Status
                                      , loggedInUser.UserName, loggedInUser.Email, campaign.CampaignName, campaign.BroadcastDate.Value.ToString("d")
                                      , campaign.ReBroadCast ? "Yes" : "No", campaign.ReBroadcastDate.HasValue ? campaign.ReBroadcastDate.ToString() : "", campaign.FromLine, campaign.SubjectLine, campaign.IsPersonalization ? "Yes" : "No"
                                      , campaign.IsMatchback ? "Yes" : "No", campaign.IsSuppression ? "Yes" : "No" 
                                      , campaign.WhiteLabel, campaign.Assets.CreativeUrl, campaign.Assets.TestSeedUrl, campaign.Assets.LiveSeedUrl, campaign.SpecialInstructions 
                                      , campaign.CreatedAt.AddMinutes(2).AddSeconds(30).ToString()
                                      , campaign.IP, campaign.Browser, campaign.OS, campaign.Referrer
                                      , Footer);
            await SendEmailAsync(loggedInUser.Email, subject, body, string.Empty, bccEmails);
        }

        public static async Task SendApprovedToVendor(Vendor vendor, Campaign campaign, CampaignSegment segment)
        {
            string newOld = !campaign.ReBroadcasted ? "New" : "RDP";
            string orderNumber = campaign.OrderNumber;
            string deployDate = campaign.Approved.DeployDate.Value.ToString("d");
            string deployTime = campaign.Approved.DeployDate.Value.ToString("hh:mm");
            string quantity = campaign.Approved.Quantity.ToString();
                
            string subject;
            string segmentsHtml = string.Empty;
            if (segment == null)
            {
                subject = string.Format("{0} Order {1}, Order # {2}", newOld, campaign.Approved.CampaignName, campaign.OrderNumber);
            } else
            {
                subject = string.Format("{0} Order {1}, Order # {2}", newOld, campaign.Approved.CampaignName, segment.SegmentNumber);
                segmentsHtml += @"<table border=""1""><tr><th align=""left"">Segment</th><th align=""left"">Subject Line</th><th align=""left"">Broadcast Date</th><th align=""left"">Data File</th><th align=""left"">Total Records</th></tr>";
                segmentsHtml += string.Format(@"<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td></tr>", segment.SegmentNumber, segment.SubjectLine, segment.BroadcastDate, segment.SegmentDataFileUrl,
                    NumberHelper.GetTotal(segment.FirstRangeStart, segment.FirstRangeEnd, segment.SecondRangeStart, segment.SecondRangeEnd, segment.ThirdRangeStart, segment.ThirdRangeEnd)
                    );
                segmentsHtml += "</table>";
            }
            string body = string.Format(@"<br/><p>Dear {0}</p><br/>
                                       Please find below Order details<br/><br/>
                                        <table border=""2"">
                                        <tr><th align=""left""> Reference #:</th><td>{1}</td></tr>
                                        <tr><th align=""left"">Order #:</th><td>{2}</td></tr>
                                        <tr><th align=""left"">Campaign Name:</th><td>{3}</td></tr>
                                        <tr><th align=""left"">Rebroadcast:</th><td>{4}</td></tr>                                        
                                        <tr><th align=""left"">Broadcast Date:</th><td>{5}</td></tr>
                                        <tr><th align=""left"">From Line:</th><td>{6}</td></tr>
                                        <tr><th align=""left"">Subject Line:</th><td>{7}</td></tr>
                                        <tr><th align=""left"">Opt Out:</th><td>{8}</td></tr>
                                        <tr><th align=""left"">White Label:</th><td>{9}</td></tr>                                        
                                        <tr><th align=""left"">Personalization:</th><td>{10}</td></tr>
                                        <tr><th align=""left"">Creative URL:</th><td>{11}</td></tr>
                                        <tr><th align=""left"">Quantity:</th><td>{12}</td></tr>
                                        <tr><th align=""left"">Geo (s):</th><td>{13}</td></tr>
                                        <tr><th align=""left"">Demographics:</th><td>{14}</td></tr>
                                        <tr><tr><th align=""left"">Zip URL:</th><td>{15}</td></tr>
                                        <tr><th align=""left"">Special Instructions:</th><td>{16}</td></tr>
                                        <tr><th align=""left"">Deploy Date:</th><td>{17}</td></tr>
                                        <tr><th align=""left"">Deploy Time:</th><td>{18}</td></tr>
                                        <tr><th align=""left"">ReportSite Link:</th><td>{19}</td></tr>
                                        <tr><th align=""left"">Link Breakout:</th><td>{20}</td></tr>
                                        <tr><th align=""left"">Has Open Pixel:</th><td>{21}</td></tr>
                                        <tr><th align=""left"">Open Pixel URL:</th><td>{22}</td></tr>
                                        <tr><th align=""left"">Open Goals:</th><td>{23}</td></tr>
                                        <tr><th align=""left"">Click Goals:</th><td>{24}</td></tr>
                                        <tr><th align=""left"">Segment Data:</th><td>{25}</td></tr>
                                        </table></p> <p></p> {26}"
                                      , vendor.Name, campaign.Approved.ReferenceNumber, orderNumber, campaign.Approved.CampaignName
                                      , campaign.Approved.ReBroadCast ? "Yes" : "No", campaign.Approved.DeployDate.Value.ToString("d")
                                      , campaign.Approved.FromLine, campaign.Approved.SubjectLine, campaign.OptOut, campaign.Approved.WhiteLabel
                                      , campaign.IsPersonalization ? "Yes" : "No", campaign.Assets.CreativeUrl, quantity
                                      , campaign.Approved.GeoDetails, campaign.Approved.Demographics, campaign.Assets.ZipCodeUrl
                                      , campaign.Approved.SpecialInstructions, deployDate, deployTime
                                      , campaign.Approved.ReportSiteLink, campaign.Approved.LinkBreakout
                                      , campaign.Approved.IsOpenPixel ? "Yes" : "No", campaign.Approved.OpenPixelUrl
                                      , campaign.Approved.OpenGoals, campaign.Approved.ClickGoals
                                      , segmentsHtml
                                      , Footer);
            await SendEmailAsync(vendor.Email, subject, body, vendor.CCEmails);
        }

        public static async Task SendNotificationsToVendor(Vendor vendor, List<Campaign> campaigns)
        {
            string subject = string.Format("Campaign Issues Notifications");

            string problems = @"<table border=""2""><tr><th align=""left"">Order #</th><th align=""left"">Campaign Name</th><th align=""left"">Check Time</th><th align=""left"">Problem</th><th align=""left"">Problem Detail</th></tr>";
            foreach (var campaign in campaigns)
            {
                foreach (var notification in campaign.Notifications)
                {
                    problems += string.Format("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td></tr>",
                        campaign.OrderNumber, campaign.CampaignName, notification.CheckTime, 
                        (QCRuleEnum)notification.QCRule, QCRuleUtility.GetString(notification.QCRule));
                }
            }
            problems += "</table>";

            string body = string.Format(@"<br/><p>Dear {0}</p><br/>
                                       There is problem with these orders<br/><br/>
                                        </p> <p>{1}</p> {2}"
                                      , vendor.Name, problems
                                      , Footer);
            await SendEmailAsync(vendor.Email, subject, body, vendor.CCEmails);
        }


        public static void SendErrorEmail(string to, Exception ex, string currentController, string currentAction)
        {
            if (ConfigurationManager.AppSettings["IsLive"] == "true")
            {
                string subject = "ADSLive: An error has been occured.";
                string body = string.Format(@"<p>ADSLive: An error has been occured.</p>
                            <p>Controller : {0}</p><p>Action : {1}</p>
                            <p>Error Details : {2}</p>", currentController, currentAction, ex.GetExceptionMessage());
                SendEmail(to, subject, body);
            }
        }

        public static async Task SendEmailAsync(string to, string subject, string body, string ccEmails = "", string bccEmails = "", List < string> attachments = null)
        {
            using (var smtpClient = new SmtpClient())
            {
                var msg = CreateMessage(to, subject, body, ccEmails, bccEmails, attachments);
                await smtpClient.SendMailAsync(msg);
            }
        }

        public static void SendEmail(string to, string subject, string body, string ccEmails = "", string bccEmails = "", List<string> attachments = null)
        {
            using (var smtpClient = new SmtpClient())
            {
                var msg = CreateMessage(to, subject, body, ccEmails, bccEmails, attachments);
                smtpClient.Send(msg);
            }
        }

        private static MailMessage CreateMessage(string to, string subject, string body, string ccEmails = "", string bccEmails = "", List<string> attachments = null)
        { 
            MailMessage msg = new MailMessage();
            msg.To.Add(new MailAddress(to));
            if (!string.IsNullOrEmpty(ccEmails))
            {
                foreach (var ccEmail in ccEmails.Split(", ".ToCharArray(), StringSplitOptions.RemoveEmptyEntries))
                {
                    msg.CC.Add(ccEmail);
                }
            }

            if (!string.IsNullOrEmpty(bccEmails))
            {
                foreach (var bccEmail in bccEmails.Split(", ".ToCharArray(), StringSplitOptions.RemoveEmptyEntries))
                {
                    msg.Bcc.Add(bccEmail);
                }
            }

            msg.Subject = subject;
            msg.IsBodyHtml = true;
            msg.Body = body;
            if (attachments != null)
                foreach (var attachment in attachments)
                {
                    msg.Attachments.Add(new System.Net.Mail.Attachment(attachment));
                }
            return msg;
        }
    }
}