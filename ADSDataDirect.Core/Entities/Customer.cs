using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSDataDirect.Core.Entities
{
    public class Customer : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        
        public string Code { get; set; }
        public string Name { get; set; }
        public string WebDomain { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        
        public Customer()
        {
        }
    }
}
