using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSDataDirect.Core.Entities
{
    public class CampaignCreative : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        public Guid? CampaignId { get; set; }

        public string CreativeHtml { get; set; }
        public bool IsTested { get; set; }
        public DateTime? TestDateTime { get; set; }

        public CampaignCreative()
        {
        }
    }
}
