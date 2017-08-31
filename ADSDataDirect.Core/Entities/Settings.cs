using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSDataDirect.Core.Entities
{
    public class Settings : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }

        public string Key { get; set; }
        public string Value { get; set; }
        public string Data { get; set; }

        public Settings()
        {
        }
    }
}
