using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;

namespace WFP.ICT.Web.Models
{
    public class CampaignApprovedVM
    {
        public Guid Id { get; set; }
        public Guid? CampaignId { get; set; }
        public string OrderNumber { get; set; }
        public DateTime CreatedAt { get; set; }

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
        [Range(1, int.MaxValue, ErrorMessage = "Please enter Quantity to be ordered")]
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

        public bool IsUseApiDataForOpen { get; set; } // Or API/Open Metric formula

        public List<ChannelType> ChannelTypes { get; set; } // List<int> Enum.ChannelType

        public virtual CampaignAsset Assets { get; set; }

        public ICollection<CampaignSegmentVM> Segments { get; set; }

        public CampaignApprovedVM()
        {
            Segments = new HashSet<CampaignSegmentVM>();
        }
    }
}
