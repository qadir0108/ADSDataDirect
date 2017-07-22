using System;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Enums;
using PagedList;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Controllers
{
    [Authorize]
    public class StatusController : BaseController
    {
        int pageSize = 10;
        
        // GET: Campaigns
        public ActionResult Index(CampaignSearchVM sc)
        {
            if (!string.IsNullOrEmpty(sc.clearSessionId))
            {
                Session["id"] = null;
                sc.searchString = string.Empty;
            }

            ViewBag.CurrentSort = sc.sortOrder;
            ViewBag.CampaignNameSortParm = sc.sortOrder == "CampaignName" ? "CampaignName_desc" : "CampaignName";
            ViewBag.BroadcastDateSortParm = sc.sortOrder == "BroadcastDate" ? "BroadcastDate_desc" : "BroadcastDate";
            ViewBag.CreatedBySortParm = sc.sortOrder == "CreatedBy" ? "CreatedBy_desc" : "CreatedBy";
            ViewBag.StatusSortParm = sc.sortOrder == "Status" ? "Status_desc" : "Status";
            ViewBag.OrderNumberSortParm = sc.sortOrder == "OrderNumber" ? "OrderNumber_desc" : "OrderNumber";

            var campagins = db.Campaigns.Include(x => x.Testing).Include(x => x.Approved).ToList();

            switch (sc.sortOrder)
            {
                case "CampaignName":
                    campagins = campagins.OrderBy(s => s.CampaignName).ToList();
                    break;
                case "CampaignName_desc":
                    campagins = campagins.OrderByDescending(s => s.CampaignName).ToList();
                    break;
                case "BroadcastDate":
                    campagins = campagins.OrderBy(s => s.BroadcastDate).ToList();
                    break;
                case "BroadcastDate_desc":
                    campagins = campagins.OrderByDescending(s => s.BroadcastDate).ToList();
                    break;
                case "CreatedBy":
                    campagins = campagins.OrderBy(s => s.CreatedBy).ToList();
                    break;
                case "CreatedBy_desc":
                    campagins = campagins.OrderByDescending(s => s.CreatedBy).ToList();
                    break;
                case "Status":
                    campagins = campagins.OrderBy(s => s.Status).ToList();
                    break;
                case "Status_desc":
                    campagins = campagins.OrderByDescending(s => s.Status).ToList();
                    break;
                case "OrderNumber":
                    campagins = campagins.OrderBy(s => s.OrderNumber).ToList();
                    break;
                case "OrderNumber_desc":
                    campagins = campagins.OrderByDescending(s => s.OrderNumber).ToList();
                    break;
                default:
                    campagins = campagins.OrderByDescending(s => s.CreatedAt).ToList();
                    break;
            }

            ViewBag.SearchType = sc.searchType;
            if (sc.searchType == "basic")
            {
                ViewBag.SearchString = sc.searchString;
                if (!string.IsNullOrEmpty(sc.searchString))
                {
                    var searchRDP = sc.searchString + "RDP";
                    campagins = campagins.Where(s =>
                    s.OrderNumber.Equals(sc.searchString) ||
                    s.OrderNumber.Equals(searchRDP) ||
                    s.CampaignName.IndexOf(sc.searchString, StringComparison.InvariantCultureIgnoreCase) >= 0).ToList();
                }
            }
            else if (sc.searchType == "advanced")
            {
                if (!string.IsNullOrEmpty(sc.SearchStatus))
                {
                    int status = int.Parse(sc.SearchStatus);
                    if (status == (int)CampaignStatusEnum.Rebroadcasted)
                        campagins = campagins.Where(s => s.OrderNumber.EndsWith("RDP")).ToList();
                    else
                        campagins = campagins.Where(s => s.Status == status).ToList();
                    ViewBag.SearchStatus = sc.SearchStatus;
                }

                if (!string.IsNullOrEmpty(sc.campaignName))
                {
                    sc.campaignName = sc.campaignName.ToLowerInvariant();
                    campagins = campagins.Where(s => s.CampaignName.IndexOf(sc.campaignName, StringComparison.CurrentCultureIgnoreCase) >= 0).ToList();
                    ViewBag.CampaignName = sc.campaignName;
                }

                if (!string.IsNullOrEmpty(sc.isTested))
                {
                    campagins = campagins.Where(s => s.Testing != null
                                                  && s.Testing?.IsTested == Boolean.Parse(sc.isTested)).ToList();
                    ViewBag.IsTested = sc.isTested;
                }

                if (!string.IsNullOrEmpty(sc.orderedFrom))
                {
                    DateTime dateFrom = DateTime.ParseExact(sc.orderedFrom, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                    campagins = campagins.Where(s => s.CreatedAt.Date >= dateFrom.Date).ToList();
                    ViewBag.OrderedFrom = sc.orderedFrom;
                }

                if (!string.IsNullOrEmpty(sc.orderedTo))
                {
                    DateTime dateTo = DateTime.ParseExact(sc.orderedTo, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                    campagins = campagins.Where(s => s.CreatedAt.Date <= dateTo.Date).ToList();
                    ViewBag.OrderedTo = sc.orderedTo;
                }

                if (!string.IsNullOrEmpty(sc.broadcastFrom))
                {
                    DateTime dateFrom = DateTime.ParseExact(sc.broadcastFrom, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                    campagins = campagins.Where(s => s.BroadcastDate?.Date >= dateFrom.Date).ToList();
                    ViewBag.BroadcastFrom = sc.broadcastFrom;
                }

                if (!string.IsNullOrEmpty(sc.broadcastTo))
                {
                    DateTime dateTo = DateTime.ParseExact(sc.broadcastTo, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                    campagins = campagins.Where(s => s.BroadcastDate?.Date <= dateTo.Date).ToList();
                    ViewBag.BroadcastTo = sc.broadcastTo;
                }
            }

            if (!string.IsNullOrEmpty(sc.Status))
            {
                int status = int.Parse(sc.Status);
                if (status == (int)CampaignStatusEnum.Rebroadcasted)
                    campagins = campagins.Where(s => s.OrderNumber.EndsWith("RDP")).ToList();
                else
                    campagins = campagins.Where(s => s.Status == status).ToList();
                ViewBag.StatusSearched = sc.Status;
            }
            else
            {
                //campagins = campagins.Where(x => x.Status != (int)CampaignStatusEnum.Completed).ToList();
            }

            if (!IsAdmin)
            {
                campagins = campagins.Where(s => s.CreatedBy == LoggedInUser?.UserName).ToList();
            }
            
            ViewBag.Status = StatusList;
            ViewBag.SearchStatus = StatusList;

            var allUsers = db.Users.Where(x => x.UserType == (int)UserTypeEnum.User).ToList();
            allUsers.Insert(0, new WFPUser() { Id = "", UserName = "Select User" });
            ViewBag.Customer = new SelectList(allUsers, "UserName", "UserName");

            // Paging
            int pageNumber = (sc.page ?? 1);
            return View(campagins.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult ChangeAssigned(Guid? Id, string UserId)
        {
            Campaign campaign = db.Campaigns.FirstOrDefault(x => x.Id == Id);
            if (campaign == null)
            {
                throw new HttpException(404, "Not found");
            }
            try
            {
                campaign.AssignedToCustomer = UserId;
                db.SaveChanges();
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult SendToTracking(Guid? Id, string IONumber)
        {
            Campaign campaign = db.Campaigns.FirstOrDefault(x => x.Id == Id);
            if (campaign == null)
            {
                throw new HttpException(404, "Not found");
            }
            try
            {
                campaign.IONumber = IONumber;
                campaign.Status = (int) CampaignStatusEnum.Tracking;
                db.SaveChanges();
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}
