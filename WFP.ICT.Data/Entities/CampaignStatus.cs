using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WFP.ICT.Data.Entities
{
    public class CampaignStatus : BaseEntity, iBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
       
        public Guid? CampaignId { get; set; }
        public virtual Campaign Campaign { get; set; }

        // Status
        public int Status { get; set; } // CampaignStatusEnum
        public DateTime? DeployDateTime { get; set; }
        public string ReportSiteLink { get; set; }

        // Testing Status
        public long SeedsAdded { get; set; }
        public bool IsTested { get; set; }
        public bool ReTestRqd { get; set; }
        public DateTime? TestingStartTime { get; set; }
        public DateTime? TestingEndTime { get; set; }
        public long Duration { get; set; }
        public string TestingUser { get; set; }
        public string TestingBrowser { get; set; }
        public string TestingOs { get; set; }
        public string TestingReferrer { get; set; }
    }
}
