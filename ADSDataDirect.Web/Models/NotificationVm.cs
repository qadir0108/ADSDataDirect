using System.ComponentModel.DataAnnotations;

namespace ADSDataDirect.Web.Models
{
    public class NotificationVm
    {
        public string Id { get; set; }
        public string CampaignId { get; set; }
        public string OrderNumber { get; set; }
        public string SegmentNumber { get; set; }
        public string CampaignName { get; set; }

        public int QcRule { get; set; }
        public string QcRuleString { get; set; }
        public string CheckTime { get; set; }
        public string Status { get; set; } 
        public string FoundAt { get; set; }
        public string ResolvedAt { get; set; }
        public string ExpiredAt { get; set; }

        public string Message { get; set; }
    }
}