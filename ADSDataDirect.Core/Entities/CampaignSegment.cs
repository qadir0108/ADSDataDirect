using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSDataDirect.Core.Entities
{
    public class CampaignSegment : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        public Guid? CampaignId { get; set; }
        public string OrderNumber { get; set; }

        public string SegmentNumber { get; set; } // 2500A, 2500B, 2500C
        public long Quantity { get; set; }
        public DateTime? DeploymentDate { get; set; }
        public string SubjectLine { get; set; }
        public string FromLine { get; set; }
        public string WhiteLabel { get; set; }
        public string CreativeFiles { get; set; }

        public int FirstRangeStart { get; set; }
        public int FirstRangeEnd { get; set; }
        public int SecondRangeStart { get; set; }
        public int SecondRangeEnd { get; set; }
        public int ThirdRangeStart { get; set; }
        public int ThirdRangeEnd { get; set; }
        
        public string SegmentDataFileUrl { get; set; } // aws/2500Adata.csv, aws/2500Bdata.csv, aws/2500Cdata.csv
        public DateTime? DateFetched { get; set; }
        public int UploadStatus { get; set; } // Enum.UploadFileStatus
        public int SegmentStatus { get; set; } // Enum.SegmentStatus
        public DateTime? DateApproved { get; set; }
        public DateTime? DateComplete { get; set; }
        
        public CampaignSegment()
        {
        }
    }
}
