using System.Collections.Generic;
using System.Web.Mvc;
using WFP.ICT.Enum;

namespace WFP.ICT.Web.Models
{
    public class CreativeVM
    {
        public string Id { get; set; }
        public string CampaignId { get; set; }
        public string OrderNumber { get; set; }
        public string CampaignName { get; set; }
        public string FromLine { get; set; }
        public string SubjectLine { get; set; }
        public string TestSeedFile { get; set; }
        public string LiveSeedFile { get; set; }

        [AllowHtml]
        public string Creatives { get; set; }

        public List<SelectItemPair> TestEmails { get; set; }
        public List<SelectItemPair> LiveEmails { get; set; }
        public string QuickTestEmails { get; set; }

        public string MailChimpList { get; set; }
        public string MailChimpCampaign { get; set; }
    }
}