﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Core.EntityManager;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.Models;
using Microsoft.AspNet.Identity.Owin;

namespace ADSDataDirect.Web.Controllers
{
    public class BaseController : Controller
    {
        protected readonly Random Random = new Random();
        protected const int PageSize = 10;

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

        protected bool IsAdmin
        {
            get
            {
                return LoggedInUser != null && (LoggedInUser.UserType == (int)UserType.Admin);
            }
        }

        protected readonly string DefaultTemplate = $"~/Templates/Tracking1.xlsx";
        //protected string TemplateFile
        //{
        //    get
        //    {
        //        if (LoggedInUser.Customer == null) return DefaultTemplate;
        //        return string.IsNullOrEmpty(LoggedInUser?.Customer?.ReportTemplate) ?
        //            DefaultTemplate :
        //            $"~/Templates/{LoggedInUser?.Customer?.ReportTemplate}.xlsx";
        //    }
        //}

        readonly string _uploadPath = $"~/Uploads";
        protected string UploadPath
        {
            get
            {
                string uploadPath = Server.MapPath(_uploadPath);
                if (!System.IO.Directory.Exists(uploadPath)) System.IO.Directory.CreateDirectory(uploadPath);
                return uploadPath;
            }
        }

        readonly string _downloadPath = $"~/Downloads";
        protected string DownloadPath
        {
            get
            {
                string downloadPath = Server.MapPath(_downloadPath);
                if (!System.IO.Directory.Exists(downloadPath)) System.IO.Directory.CreateDirectory(downloadPath);
                return downloadPath;
            }
        }

        readonly string _imagesPath = $"~/images";
        protected string ImagesPath
        {
            get
            {
                return Server.MapPath(_imagesPath);
            }
        }

