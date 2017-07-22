using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WFP.ICT.Data.Entities
{
    public class CampaignSegment : BaseEntity, iBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }

        public Guid? CampaignId { get; set; }
        public Guid? CampaignTestingId { get; set; }
        
        public int FirstRangeStart { get; set; }
        public int FirstRangeEnd { get; set; }
        public int SecondRangeStart { get; set; }
        public int SecondRangeEnd { get; set; }

        public string SegmentIoNumber { get; set; } // 2500A, 2500B, 2500C
        public string SegmentDataFileUrl { get; set; } // aws/2500Adata.csv, aws/2500Bdata.csv, aws/2500Cdata.csv
        public DateTime? DateFetched { get; set; }
        public int DataFileStatus { get; set; } // UploadFileStatusEnum
        public DateTime? DateSent { get; set; }

        public CampaignSegment()
        {
        }
    }
}
