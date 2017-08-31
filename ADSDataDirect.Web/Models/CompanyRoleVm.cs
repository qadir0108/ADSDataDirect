﻿using System.Collections.Generic;
using ADSDataDirect.Enums;

namespace ADSDataDirect.Web.Models
{
    public class CompanyRoleVm
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool IsEditable { get; set; }
        public bool IsDeletable { get; set; }
        public string InUsers { get; set; }

        public string Action { get; set; }

        public string PermissionId { get; set; }
        public List<SelectItemPair> Permissions { get; set; }
    }
}