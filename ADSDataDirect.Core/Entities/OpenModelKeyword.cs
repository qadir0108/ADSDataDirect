using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSDataDirect.Core.Entities
{
    public class OpenModelKeyword : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }

        public string Keyword { get; set; }
        public float RulePercentage { get; set; } // float y = 4.5f;

        public OpenModelKeyword()
        {

        }
    }
}
