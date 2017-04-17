using System;
using System.Collections.Generic;
using System.Net.Mail;
using System.Threading.Tasks;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;

namespace WFP.ICT.Web.Helpers
{
    public class EmailHelper
    {
        private const string Footer = @"<br/><br/>Thanks<br/>
                                        <b>ADS Data Direct</b><br/>http://www.adsdatadirect.com";

        public static async Task SendOrderEmailToClient(WFPUser loggedInUser, Campaign campaign)
        {
            string subject = string.Format("Order # {0}, Campaign Date {1}, QTY {2} , Date Submitted {3}",
                                    campaign.OrderNumber, campaign.BroadcastDate.Value.ToString("d"), campaign.Quantity, campaign.CreatedAt.ToString("d"));

            string body = string.Format(@"<br/><p>Dear {0}</p><br/>
                                       We have recevied your order.<br/><br/>
                                        <table border=""2"">
                                        <tr><th>Order #:</th><td>{1}</td></tr>
                                        <tr><th>Status:</th><td>{2}</td></tr>
                                        <tr><th>Username:</th><td>{3}</td></tr>
                                        <tr><th>User Email:</th><td>{4}</td></tr>
                                        <tr><th>Campaign Name:</th><td>{5}</td></tr>
                                        <tr><th>Broadcast Date:</th><td>{6}</td></tr>
                                        <tr><th>Rebroadcast:</th><td>{7}</td></tr>
                                        <tr><th>From Line:</th><td>{8}</td></tr>
                                        <tr><th>Subject Line:</th><td>{9}</td></tr>
                                        <tr><th>Personalization:</th><td>{10}</td></tr>
                                        <tr><th>Matchback:</th><td>{11}</td></tr>
                                        <tr><th>Suppression:</th><td>{12}</td></tr>
                                        <tr><th>White Label:</th><td>{13}</td></tr>
                                        <tr><th>Last Update:</th><td>{14}</td></tr>
                                        <tr><th>Start Time:</th><td>{15}</td></tr>
                                        <tr><tr><th>Finish Time:</th><td>{16}</td></tr>
                                        <tr><th>IP:</th><td>{17}</td></tr>
                                        <tr><th>Browser:</th><td>{18}</td></tr>
                                        <tr><th>OS:</th><td>{19}</td></tr>
                                        <tr><th>Referrer:</th><td>{20}</td></tr>
                                        </table></p> <p>We will soon contact you and update you about your order.</p> {21}"
                                      , loggedInUser.UserName.ToCapitalLetterString().ToCapitalized(), campaign.OrderNumber, (CampaignStatusEnum)campaign.Status
                                      , loggedInUser.UserName, loggedInUser.Email, campaign.CampaignName, campaign.BroadcastDate.Value.ToString("d")
                                      , campaign.ReBroadCast ? "Yes" : "No", campaign.FromLine, campaign.SubjectLine, campaign.IsPersonalization ? "Yes" : "No"
                                      , campaign.IsMatchback ? "Yes" : "No", campaign.IsSuppression ? "Yes" : "No", campaign.WhiteLabel, campaign.CreatedAt.AddMinutes(2).AddSeconds(30).ToString()
                                      , campaign.CreatedAt.ToString(), campaign.CreatedAt.AddMinutes(2).AddSeconds(30).ToString(), campaign.IP, campaign.Browser, campaign.OS, campaign.Referrer
                                      , Footer);
            await SendEmail(loggedInUser.Email, subject, body);
        }

        public static async Task SendApprovedToVendor(Vendor vendor, Campaign campaign)
        {
            string newOld = string.IsNullOrEmpty(campaign.ReBroadcastOrderNumber) ? "New" : "RDP";
            string orderNumber = string.IsNullOrEmpty(campaign.ReBroadcastOrderNumber) ? campaign.OrderNumber : campaign.ReBroadcastOrderNumber;
            string deployDate = string.IsNullOrEmpty(campaign.ReBroadcastOrderNumber) ? campaign.BroadcastDate.Value.ToString("d") : campaign.ReBroadcastDate.Value.ToString("d");
            string deployTime = string.IsNullOrEmpty(campaign.ReBroadcastOrderNumber) ? campaign.BroadcastDate.Value.ToString("hh:mm") : campaign.ReBroadcastDate.Value.ToString("hh:mm");
            string quantity = string.IsNullOrEmpty(campaign.ReBroadcastOrderNumber) ? campaign.Quantity.ToString() : campaign.ReBroadQuantity.ToString();

            string subject = string.Format("{0} Order {1}, Order # {2}",
                                    newOld, campaign.CampaignName, campaign.OrderNumber);

            string body = string.Format(@"<br/><p>Dear {0}</p><br/>
                                       Please find below Order details<br/><br/>
                                        <table border=""2"">
                                        <tr><th>Reference #:</th><td>{1}</td></tr>
                                        <tr><th>Order #:</th><td>{2}</td></tr>
                                        <tr><th>Campaign Name:</th><td>{3}</td></tr>
                                        <tr><th>Rebroadcast:</th><td>{4}</td></tr>                                        
                                        <tr><th>Broadcast Date:</th><td>{5}</td></tr>
                                        <tr><th>From Line:</th><td>{6}</td></tr>
                                        <tr><th>Subject Line:</th><td>{7}</td></tr>
                                        <tr><th>Opt Out:</th><td>{8}</td></tr>
                                        <tr><th>White Label:</th><td>{9}</td></tr>                                        
                                        <tr><th>Personalization:</th><td>{10}</td></tr>
                                        <tr><th>Creative URL:</th><td>{11}</td></tr>
                                        <tr><th>Quantity:</th><td>{12}</td></tr>
                                        <tr><th>Geo (s):</th><td>{13}</td></tr>
                                        <tr><th>Demographics:</th><td>{14}</td></tr>
                                        <tr><tr><th>Zip URL:</th><td>{15}</td></tr>
                                        <tr><th>Special Instructions:</th><td>{16}</td></tr>
                                        <tr><th>Deploy Date:</th><td>{17}</td></tr>
                                        <tr><th>Deploy Time:</th><td>{18}</td></tr>
                                        <tr><th>ReportSite Link:</th><td>{19}</td></tr>
                                        <tr><th>Link Breakout:</th><td>{20}</td></tr>
                                        </table></p> <p></p> {21}"
                                      , vendor.Name, campaign.ReferenceNumber, orderNumber, campaign.CampaignName
                                      , campaign.ReBroadCast ? "Yes" : "No", campaign.BroadcastDate.Value.ToString("d")
                                      , campaign.FromLine, campaign.SubjectLine, campaign.OptOut, campaign.WhiteLabel
                                      , campaign.IsPersonalization ? "Yes" : "No", campaign.CreativeURL, quantity
                                      , campaign.GeoDetails, campaign.Demographics, campaign.ZipURL
                                      , campaign.SpecialInstructions, deployDate, deployTime
                                      , campaign.ReportSiteLink, campaign.LinkBreakout
                                      , Footer);
            await SendEmail(vendor.Email, subject, body);
        }

        public static async Task SendEmail(string to, string subject, string body, List<string> attachments = null)
        {
            using (var smtpClient = new SmtpClient())
            {
                MailMessage msg = new MailMessage();
                msg.To.Add(new MailAddress(to));
                msg.Subject = subject;
                msg.IsBodyHtml = true;
                msg.Body = body;
                if (attachments != null)
                    foreach (var attachment in attachments)
                    {
                        msg.Attachments.Add(new System.Net.Mail.Attachment(attachment));
                    }
                await smtpClient.SendMailAsync(msg);
            }
        }
        
    }
}