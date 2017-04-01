using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace WFP.ICT.Data.Entities
{
    public class ProData : BaseEntity, iBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        
        public string IO { get; set; }
        public string CampaignName { get; set; }
        public string Reportsite_URL { get; set; }
        public string Destination_URL { get; set; }
        public string CampaignStartDate { get; set; }

        public long ClickCount { get; set; }
        public long UniqueCnt { get; set; }
        public long MobileCnt { get; set; }
        public long ImpressionCnt { get; set; }

        public Guid? CampaignId { get; set; }
        public virtual Campaign Campaign { get; set; }

        public ProData()
        {
        }
    }
}
