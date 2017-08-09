using System.Collections.Generic;

namespace WFP.ICT.Web.Models
{
    public class CampaignSegmentVM
    {
        public string Id { get; set; }
        public int FirstRangeStart { get; set; }
        public int FirstRangeEnd { get; set; }
        public int SecondRangeStart { get; set; }
        public int SecondRangeEnd { get; set; }
        public string SegmentNumber { get; set; }

    }
}