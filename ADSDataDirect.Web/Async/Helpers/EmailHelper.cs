using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.Helpers;

namespace ADSDataDirect.Web.Async.Helpers
{
    public static class EmailHelper
    {
        private const string Footer = @"<br/><br/>Thanks<br/>
                                        <b>ADS Data Direct</b><br/>http://www.adsdatadirect.com";

        public static void SendOrderEmailToClient(Campaign campaign, WfpUser loggedInUser)
        {
            string subject = $"Order # {campaign.OrderNumber}, Campaign Date {campaign.BroadcastDate?.ToString("d")}, QTY {campaign.Quantity} , Date Submitted {campaign.CreatedAt:d}";

            string body = $@"<br/><p>Dear {loggedInUser.UserName.ToCapitalLetterString().ToCapitalized()}</p><br/>We have recevied your order.<br/><br/>
                        <table border=""2"">
                        <tr><th align=""left"">Order #:</th><td>{campaign.OrderNumber}</td></tr>
                        <tr><th align=""left"">Status:</th><td>{(CampaignStatus) campaign.Status}</td></tr>
                        <tr><th align=""left"">Username:</th><td>{loggedInUser.UserName}</td></tr>
                        <tr><th align=""left"">User Email:</th><td>{loggedInUser.Email}</td></tr>
                        <tr><th align=""left"">Campaign Name:</th><td>{campaign.CampaignName}</td></tr>
                        <tr><th align=""left"">Broadcast Date:</th><td>{campaign.BroadcastDate.Value.ToString("d")}</td></tr>
                        <tr><th align=""left"">Rebroadcast:</th><td>{(campaign.ReBroadCast? "Yes": "No")}</td></tr>
                        <tr><th align=""left"">Rebroadcast Date:</th><td>{(campaign.ReBroadcastDate.HasValue? campaign.ReBroadcastDate.ToString(): "")}</td></tr>
                        <tr><th align=""left"">From Line:</th><td>{campaign.FromLine}</td></tr>
                        <tr><th align=""left"">Subject Line:</th><td>{campaign.SubjectLine}</td></tr>
                        <tr><th align=""left"">Personalization:</th><td>{(campaign.IsPersonalization? "Yes": "No")}</td></tr>
                        <tr><th align=""left"">Matchback:</th><td>{(campaign.IsMatchback ? "Yes" : "No")}</td></tr>
                        <tr><th align=""left"">Suppression:</th><td>{(campaign.IsSuppression? "Yes": "No")}</td></tr>
                        <tr><th align=""left"">White Label:</th><td>{campaign.WhiteLabel}</td></tr>
                        <tr><th align=""left"">HTML File:</th><td>{campaign.Assets.CreativeUrl}</td></tr>
                        <tr><th align=""left"">Test Seed:</th><td>{campaign.Assets.TestSeedUrl}</td></tr>  
                        <tr><th align=""left"">Live Seed:</th><td>{campaign.Assets.LiveSeedUrl}</td></tr>   
                        <tr><th align=""left"">Special Instructions:</th><td>{campaign.SpecialInstructions}</td></tr>                                     
                        <tr><th align=""left"">Start Time:</th><td>{campaign.CreatedAt.AddMinutes(2).AddSeconds(30)}</td></tr>
                        <tr><th align=""left"">IP:</th><td>{campaign.IP}</td></tr>
                        <tr><th align=""left"">Browser:</th><td>{campaign.Browser}</td></tr>
                        <tr><th align=""left"">OS:</th><td>{campaign.OS}</td></tr>
                        <tr><th align=""left"">Referrer:</th><td>{campaign.Referrer}</td></tr>
                        </table></p> <p>We will soon contact you and update you about your order.</p> {Footer}";

            SendEmail(loggedInUser.Email, subject, body);
        }

