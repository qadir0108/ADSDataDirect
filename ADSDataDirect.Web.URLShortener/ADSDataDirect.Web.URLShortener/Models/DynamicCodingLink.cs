using System;
using System.Collections.Generic;

namespace ADSDataDirect.Web.URLShortener.Models
{
    public partial class DynamicCodingLink
    {
        public DynamicCodingLink()
        {
        }

        public Guid Id { get; set; }
        public DateTime CreatedAt { get; set; }
        public Guid? CampaignId { get; set; }
        public string OrderNumber { get; set; }

        public int SalesMasterId { get; set; }
        public string URLType { get; set; }
        public string OrignalURL { get; set; }
        public string VerumURL { get; set; } // 3010/u/1 https://verum.com/3011/u/1 by adding basePath
        public bool IsURLRedemed { get; set; }
    }
}
