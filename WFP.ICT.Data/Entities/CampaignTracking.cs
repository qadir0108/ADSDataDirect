using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WFP.ICT.Data.Entities
{
    public class CampaignTracking : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        public Guid? CampaignId { get; set; }
        public string OrderNumber { get; set; } // 2501, 2501RDP
        public string SegmentNumber { get; set; }
        public long Quantity { get; set; }
        public DateTime? DateSent { get; set; } // OrderCreationTime
        public bool IsCreatedThroughApi { get; set; }
        public string QueuedCampaignId { get; set; }

        // For report
        public string IoNumber { get; set; }
        public DateTime? StartDate { get; set; }
        public long Opened { get; set; }
        public long Clicked { get; set; }
        public long Unsub { get; set; }
        public long Forwards { get; set; }
        public double OpenedPercentage { get; set; }
        public double ClickedPercentage { get; set; }
        public double UnsubPercentage { get; set; }
        public double ClickToOpenPercentage { get; set; } // CtrPercentage
        public double UnsubToOpenPercentage { get; set; }
        public long Bounce { get; set; }
        public long Opt { get; set; }
        public long Desktop { get; set; }
        public long Mobile { get; set; }

        public CampaignTracking()
        {
        }
    }
}
