using System;

namespace ADSDataDirect.Core.Entities
{
    public class BaseEntity
    {
        public DateTime CreatedAt { get; set; }
        public string CreatedBy { get; set; }
    }
}
