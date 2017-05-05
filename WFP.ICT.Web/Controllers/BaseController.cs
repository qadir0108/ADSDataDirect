using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;
using WFP.ICT.Data.EntityManager;
using WFP.ICT.Enum;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Controllers
{
    public class BaseController : Controller
    {
        private WFPICTContext _db;
        public WFPICTContext db
        {
            get
            {
                return _db ?? HttpContext.GetOwinContext().Get<WFPICTContext>();
            }
            private set
            {
                _db = value;
            }
        }

        public void SetupLoggedInUser(string UserName)
        {
            var user = db.Users.Include(u => u.Roles).FirstOrDefault(x => x.UserName == UserName);
            Session["user"] = user;
        }

        public WFPUser LoggedInUser
        {
            get
            {
                return Session["user"] as WFPUser;
            }
        }

        public bool IsAdmin
        {
            get
            {
                return LoggedInUser != null && (LoggedInUser.UserType == (int)UserTypeEnum.Admin);
            }
        }

        string _uploadPath = "~/Uploads";
        public string UploadPath
        {
            get
            {
                string uploadPath = Server.MapPath(_uploadPath);
                if (!System.IO.Directory.Exists(uploadPath)) System.IO.Directory.CreateDirectory(uploadPath);
                return uploadPath;
            }
        }

        public SelectList StatusList
        {
            get
            {
                var items = EnumHelper.GetEnumTextValues(typeof(CampaignStatusEnum))
                    .Select(x => new SelectListItem()
                    {
                        Text = x.Text,
                        Value = x.Value
                    }).ToList();
                items.Insert(0, new SelectListItem()
                {
                    Text = "Select Status",
                    Value = string.Empty
                });
                return new SelectList(items, "Value", "Text");
            }
        }

        public IEnumerable<SelectListItem> MonthsList
        {
            get
            {
                var months = new List<SelectListItem>();
                for (int i = 0; i < 12; i++)
                {
                    months.Add(new SelectListItem()
                    {
                        Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(i + 1),
                        Value = i.ToString()
                    });
                }
                months.Insert(0, new SelectListItem()
                {
                    Text = "Select Month",
                    Value = string.Empty
                });
                return months;
            }
        }

        private static List<SelectListItem> _users;
        public IEnumerable<SelectListItem> UsersList
        {
            get
            {
                if (_users == null)
                {
                    var user = Session["user"] as WFPUser;
                    _users = db.Users
                        .OrderBy(x => x.CreatedAt).Select(
                             x => new SelectListItem()
                             {
                                 Text = x.UserName,
                                 Value = x.Id
                             }).ToList();
                    _users.Insert(0, new SelectListItem()
                    {
                        Text = "Select User",
                        Value = string.Empty
                    });
                }
                return _users;
            }
        }

        private static List<SelectListItem> _claimTypes;
        public IEnumerable<SelectListItem> ClaimTypes
        {
            get
            {
                if (_claimTypes == null)
                {
                    var mgr = new AspNetClaimsManager();
                    _claimTypes = mgr.GetAll().Select(
                    x => new SelectListItem()
                    {
                        Text = x.ClaimType,
                        Value = x.ClaimType
                    }).Distinct().ToList();
                    _claimTypes.Insert(0, new SelectListItem()
                    {
                        Text = "Select Category",
                        Value = string.Empty
                    });
                }
                return _claimTypes;
            }
        }

    }
}