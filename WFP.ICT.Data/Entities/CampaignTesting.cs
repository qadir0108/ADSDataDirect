using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WFP.ICT.Data.Entities
{
    public class CampaignTesting : BaseEntity, iBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        public Guid? CampaignId { get; set; }

        // Campaign Testing
        public string CampaignName { get; set; }
        public string WhiteLabel { get; set; }
        public bool ReBroadCast { get; set; }
        public DateTime? ReBroadcastDate { get; set; }
        public string FromLine { get; set; }
        public string SubjectLine { get; set; }
        
        public bool IsTested { get; set; }
        public DateTime? TestingTime { get; set; }
        public int TestingUrgency { get; set; } // TestingUrgencyEnum
        public DateTime? DeployDate { get; set; }

        // Campaign Demographics
        public string GeoDetails { get; set; }
        public string Demographics { get; set; }
        public long Quantity { get; set; }
        public string SpecialInstructions { get; set; }

        // DataSegment
        public long OpenGoals { get; set; }
        public long ClickGoals { get; set; }
        public long DataFileQuantity { get; set; }
        public string DataFileUrl { get; set; } // aws/2500data.csv
        public DateTime? DateFetched { get; set; }

        // Digital Plus
        public bool IsOpenPixel { get; set; }
        public string OpenPixelUrl { get; set; }
        public bool IsOmniOrder { get; set; }
        public DateTime? OmniDeployDate { get; set; }
        public long Impressions { get; set; }
        public string ChannelTypes { get; set; } // List<int> ChannelTypeEnum

        public CampaignTesting()
        {
        }
    }
}