        protected SelectList StatusList
        {
            get
            {
                var items = EnumHelper.GetEnumTextValues(typeof(CampaignStatus))
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

        protected IEnumerable<SelectListItem> ReportTemplates
        {
            get
            {
                var items = EnumHelper.GetEnumTextValues(typeof(ReportTemplate))
                    .Select(x => new SelectListItem()
                    {
                        Text = x.Text,
                        Value = x.Text
                    }).ToList();
                items.Insert(0, new SelectListItem()
                {
                    Text = "Select Template",
                    Value = string.Empty
                });
                return items;
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
        protected IEnumerable<SelectListItem> UsersList
        {
            get
            {
                if (_users == null)
                {
                    var user = Session["user"] as WfpUser;
                    _users = Db.Users
                        .OrderBy(x => x.CreatedAt).Select(
                             x => new SelectListItem()
                             {
                                 Text = x.UserName,
                                 Value = x.UserName
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

        private static bool _forceOrders;

        public static bool ForceOrders
        {
            get { return _forceOrders; }
            set { _forceOrders = value; }
        }
        private List<SelectListItem> _orderNumbers;
        public IEnumerable<SelectListItem> OrderNumberList
        {
            get
            {
                if (_orderNumbers == null || _forceOrders)
                {
                    _orderNumbers = Db.Campaigns
                        .OrderBy(x => x.CreatedAt).Select(
                             x => new SelectListItem()
                             {
                                 Text = x.OrderNumber,
                                 Value = x.Id.ToString()
                             }).ToList();
                    _orderNumbers.Insert(0, new SelectListItem()
                    {
                        Text = "Select Order #",
                        Value = string.Empty
                    });
                }
                return _orderNumbers;
            }
        }

        private static bool _forceVendors;
        protected static bool ForceVendors
        {
            get { return _forceVendors; }   
            set { _forceVendors = value; }
        }

        private List<SelectListItem> _vendors;
        protected IEnumerable<SelectListItem> VendorsList
        {
            get
            {
                if (_vendors == null || _forceVendors)
                {
                    _vendors = Db.Vendors
                        .OrderBy(x => x.CreatedAt).Select(
                             x => new SelectListItem()
                             {
                                 Text = x.Name,
                                 Value = x.Id.ToString()
                             }).ToList();
                    _vendors.Insert(0, new SelectListItem()
                    {
                        Text = "Select Vendor",
                        Value = string.Empty
                    });
                }
                return _vendors;
            }
        }

        private static bool _forceCustomers;
        protected static bool ForceCustomers
        {
            get { return _forceCustomers; }
            set { _forceCustomers = value; }
        }

        private List<SelectListItem> _customers;
        protected IEnumerable<SelectListItem> CustomersList
        {
            get
            {
                if (_customers == null || _forceCustomers)
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

        private List<SelectListItem> _customersWithWL;
        protected IEnumerable<SelectListItem> CustomersWithWLList
        {
            get
            {
                if (_customersWithWL == null || _forceCustomers)
                {
                    _customersWithWL = Db.Customers
                        .OrderBy(x => x.CreatedAt).Select(
                             x => new SelectListItem()
                             {
                                 Text = x.WhiteLabel,
                                 Value = x.WhiteLabel
                             }).ToList();
                    _customersWithWL.Insert(0, new SelectListItem()
                    {
                        Text = "Select Customer",
                        Value = string.Empty
                    });
                }
                return _customersWithWL;
            }
        }

        private List<SelectListItem> _claimTypes;
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

        private IQueryable<Campaign> FilterCampaignsBasic(IQueryable<Campaign> campagins, CampaignSearchVm sc)
        {
            if (!string.IsNullOrEmpty(sc.BasicString))
            {
                campagins = campagins.Where(s =>
                s.OrderNumber.Equals(sc.BasicString) ||
                s.ReBroadcastedOrderNumber == sc.BasicString ||
                s.CampaignName.ToLower().Contains(sc.BasicString.ToLower()));
                ViewBag.BasicStringSearched = sc.BasicString;
            }
            else if (!string.IsNullOrEmpty(sc.BasicStatus))
            {
                int status = int.Parse(sc.BasicStatus);
                switch (status)
                {
                    case (int)CampaignStatus.Rebroadcasted:
                        campagins = campagins.Where(s => s.ReBroadcasted);
                        break;
                    case (int)CampaignStatus.NotRebroadcasted:
                        campagins = campagins.Where(s => s.ReBroadCast && !s.ReBroadcasted);
                        break;
                    default:
                        campagins = campagins.Where(s => s.Status == status);
                        break;
                }
                ViewBag.BasicStatusSearched = sc.BasicStatus;
            }
            else if (!string.IsNullOrEmpty(sc.BasicOrderNumber))
            {
                campagins = campagins.Where(s => s.Id.ToString().Equals(sc.BasicOrderNumber));
            }
            return campagins;
        }

        private IQueryable<Campaign> FilterCampaignsAdvanced(IQueryable<Campaign> campagins, CampaignSearchVm sc)
        {
          
            if (!string.IsNullOrEmpty(sc.AdvancedStatus))
            {
                int status = int.Parse(sc.AdvancedStatus);
                campagins = status == (int)CampaignStatus.Rebroadcasted ? 
                    campagins.Where(s => s.OrderNumber.EndsWith("RDP")) : 
                    campagins.Where(s => s.Status == status);
                ViewBag.AdvancedStatusSearched = sc.AdvancedStatus;
            }
            if (!string.IsNullOrEmpty(sc.AdvancedUser))
            {
                campagins = campagins.Where(s => s.CreatedBy == sc.AdvancedUser);
                ViewBag.AdvancedUserSearched = sc.AdvancedUser;
            }
            if (!string.IsNullOrEmpty(sc.CampaignName))
            {
                sc.CampaignName = sc.CampaignName.ToLowerInvariant();
                campagins = campagins.Where(s => s.CampaignName.ToLower().Contains(sc.CampaignName.ToLower()));
                ViewBag.CampaignName = sc.CampaignName;
            }
            if (!string.IsNullOrEmpty(sc.AdvancedWhiteLabel))
            {
                campagins = campagins.Where(s => s.WhiteLabel == sc.AdvancedWhiteLabel
                || (s.Testing != null && s.Testing.WhiteLabel == sc.AdvancedWhiteLabel)
                || (s.Approved != null && s.Approved.WhiteLabel == sc.AdvancedWhiteLabel));
                ViewBag.AdvancedWhiteLabelSearched = sc.AdvancedWhiteLabel;
            }
            if (!string.IsNullOrEmpty(sc.OrderedFrom))
            {
                DateTime dateFrom = DateTime.ParseExact(sc.OrderedFrom, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                campagins = campagins.Where(s => s.CreatedAt.Date >= dateFrom.Date);
                ViewBag.OrderedFrom = sc.OrderedFrom;
            }
            if (!string.IsNullOrEmpty(sc.OrderedTo))
            {
                DateTime dateTo = DateTime.ParseExact(sc.OrderedTo, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                campagins = campagins.Where(s => s.CreatedAt.Date <= dateTo.Date);
                ViewBag.OrderedTo = sc.OrderedTo;
            }
            if (!string.IsNullOrEmpty(sc.BroadcastFrom))
            {
                DateTime dateFrom = DateTime.ParseExact(sc.BroadcastFrom, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                campagins = campagins.Where(s => s.BroadcastDate.HasValue && s.BroadcastDate.Value >= dateFrom.Date);
                ViewBag.BroadcastFrom = sc.BroadcastFrom;
            }
            if (!string.IsNullOrEmpty(sc.BroadcastTo))
            {
                DateTime dateTo = DateTime.ParseExact(sc.BroadcastTo, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                campagins = campagins.Where(s => s.BroadcastDate.HasValue && s.BroadcastDate.Value <= dateTo.Date);
                ViewBag.BroadcastTo = sc.BroadcastTo;
            }
            return campagins;
        }

        private IQueryable<Campaign> FilterCampaigns(IQueryable<Campaign> campagins, CampaignSearchVm sc)
        {
            ViewBag.SearchType = sc.SearchType;
            if (LoggedInUser != null && !IsAdmin)
            {
                campagins = campagins.Where(s => s.CreatedBy == LoggedInUser.UserName);
            }
            switch (sc.SearchType)
            {
                case "basic":
                    campagins = FilterCampaignsBasic(campagins, sc);
                    break;
                case "advanced":
                    campagins = FilterCampaignsAdvanced(campagins, sc);
                    break;
            }
            return campagins;
        }

        private IQueryable<Campaign> SortCampaigns(IQueryable<Campaign> campagins, CampaignSearchVm sc)
        {
            switch (sc.SortOrder)
            {
                case "OrderNumber":
                    campagins = campagins.OrderBy(s => s.OrderNumber);
                    break;
                case "OrderNumber_desc":
                    campagins = campagins.OrderByDescending(s => s.OrderNumber);
                    break;
                case "CampaignName":
                    campagins = campagins.OrderBy(s => s.CampaignName);
                    break;
                case "CampaignName_desc":
                    campagins = campagins.OrderByDescending(s => s.CampaignName);
                    break;
                case "CreatedBy":
                    campagins = campagins.OrderBy(s => s.CreatedBy);
                    break;
                case "CreatedBy_desc":
                    campagins = campagins.OrderByDescending(s => s.CreatedBy);
                    break;
                case "CreatedAt":
                    campagins = campagins.OrderBy(s => s.CreatedAt);
                    break;
                case "CreatedAt_desc":
                    campagins = campagins.OrderByDescending(s => s.CreatedAt);
                    break;
                case "BroadcastDate":
                    campagins = campagins.OrderBy(s => s.BroadcastDate);
                    break;
                case "BroadcastDate_desc":
                    campagins = campagins.OrderByDescending(s => s.BroadcastDate);
                    break;
                case "Quantity":
                    campagins = campagins.OrderBy(s => s.Quantity);
                    break;
                case "Quantity_desc":
                    campagins = campagins.OrderByDescending(s => s.Quantity);
                    break;
                case "Status":
                    campagins = campagins.OrderBy(s => s.Status);
                    break;
                case "Status_desc":
                    campagins = campagins.OrderByDescending(s => s.Status);
                    break;
                default:
                    campagins = campagins.OrderByDescending(s => s.CreatedAt);
                    break;
            }
            return campagins;
        }

        protected IQueryable<Campaign> FilterSortCampaigns(IQueryable<Campaign> campagins, CampaignSearchVm sc)
        {
            return SortCampaigns(FilterCampaigns(campagins, sc), sc);
        }
    }
}