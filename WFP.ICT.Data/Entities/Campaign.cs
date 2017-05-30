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
        
        public int Status { get; set; } // CampaignStatusEnum

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

        // Campaign Demographics
        public string ZipCodeFile { get; set; }
        public string GeoDetails { get; set; }
        public string Demographics { get; set; }
        [Range(1, int.MaxValue, ErrorMessage = "Please enter Quantity to be ordered")]
        public long Quantity { get; set; }

        // Campaign Testing
        public string FromLine { get; set; }
        public string SubjectLine { get; set; }
        public string HtmlImageFiles { get; set; }
        public string TestSeedList { get; set; }
        public string FinalSeedList { get; set; }

        // Additional Info
        public string SuppressionFile { get; set; }
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

        // #s
        public string OrderNumber { get; set; }

        public string AssignedToCustomer { get; set; }
        public string IONumber { get; set; }
        
        public Guid? RebroadId { get; set; }
        public virtual Campaign Rebroad { get; set; }

        public Guid? TestingId { get; set; }
        public virtual CampaignTesting Testing { get; set; }

        public Guid? ApprovedId { get; set; }
        public virtual CampaignApproved Approved { get; set; }

        public Guid? CreativeId { get; set; }
        public virtual CampaignCreative Creative { get; set; }

        public virtual ICollection<ProData> ProDatas { get; set; }

        public Campaign()
        {
            ProDatas = new HashSet<ProData>();
        }
    }
}
