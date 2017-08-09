using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WFP.ICT.Data.Entities
{
    public class CampaignTracking : BaseEntity, iBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        public Guid? CampaignId { get; set; }

        public string SegmentNumber { get; set; }
        public DateTime? DateSent { get; set; } // OrderCreationTime
        public string StartDate { get; set; }
        public long Clicked { get; set; }
        public long Opened { get; set; }
        public string IONumber { get; set; }

        public bool IsCreatedThroughApi { get; set; }
        public string QueuedCampaignId { get; set; }
        
        public CampaignTracking()
        {
        }
    }
}
