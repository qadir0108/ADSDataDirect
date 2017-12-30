using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSDataDirect.Core.Entities
{
    public sealed class DynamicCodingLookup : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        public string OrderNumber { get; set; }
        public Guid? CampaignId { get; set; }

        public string VerumURL { get; set; } // 3010/u/1
        public string OrignalURL { get; set; } // orbee link
        public string URLType { get; set; } // u, o, b
        public long Qunatity { get; set; }

        public DynamicCodingLookup()
        {
        }
    }
}
