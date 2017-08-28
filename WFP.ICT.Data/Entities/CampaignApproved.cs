using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WFP.ICT.Data.Entities
{
    public class CampaignApproved : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        public Guid? CampaignId { get; set; }

        // Campaign Details
        public long ReferenceNumber { get; set; }
        public string CampaignName { get; set; }
        public string WhiteLabel { get; set; }
        public bool ReBroadCast { get; set; }
        public DateTime? ReBroadcastDate { get; set; }
        public string FromLine { get; set; }
        public string SubjectLine { get; set; }
        public DateTime? DeployDate { get; set; }

        // Campaign Demographics
        public string GeoDetails { get; set; }
        public string Demographics { get; set; }
        public long Quantity { get; set; }
        public string SpecialInstructions { get; set; }
        public string ReportSiteLink { get; set; }
        public string LinkBreakout { get; set; }

        // Data Segments
        public long OpenGoals { get; set; }
        public long ClickGoals { get; set; }
        public long DataFileQuantity { get; set; }
        public string DataFileUrl { get; set; }

        // Digital Plus
        public bool IsOpenPixel { get; set; }
        public string OpenPixelUrl { get; set; }
        public bool IsOmniOrder { get; set; }
        public DateTime? OmniDeployDate { get; set; }
        public long Impressions { get; set; }
        public string ChannelTypes { get; set; } // List<int> Enum.ChannelType

        public bool IsUseApiDataForOpen { get; set; } // Or API/Open Metric formula
        
        public CampaignApproved()
        {
        }
    }
}