        public static void SendOrderEmailToAds(Campaign campaign, WfpUser loggedInUser, string to, string ccEmails)
        {
            string subject = $"New Order Received, Order # {campaign.OrderNumber}, Campaign Date {campaign.BroadcastDate?.ToString("d")}, QTY {campaign.Quantity} , Date Submitted {campaign.CreatedAt:d}";

            string body = $@"<br/><p>Dear ADS team, <br/><br/> New Order has been entered into system. Order details is as below;</p>
                        <table border=""2"">
                        <tr><th align=""left"">Order #:</th><td>{campaign.OrderNumber}</td></tr>
                        <tr><th align=""left"">Status:</th><td>{(CampaignStatus)campaign.Status}</td></tr>
                        <tr><th align=""left"">Username:</th><td>{loggedInUser.UserName.ToCapitalLetterString().ToCapitalized()}</td></tr>
                        <tr><th align=""left"">User Email:</th><td>{loggedInUser.Email}</td></tr>
                        <tr><th align=""left"">Campaign Name:</th><td>{campaign.CampaignName}</td></tr>
                        <tr><th align=""left"">Broadcast Date:</th><td>{campaign.BroadcastDate.Value.ToString("d")}</td></tr>
                        <tr><th align=""left"">Rebroadcast:</th><td>{(campaign.ReBroadCast ? "Yes" : "No")}</td></tr>
                        <tr><th align=""left"">Rebroadcast Date:</th><td>{(campaign.ReBroadcastDate.HasValue ? campaign.ReBroadcastDate.ToString() : "")}</td></tr>
                        <tr><th align=""left"">From Line:</th><td>{campaign.FromLine}</td></tr>
                        <tr><th align=""left"">Subject Line:</th><td>{campaign.SubjectLine}</td></tr>
                        <tr><th align=""left"">Personalization:</th><td>{(campaign.IsPersonalization ? "Yes" : "No")}</td></tr>
                        <tr><th align=""left"">Matchback:</th><td>{(campaign.IsMatchback ? "Yes" : "No")}</td></tr>
                        <tr><th align=""left"">Suppression:</th><td>{(campaign.IsSuppression ? "Yes" : "No")}</td></tr>
                        <tr><th align=""left"">White Label:</th><td>{campaign.WhiteLabel}</td></tr>
                        <tr><th align=""left"">HTML File:</th><td>{campaign.Assets.CreativeUrl}</td></tr>
                        <tr><th align=""left"">Test Seed:</th><td>{campaign.Assets.TestSeedUrl}</td></tr>  
                        <tr><th align=""left"">Live Seed:</th><td>{campaign.Assets.LiveSeedUrl}</td></tr>   
                        <tr><th align=""left"">Special Instructions:</th><td>{campaign.SpecialInstructions}</td></tr>                                     
                        <tr><th align=""left"">Start Time:</th><td>{campaign.CreatedAt.AddMinutes(2).AddSeconds(30)}</td></tr>
                        <tr><th align=""left"">IP:</th><td>{campaign.IP}</td></tr>
                        <tr><th align=""left"">Browser:</th><td>{campaign.Browser}</td></tr>
                        <tr><th align=""left"">OS:</th><td>{campaign.OS}</td></tr>
                        <tr><th align=""left"">Referrer:</th><td>{campaign.Referrer}</td></tr>
                        </table></p> {Footer}";

            SendEmail(to, subject, body, ccEmails);
        }

