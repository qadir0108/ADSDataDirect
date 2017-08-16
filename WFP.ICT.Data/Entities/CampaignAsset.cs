using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WFP.ICT.Data.Entities
{
    public class CampaignAsset : BaseEntity, iBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        public Guid? CampaignId { get; set; }

        public string ZipCodeFile { get; set; }
        public string ZipCodeUrl { get; set; }
        public int ZipCodeStatus { get; set; } // UploadFileStatusEnum

        public string TestSeedFile { get; set; }
        public string TestSeedUrl { get; set; }
        public int TestSeedStatus { get; set; } // UploadFileStatusEnum

        public string LiveSeedFile { get; set; }
        public string LiveSeedUrl { get; set; }
        public int LiveSeedStatus { get; set; } // UploadFileStatusEnum

        public string CreativeFiles { get; set; }
        public string CreativeUrl { get; set; }
        public int CreativeStatus { get; set; } // UploadFileStatusEnum

        public string SuppressionFile { get; set; }
        public string SuppressionUrl { get; set; }
        public int SuppressionStatus { get; set; } // UploadFileStatusEnum
        
        public string BannersFile { get; set; }
        public string BannersUrl { get; set; }
        public int BannersStatus { get; set; } // UploadFileStatusEnum

        public string BannerLinksFile { get; set; }
        public string BannerLinksUrl { get; set; }
        public int BannerLinksStatus { get; set; } // UploadFileStatusEnum

        public string MiscFile { get; set; }
        public string MiscUrl { get; set; }
        public int MiscStatus { get; set; } // UploadFileStatusEnum

        public CampaignAsset()
        {
        }
    }
}
