using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WFP.ICT.Data.Entities
{
    public class CampaignCreative : BaseEntity, iBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }

        public Guid? CampaignId { get; set; }

        public string OrderNumber { get; set; }
        public string CreativeHtml { get; set; }
        public bool IsTested { get; set; }
        public DateTime? TestDateTime { get; set; }

        public CampaignCreative()
        {
        }
    }
}
