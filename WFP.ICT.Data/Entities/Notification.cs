using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WFP.ICT.Data.Entities
{
    public class Notification : BaseEntity, iBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }

        public Guid? CampaignId { get; set; }
        public string OrderNumber { get; set; }
        
        public int QCRule { get; set; } // QCRuleEnum
        public DateTime? CheckTime { get; set; } // Upadte always
        
        public int Status { get; set; } // NotificationStatusEnum
        public DateTime? FoundAt { get; set; } // First time when issue found
        public DateTime? ResolvedAt { get; set; }
        public DateTime? ExpiredAt { get; set; }

        public bool IsNotification1Sent { get; set; } // 0800
        public bool IsNotification2Sent { get; set; } // 1200
        public bool IsNotification3Sent { get; set; } // 1700

        public Notification()
        {
        }
    }
}
