using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace WFP.ICT.Web.Models
{
    public class SystemLogVM
    {
        public string CreatedAt { get; set; }
        public string LogType { get; set; }
        public string OrderNumber { get; set; }
        public string Message { get; set; }

        public SystemLogVM()
        {
        }
    }
}
