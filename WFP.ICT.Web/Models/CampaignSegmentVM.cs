using System;
using System.Collections.Generic;

namespace WFP.ICT.Web.Models
{
    public class CampaignSegmentVM
    {
        public Guid Id { get; set; }
        public string CampaignId { get; set; }
        public string OrderNumber { get; set; }

        public DateTime? BroadcastDate { get; set; }
        public DateTime? DeploymentDate { get; set; }
        public string SubjectLine { get; set; }
        public string CreativeFiles { get; set; }

        public int FirstRangeStart { get; set; }
        public int FirstRangeEnd { get; set; }
        public int SecondRangeStart { get; set; }
        public int SecondRangeEnd { get; set; }
        public int ThirdRangeStart { get; set; }
        public int ThirdRangeEnd { get; set; }

        public string SegmentNumber { get; set; } // 2500A, 2500B, 2500C
        public string SegmentDataFileUrl { get; set; } // aws/2500Adata.csv, aws/2500Bdata.csv, aws/2500Cdata.csv
        public DateTime? DateFetched { get; set; }
        public int UploadStatus { get; set; } // UploadFileStatusEnum
        public int SegmentStatus { get; set; } // SegmentStatusEnum
        public DateTime? DateApproved { get; set; }
        public DateTime? DateSent { get; set; }
        public DateTime? DateComplete { get; set; }

    }
}