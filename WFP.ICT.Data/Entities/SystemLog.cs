using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace WFP.ICT.Data.Entities
{
    public class SystemLog : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }

        public int LogType { get; set; } // Enum.LogType
        public int LogStatus { get; set; } // Enum.LogStatus
        public string OrderNumber { get; set; }
        public string Message { get; set; }

        public SystemLog()
        {
        }
    }
}
