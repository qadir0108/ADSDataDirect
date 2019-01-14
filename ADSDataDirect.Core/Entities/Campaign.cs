using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSDataDirect.Core.Entities
{
    public sealed class Campaign : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        public string OrderNumber { get; set; }
        
        // Campaign Details
        public string CampaignName { get; set; }
        public DateTime? BroadcastDate { get; set; }
        public string RepresentativeName { get; set; }
        public string RepresentativeEmail { get; set; }
        public bool ReBroadCast { get; set; }
        public DateTime? ReBroadcastDate { get; set; }
        public long Price { get; set; }
        public int TestingUrgency { get; set; } // Enum.TestingUrgency
        public int Status { get; set; } // Enum.CampaignStatus
        // Campaign Demographics
        public string GeoDetails { get; set; }
        public string Demographics { get; set; }
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
        
        // Data Segments
        public long DataFileQuantity { get; set; }

        // Digital Plus
        public bool IsOpenPixel { get; set; }
        public string OpenPixelUrl { get; set; }
        public string BannerUrl { get; set; }
        public bool IsOmniOrder { get; set; }
        public DateTime? OmniDeployDate { get; set; }
        public long Impressions { get; set; }
        public string ChannelTypes { get; set; } // List<int> Enum.ChannelType

        public bool ReBroadcasted { get; set; }
        public DateTime? ReBroadcastedDate { get; set; }
        public long ReBroadcastedQuantity { get; set; }
        public string ReBroadcastedOrderNumber { get; set; }
        public string ReBroadcastedURL { get; set; } // RTG URL

        public Guid? AssetsId { get; set; }
        public CampaignAsset Assets { get; set; }

        public Guid? TestingId { get; set; }
        public CampaignTesting Testing { get; set; }

        public Guid? CreativeId { get; set; }
        public CampaignCreative Creative { get; set; }

        public Guid? ApprovedId { get; set; }
        public CampaignApproved Approved { get; set; }

        public ICollection<CampaignSegment> Segments { get; set; }
        public ICollection<CampaignTracking> Trackings { get; set; }
        public ICollection<ProData> ProDatas { get; set; }
        public ICollection<Notification> Notifications { get; set; }

        public Campaign()
        {
            Segments = new HashSet<CampaignSegment>();
            Trackings = new HashSet<CampaignTracking>();
            ProDatas = new HashSet<ProData>();
            Notifications = new HashSet<Notification>();
        }
    }
}
