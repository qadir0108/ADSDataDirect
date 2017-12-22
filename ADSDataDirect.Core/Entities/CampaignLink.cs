using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSDataDirect.Core.Entities
{
    public sealed class CampaignLink : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        public string OrderNumber { get; set; }
        public Guid? CampaignId { get; set; }

        public int SalesMasterId { get; set; }

        // https://verum.com/3011/u/1 by adding basePath
        public string URL { get; set; } // 3010/u/1
        public bool IsURLRedemed { get; set; }

        public string OpenURL { get; set; }
        public bool IsOpenURLRedemed { get; set; }

        public string BannerURL { get; set; } // 3010/b/1 // https://verum.com/3011/b/1
        public bool IsBannerURLRedemed { get; set; }

        public CampaignLink()
        {
        }
    }
}
