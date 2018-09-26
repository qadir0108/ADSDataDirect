using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSDataDirect.Core.Entities
{
    public class CampaignTesting : BaseEntity, IBaseEntity
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
        public int TestingUrgency { get; set; } // Enum.TestingUrgency
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

        public string DataFileUrlOpener { get; set; } // http://marketing248.s3.amazonaws.com/2500/2500opener.csv

        // Digital Plus
        public bool IsOpenPixel { get; set; }
        public string OpenPixelUrl { get; set; }
        public string BannerUrl { get; set; }
        public bool IsOmniOrder { get; set; }
        public DateTime? OmniDeployDate { get; set; }
        public long Impressions { get; set; }
        public string ChannelTypes { get; set; } // List<int> Enum.ChannelType

        public int PaceDays { get; set; } // number of days campaign active for) 11/1 - 11/15
        public bool IsDynamicCoding { get; set; }
        public string DynamicCodingFile { get; set; }

        public CampaignTesting()
        {
        }
    }
}
