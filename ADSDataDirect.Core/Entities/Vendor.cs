using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSDataDirect.Core.Entities
{
    public class Vendor : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        
        public string Name { get; set; }
        public string CompanyName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string CcEmails { get; set; }
        
        public Vendor()
        {
        }
    }
}
