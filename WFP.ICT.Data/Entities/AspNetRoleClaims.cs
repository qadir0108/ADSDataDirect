using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace WFP.ICT.Data.Entities
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
