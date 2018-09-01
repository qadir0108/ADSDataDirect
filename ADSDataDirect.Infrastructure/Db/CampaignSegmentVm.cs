using System;

namespace ADSDataDirect.Infrastructure.Db
{
    public class CampaignSegmentVm
    {
        public Guid Id { get; set; }
        public string CampaignId { get; set; }
        public string OrderNumber { get; set; }

        public string SegmentNumber { get; set; } // 2500A, 2500B, 2500C
        public DateTime? DeploymentDate { get; set; }
        public string SubjectLine { get; set; }
        public string FromLine { get; set; }
        public string WhiteLabel { get; set; }
        public long Quantity { get; set; }
        public string CreativeFiles { get; set; }

        public int FirstRangeStart { get; set; }
        public int FirstRangeEnd { get; set; }
        public int SecondRangeStart { get; set; }
        public int SecondRangeEnd { get; set; }
        public int ThirdRangeStart { get; set; }
        public int ThirdRangeEnd { get; set; }
        
        public string SegmentDataFileUrl { get; set; } // aws/2500Adata.csv, aws/2500Bdata.csv, aws/2500Cdata.csv
        public DateTime? DateFetched { get; set; }
        public int UploadStatus { get; set; } // 
        public int SegmentStatus { get; set; } // 
        public DateTime? DateApproved { get; set; }
        public DateTime? DateComplete { get; set; }

    }
}