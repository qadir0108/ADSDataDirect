using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;

namespace ADSDataDirect.Web.Models
{
    public class CampaignTestingVm
    {
        public Guid Id { get; set; }
        public Guid? CampaignId { get; set; }
        public string OrderNumber { get; set; }
        public DateTime CreatedAt { get; set; }

        // Campaign Testing
        public string CampaignName { get; set; }
        public string WhiteLabel { get; set; }
        public bool ReBroadCast { get; set; }
        public DateTime? ReBroadcastDate { get; set; }
        public string FromLine { get; set; }
        public string SubjectLine { get; set; }
        
        public bool IsTested { get; set; }
        public DateTime? TestingTime { get; set; }
        public int TestingUrgency { get; set; } // Enum.TestingUrgency
        public DateTime? DeployDate { get; set; }

        // Campaign Demographics
        public string GeoDetails { get; set; }
        public string Demographics { get; set; }
        [Range(1, int.MaxValue, ErrorMessage = "Please enter Quantity to be ordered")]
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
        public string BannerUrl { get; set; }
        public bool IsOmniOrder { get; set; }
        public DateTime? OmniDeployDate { get; set; }
        public long Impressions { get; set; }
        public List<ChannelType> ChannelTypes { get; set; } // List<int> Enum.ChannelType

        public int PaceDays { get; set; } // number of days campaign active for) 11/1 - 11/15
        public bool IsDynamicCoding { get; set; }
        public string DynamicCodingFile { get; set; }

        public CampaignAsset Assets { get; set; }

        public ICollection<CampaignSegmentVm> Segments { get; set; }

        public CampaignTestingVm()
        {
            Segments = new HashSet<CampaignSegmentVm>();
        }
    }
}
