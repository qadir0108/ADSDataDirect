using System;

namespace ADSDataDirect.Core.Entities
{
    public interface IBaseEntity
    {
        Guid Id { get; set; }
        DateTime CreatedAt { get; set; }
        string CreatedBy { get; set; }
    }
}
