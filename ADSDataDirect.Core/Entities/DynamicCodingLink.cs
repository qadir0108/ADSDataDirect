using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSDataDirect.Core.Entities
{
    public sealed class DynamicCodingLink : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        public string OrderNumber { get; set; }
        public Guid? CampaignId { get; set; }

        public int SalesMasterId { get; set; }

        public string OrignalURL { get; set; } // orbee link
        public string URLType { get; set; } // u, o, b
        //// 3010/u/1 https://verum.com/3011/u/1 by adding basePath 
        public string VerumURL { get; set; } // 3010/u/1
        public bool IsURLRedemed { get; set; }

        public DynamicCodingLink()
        {
        }
    }
}
