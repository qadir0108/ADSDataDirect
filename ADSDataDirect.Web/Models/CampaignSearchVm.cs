namespace ADSDataDirect.Web.Models
{
    public class CampaignSearchVm
    {
        public string SortOrder { get; set; }
        public int? Page { get; set; }

        public string SearchType { get; set; }
        public string BasicString { get; set; }
        public string BasicOrderNumber { get; set; }
        public string BasicStatus { get; set; }

        public string AdvancedStatus { get; set; }
        public string AdvancedUser { get; set; }
        public string AdvancedWhiteLabel { get; set; }
        public string CampaignName { get; set; }
        public string OrderedFrom { get; set; }
        public string OrderedTo { get; set; }
        public string BroadcastFrom { get; set; }
        public string BroadcastTo { get; set; }
       
        public string ClearSessionId { get; set; }
    }
}