using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSDataDirect.Core.Entities
{
    public class AspNetRoleClaims : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }

        public Guid ClaimID { get; set; }
        public virtual AspNetClaims Claim { get; set; }

        public string RoleID { get; set; }
        public virtual WfpRole Role { get; set; }

        public AspNetRoleClaims()
        {
        }
    }
}
