using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Core.Entities;
using Microsoft.AspNet.Identity.Owin;

namespace ADSDataDirect.Web.Controllers
{
    public class AccountControllerBase : Controller
    {
        
        private WfpictContext _db;
        protected WfpictContext Db
        {
            get
            {
                if (_db != null) return _db;
                _db = HttpContext.GetOwinContext().Get<WfpictContext>();
                return _db;
            }
            private set
            {
                _db = value;
            }
        }

        public void SetupLoggedInUser(string userName)
        {
            var user = Db.Users
                .Include(u => u.Roles)
                .Include(x => x.Customer)
                .FirstOrDefault(x => x.UserName == userName);
            Session["user"] = user;
        }

        protected WfpUser LoggedInUser
        {
            get
            {
                return Session["user"] as WfpUser;
            }
        }

        private List<SelectListItem> _customers;
        protected IEnumerable<SelectListItem> CustomersList
        {
            get
            {
                if (_customers == null)
                {
                    _customers = Db.Customers
                        .OrderBy(x => x.CreatedAt).Select(
                            x => new SelectListItem()
                            {
                                Text = x.WhiteLabel,
                                Value = x.Id.ToString()
                            }).ToList();
                    _customers.Insert(0, new SelectListItem()
                    {
                        Text = "Select Customer",
                        Value = string.Empty
                    });
                }
                return _customers;
            }
        }
    }
}