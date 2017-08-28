using System;

namespace WFP.ICT.Data.Entities
{
    public interface IBaseEntity
    {
        Guid Id { get; set; }
        DateTime CreatedAt { get; set; }
        string CreatedBy { get; set; }
    }
}
