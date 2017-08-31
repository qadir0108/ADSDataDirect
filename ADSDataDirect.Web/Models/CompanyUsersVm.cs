using System;
using System.Collections.Generic;
using ADSDataDirect.Enums;

namespace ADSDataDirect.Web.Models
{
    public class CompanyUsersVm
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Status { get; set; }
        
        public string Action { get; set; }
        public string OfficeId { get; set; }
        public string UnitId { get; set; }

        public string OfficeName { get; set; }
        public string UnitName { get; set; }

        public string Password { get; set; }

        public string Role { get; set; }
        public List<SelectItemPair> Roles { get; set; }

        public bool IsLocalUser { get; set; }
    }
}