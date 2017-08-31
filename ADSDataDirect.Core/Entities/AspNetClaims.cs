using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSDataDirect.Core.Entities
{
    public class AspNetClaims : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }

        public string ClaimType { get; set; }
        public string ClaimValue { get; set; }

        public virtual ICollection<AspNetRoleClaims> RoleClaims { get; set; }

        public AspNetClaims()
        {
        }
    }
}
