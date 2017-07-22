using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WFP.ICT.Data.Entities
{
    public class CampaignApproved : BaseEntity, iBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }

        public Guid? CampaignId { get; set; }

        public long ReferenceNumber { get; set; }

        // Campaign Details
        public string OrderNumber { get; set; }
        public string CampaignName { get; set; }
        public string WhiteLabel { get; set; }
        public bool ReBroadCast { get; set; }
        public DateTime? ReBroadcastDate { get; set; }
        public string FromLine { get; set; }
        public string SubjectLine { get; set; }
        public string HtmlImageFiles { get; set; }
        public string CreativeURL { get; set; }
        public DateTime? DeployDate { get; set; }

        // Campaign Demographics
        public string ZipURL { get; set; }
        public string GeoDetails { get; set; }
        public string Demographics { get; set; }
        [Range(1, int.MaxValue, ErrorMessage = "Please enter Quantity to be ordered")]
        public long Quantity { get; set; }
        public string SpecialInstructions { get; set; }
        public string LinkBreakout { get; set; }
        public string ReportSiteLink { get; set; }

        // New Fields
        public bool IsOpenPixel { get; set; }
        public string OpenPixelUrl { get; set; }
        public long OpenGoals { get; set; }
        public long ClickGoals { get; set; }
        public long DataFileQuantity { get; set; }
        public string DataFileUrl { get; set; }
        public int DataFileSegments { get; set; } // NumberOfIOsToBeGenerated
        public bool IsUseApiDataForOpen { get; set; } // Or API/Open Metric formula

        public CampaignApproved()
        {
        }
    }
}
