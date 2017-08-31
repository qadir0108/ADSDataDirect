using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSDataDirect.Core.Entities
{
    public class CampaignAsset : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        public Guid? CampaignId { get; set; }

        public string ZipCodeFile { get; set; }
        public string ZipCodeUrl { get; set; }
        public int ZipCodeStatus { get; set; } // Enum.UploadFileStatus

        public string TestSeedFile { get; set; }
        public string TestSeedUrl { get; set; }
        public int TestSeedStatus { get; set; } // Enum.UploadFileStatus

        public string LiveSeedFile { get; set; }
        public string LiveSeedUrl { get; set; }
        public int LiveSeedStatus { get; set; } // Enum.UploadFileStatus

        public string CreativeFiles { get; set; }
        public string CreativeUrl { get; set; }
        public int CreativeStatus { get; set; } // Enum.UploadFileStatus

        public string SuppressionFile { get; set; }
        public string SuppressionUrl { get; set; }
        public int SuppressionStatus { get; set; } // Enum.UploadFileStatus
        
        public string BannersFile { get; set; }
        public string BannersUrl { get; set; }
        public int BannersStatus { get; set; } // Enum.UploadFileStatus

        public string BannerLinksFile { get; set; }
        public string BannerLinksUrl { get; set; }
        public int BannerLinksStatus { get; set; } // Enum.UploadFileStatus

        public string MiscFile { get; set; }
        public string MiscUrl { get; set; }
        public int MiscStatus { get; set; } // Enum.UploadFileStatus

        public CampaignAsset()
        {
        }
    }
}
