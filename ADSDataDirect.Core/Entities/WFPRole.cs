using System.Collections.Generic;
using Microsoft.AspNet.Identity.EntityFramework;

namespace ADSDataDirect.Core.Entities
{
    public sealed class WfpRole : IdentityRole
    {
        public WfpRole() : base() { }
        public WfpRole(string name) : base(name) { }
        public WfpRole(string name, bool isDeletable, bool isEditable, string description = "") : base(name) { Description = description; IsDeletable = isDeletable; IsEditable = isEditable; }

        public string Description { get; set; }
        public bool IsEditable { get; set; }
        public bool IsDeletable { get; set; }

        public ICollection<AspNetRoleClaims> RoleClaims { get; set; }

    }
}
