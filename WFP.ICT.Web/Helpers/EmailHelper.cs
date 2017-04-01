using System.Collections.Generic;
using System.Net.Mail;
using System.Threading.Tasks;

namespace WFP.ICT.Web.Helpers
{
    public class EmailHelper
    {
        private const string Footer = @"<br/><br/>Thanks<br/>
                                        <b>WFP Pakistan - ICT Unit</b><br/>http://www.wfp.org/countries/pakistan";

        public static async Task SendRegistryInEmail(string to, string name, string from, string registrySubject, string number)
        {
            string subject = "A registry has been arrived at WFP - Frontdesk";
            string body = string.Format(@"<br/><p>Dear {0}</p><br/>" 
                                      + @" We have recevied your registry from {1}. <p><b>Registry # :</b>{2}</p>"
                                      + @" <p><b>Subject :</b>{3}</p>"
                                      + @"Be patient, it will be soon delivered to you by front-desk.</p> {4}"
                                      , name, from,number, registrySubject, Footer);
            await SendEmail(to, subject, body);
        }

        public static async Task SendStationeryIssueEmail(string to, string name, string requester, string requestedOn, string issuedOn, string items, string status)
        {
            string subject = "Stationery has been "+ status +" by WFP - Admin";
            string body = string.Format(@"<br/><p>Dear {0}</p><br/>
                                        <p><b>Stationery has been {1} by WFP - Admin</b></p>
                                        <p>Requested by : {2}.</p> <p>Requested on : {3}.</p><p>{1} on : {4}.</p><p><b>Items:</b> {5}</p>{6}"
                                        , name, status, requester, requestedOn, issuedOn, items, Footer);
            await SendEmail(to, subject, body);
        }

        public static async Task SendGatepassIssueEmail(string to, string name, string requester, string requestedOn, string issuedOn, string items, string status, string number, string unit)
        {
            string subject = string.Format("A gatepass has been {0} by WFP - {1}", status, unit);
            string body = string.Format(@"<br/><p>Dear {0}</p><br/>
                                        <p><b>A gatepass has been {1} by WFP - {2}</b></p>
                                        <p><b>Gatepass # :</b>{3}</p>
                                        <p>Requested by : {4}.</p> <p>Requested on : {5}.</p><p>Issued on : {6}.</p><p><b>Items:</b> {7}</p>{8}", 
                                        name, status, unit, number, requester, requestedOn, issuedOn, items, Footer);
            await SendEmail(to, subject, body);
        }

        public static async Task SendVisitIssueEmail(string to, string name, string requester, string requestedOn, string issuedOn, string items, string status, string number, string unit)
        {
            string subject = string.Format("A visit has been {0} by WFP - {1}", status, unit);
            string body = string.Format(@"<br/><p>Dear {0}</p><br/>
                                        <p><b>A vist has been {1} by WFP - {2}</b></p>
                                        <p><b>Visit Group # :</b>{3}</p>
                                        <p>Requested by : {4}.</p> <p>Requested on : {5}.</p><p>Issued on : {6}.</p><p><b>Visitors:</b> {7}</p>{8}",
                                        name, status, unit, number, requester, requestedOn, issuedOn, items, Footer);
            await SendEmail(to, subject, body);
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