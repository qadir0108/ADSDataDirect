using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace WFP.ICT.Web.Models
{
    public class UserProfileVM
    {
        public string APIKey { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }

        public Guid? OfficeID { get; set; }
        public Guid? UnitID { get; set; }
        
        public IEnumerable<SelectListItem> Offices { get; set; }
        public IEnumerable<SelectListItem> Units { get; set; }
    }
}