        public static string SendApprovedToVendor(Vendor vendor, Campaign campaign, CampaignSegment segment)
        {
            string newOld = campaign.ReBroadcasted ? "RDP" : "New";
            string deployDate = campaign.ReBroadcasted ? campaign.ReBroadcastedDate?.ToString("d") : campaign.Approved.DeployDate?.ToString("d");
            string deployTime = campaign.ReBroadcasted ? campaign.ReBroadcastedDate?.ToString("hh:mm") : campaign.Approved.DeployDate?.ToString("hh:mm");
            string quantity = campaign.ReBroadcasted ? campaign.ReBroadcastedQuantity.ToString() : campaign.Approved.Quantity.ToString();

            string orderNumber;
            string subject;
            string segmentsHtml = string.Empty;
            if (segment == null)
            {
                orderNumber = campaign.ReBroadcasted ? $"ADS{campaign.ReBroadcastedOrderNumber}" : $"ADS{campaign.OrderNumber}";
                subject = $"{newOld} Order {campaign.Approved.CampaignName}, Order # {orderNumber}";
            } else
            {
                orderNumber = $"ADS{segment.SegmentNumber}";
                subject = $"{newOld} Order {campaign.Approved.CampaignName}, Order # {orderNumber}";
                //                   <tr><th align=""left"">Data File</th><td>{segment.SegmentDataFileUrl}</td></tr>
                segmentsHtml += $@"<table border=""1"">
                                <tr><th align=""left"">Segment</th><td>{segment.SegmentNumber}</td></tr>
                                <tr><th align=""left"">Subject Line</th><td>{segment.SubjectLine}</td></tr>
                                <tr><th align=""left"">From Line</th><td>{segment.FromLine}</td></tr>
                                <tr><th align=""left"">White Label</th><td>{segment.WhiteLabel}</td></tr>
                                <tr><th align=""left"">Deployment Date</th><td>{segment.DeploymentDate}</td></tr>
                                <tr><th align=""left"">Total Records</th><td>{NumberHelper.GetTotal(
                    segment.FirstRangeStart, segment.FirstRangeEnd, segment.SecondRangeStart, segment.SecondRangeEnd,
                    segment.ThirdRangeStart, segment.ThirdRangeEnd)}</td></tr></table>";
            }

            string body = $@"<br/><p>Dear {vendor.Name}</p><br/>
                    Please find below Order details<br/><br/>
                    <table border=""2"">
                    <tr><th align=""left""> Reference #:</th><td>{campaign.Approved.ReferenceNumber}</td></tr>
                    <tr><th align=""left"">Order #:</th><td>{orderNumber}</td></tr>
                    <tr><th align=""left"">Campaign Name:</th><td>{campaign.Approved.CampaignName}</td></tr>
                    <tr><th align=""left"">Rebroadcast:</th><td>{(campaign.Approved.ReBroadCast? "Yes": "No")}</td></tr>                                        
                    <tr><th align=""left"">Broadcast Date:</th><td>{campaign.Approved.DeployDate.Value:d}</td></tr>
                    <tr><th align=""left"">From Line:</th><td>{campaign.Approved.FromLine}</td></tr>
                    <tr><th align=""left"">Subject Line:</th><td>{campaign.Approved.SubjectLine}</td></tr>
                    <tr><th align=""left"">Opt Out:</th><td>{campaign.OptOut}</td></tr>
                    <tr><th align=""left"">White Label:</th><td>{campaign.Approved.WhiteLabel}</td></tr>                                        
                    <tr><th align=""left"">Personalization:</th><td>{(campaign.IsPersonalization? "Yes": "No")}</td></tr>
                    <tr><th align=""left"">Creative URL:</th><td>{campaign.Assets.CreativeUrl}</td></tr>
                    <tr><th align=""left"">Quantity:</th><td>{quantity}</td></tr>
                    <tr><th align=""left"">Geo (s):</th><td>{campaign.Approved.GeoDetails}</td></tr>
                    <tr><th align=""left"">Demographics:</th><td>{campaign.Approved.Demographics}</td></tr>
                    <tr><tr><th align=""left"">Zip URL:</th><td>{campaign.Assets.ZipCodeUrl}</td></tr>
                    <tr><th align=""left"">Special Instructions:</th><td>{campaign.Approved.SpecialInstructions}</td></tr>
                    <tr><th align=""left"">Deploy Date:</th><td>{deployDate}</td></tr>
                    <tr><th align=""left"">Deploy Time:</th><td>{deployTime}</td></tr>
                    <tr><th align=""left"">ReportSite Link:</th><td>{campaign.Approved.ReportSiteLink}</td></tr>
                    <tr><th align=""left"">Data Breakout:</th><td>{campaign.Testing.DataFileUrl}</td></tr>
                    <tr><th align=""left"">Has Open Pixel:</th><td>{(campaign.Approved.IsOpenPixel? "Yes": "No")}</td></tr>
                    <tr><th align=""left"">Open Pixel URL:</th><td>{campaign.Approved.OpenPixelUrl}</td></tr>
                    <tr><th align=""left"">Open Goals:</th><td>{campaign.Approved.OpenGoals}</td></tr>
                    <tr><th align=""left"">Click Goals:</th><td>{campaign.Approved.ClickGoals}</td></tr>
                    <tr><th align=""left"">Segment Data:</th><td>{segmentsHtml}</td></tr>
                    </table></p> <p></p> {Footer}";
            SendEmail(vendor.Email, subject, body, vendor.CcEmails);
            return body;
        }

        public static void SendNotificationsToVendor(Vendor vendor, List<Campaign> campaigns)
        {
            string subject = "Campaign Issues Notifications";

            StringBuilder problems = new StringBuilder(@"<table border=""2""><tr><th align=""left"">Order #</th><th align=""left"">Campaign Name</th><th align=""left"">Check Time</th><th align=""left"">Problem</th><th align=""left"">Problem Detail</th></tr>");
            foreach (var campaign in campaigns)
            {
                foreach (var notification in campaign.Notifications)
                {
                    problems.Append($"<tr><td>{campaign.OrderNumber}</td><td>{campaign.CampaignName}</td><td>{notification.CheckTime}</td><td>{(QcRule)notification.QcRule}</td><td>{QcRuleUtility.GetString(notification.QcRule)}</td></tr>");
                }
            }
            problems.Append("</table>");
            string body = $@"<br/><p>Dear {vendor.Name}</p><br/>There is problem with these orders<br/><br/></p> <p>{problems}</p> {Footer}";
            SendEmail(vendor.Email, subject, body, vendor.CcEmails);
        }

        public static void SendErrorEmail(string to, Exception ex, string currentController, string currentAction)
        {
            if (ConfigurationManager.AppSettings["IsLive"] == "true")
            {
                string subject = "ADSLive: An error has been occured.";
                string body = $@"<p>ADSLive: An error has been occured.</p>
                            <p>Controller : {currentController}</p><p>Action : {currentAction}</p>
                            <p>Error Details : {ex.GetExceptionMessage()}</p>";
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