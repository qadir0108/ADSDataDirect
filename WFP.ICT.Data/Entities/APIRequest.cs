using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace WFP.ICT.Data.Entities
{
    public class APIRequest : BaseEntity, iBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        
        public string APIKey { get; set; }
        
        public APIRequest()
        {
        }
    }
}
