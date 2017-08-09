using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WFP.ICT.Data.Entities
{
    public class Campaign : BaseEntity, iBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        public string OrderNumber { get; set; }
        
        // Campaign Details
        public string CampaignName { get; set; }
        [Required]
        public DateTime? BroadcastDate { get; set; }
        public string RepresentativeName { get; set; }
        public string RepresentativeEmail { get; set; }
        public bool ReBroadCast { get; set; }
        public DateTime? ReBroadcastDate { get; set; }
        public long Price { get; set; }
        public int TestingUrgency { get; set; } // TestingUrgencyEnum
        public int Status { get; set; } // CampaignStatusEnum
        // Campaign Demographics
        public string GeoDetails { get; set; }
        public string Demographics { get; set; }
        [Range(1, int.MaxValue, ErrorMessage = "Please enter Quantity to be ordered")]
        public long Quantity { get; set; }
        // Campaign Testing
        public string FromLine { get; set; }
        public string SubjectLine { get; set; }
        // Additional Info
        public bool IsPersonalization { get; set; }
        public bool IsMatchback { get; set; }
        public bool IsSuppression { get; set; }
        public string WhiteLabel { get; set; }
        public string OptOut { get; set; }
        public bool IsAddViewInBrowser { get; set; }
        public bool IsAddOptOut { get; set; }
        public string SpecialInstructions { get; set; }
        public string IP { get; set; }
        public string Browser { get; set; }
        public string OS { get; set; }
        public string Referrer { get; set; }

        public string AssignedToCustomer { get; set; }

        public bool ReBroadCasted { get; set; }
        public DateTime? ReBroadcastedDate { get; set; }
        public long ReBroadcastedQuantity { get; set; }

        // Data Segments
        public bool IsAccessCreativeManager { get; set; }
        public long DataFileQuantity { get; set; }
        [Range(0, 10)]
        public int DataFileSegments { get; set; } // NumberOfIOsToBeGenerated

        // Digital Plus
        public bool IsOpenPixel { get; set; }
        public string OpenPixelUrl { get; set; }
        public bool IsOmniOrder { get; set; }
        public DateTime? OmniDeployDate { get; set; }
        public string Impressions { get; set; }
        public int Retargeting { get; set; } // RetargetingEnum

        public Guid? AssetsId { get; set; }
        public virtual CampaignAsset Assets { get; set; }

        public Guid? TestingId { get; set; }
        public virtual CampaignTesting Testing { get; set; }

        public Guid? CreativeId { get; set; }
        public virtual CampaignCreative Creative { get; set; }

        public Guid? ApprovedId { get; set; }
        public virtual CampaignApproved Approved { get; set; }
        
        public virtual ICollection<CampaignTracking> Trackings { get; set; }
        public virtual ICollection<ProData> ProDatas { get; set; }
        public virtual ICollection<Notification> Notifications { get; set; }

        public Campaign()
        {
            Trackings = new HashSet<CampaignTracking>();
            ProDatas = new HashSet<ProData>();
            Notifications = new HashSet<Notification>();
        }
    }
}
