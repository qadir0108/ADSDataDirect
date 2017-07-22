namespace WFP.ICT.Web.Models
{
    public class CampaignSearchVM
    {
        public string sortOrder { get; set; }
        public int? page { get; set; }

        public string searchType { get; set; }
        public string searchString { get; set; }

        public string campaignName { get; set; }
        public string isTested { get; set; }
        public string orderedFrom { get; set; }
        public string orderedTo { get; set; }
        public string broadcastFrom { get; set; }
        public string broadcastTo { get; set; }

        public string Status { get; set; }
        public string SearchStatus { get; set; }
        public string clearSessionId { get; set; }
    }
}