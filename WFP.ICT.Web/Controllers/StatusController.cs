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
                sc.basicString = string.Empty;
            }

            ViewBag.CurrentSort = sc.sortOrder;
            ViewBag.CampaignNameSortParm = sc.sortOrder == "CampaignName" ? "CampaignName_desc" : "CampaignName";
            ViewBag.BroadcastDateSortParm = sc.sortOrder == "BroadcastDate" ? "BroadcastDate_desc" : "BroadcastDate";
            ViewBag.CreatedBySortParm = sc.sortOrder == "CreatedBy" ? "CreatedBy_desc" : "CreatedBy";
            ViewBag.StatusSortParm = sc.sortOrder == "Status" ? "Status_desc" : "Status";
            ViewBag.OrderNumberSortParm = sc.sortOrder == "OrderNumber" ? "OrderNumber_desc" : "OrderNumber";

            var campagins = db.Campaigns
                .Include(x => x.Testing)
                .Include(x => x.Approved)
                .Include(x => x.Trackings)
                .ToList();

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
                if (!string.IsNullOrEmpty(sc.basicString))
                {
                    var searchRDP = sc.basicString + "RDP";
                    campagins = campagins.Where(s =>
                    s.OrderNumber.Equals(sc.basicString) ||
                    s.OrderNumber.Equals(searchRDP) ||
                    s.CampaignName.IndexOf(sc.basicString, StringComparison.InvariantCultureIgnoreCase) >= 0).ToList();
                    ViewBag.BasicStringSearched = sc.basicString;
                }
                else if (!string.IsNullOrEmpty(sc.basicStatus))
                {
                    int status = int.Parse(sc.basicStatus);
                    if (status == (int)CampaignStatusEnum.Rebroadcasted)
                        campagins = campagins.Where(s => s.OrderNumber.EndsWith("RDP")).ToList();
                    else
                        campagins = campagins.Where(s => s.Status == status).ToList();
                    ViewBag.BasicStatusSearched = sc.basicStatus;
                }
                else if (!string.IsNullOrEmpty(sc.basicOrderNumber))
                {
                    campagins = campagins.Where(s => s.Id.ToString().Equals(sc.basicOrderNumber)).ToList();
                }

            }
            else if (sc.searchType == "advanced")
            {
                if (!string.IsNullOrEmpty(sc.advancedStatus))
                {
                    int status = int.Parse(sc.advancedStatus);
                    if (status == (int)CampaignStatusEnum.Rebroadcasted)
                        campagins = campagins.Where(s => s.OrderNumber.EndsWith("RDP")).ToList();
                    else
                        campagins = campagins.Where(s => s.Status == status).ToList();
                    ViewBag.AdvancedStatusSearched = sc.advancedStatus;
                }
                if (!string.IsNullOrEmpty(sc.advancedUser))
                {
                    campagins = campagins.Where(s => s.CreatedBy == sc.advancedUser).ToList();
                    ViewBag.AdvancedUserSearched = sc.advancedUser;
                }

                if (!string.IsNullOrEmpty(sc.campaignName))
                {
                    sc.campaignName = sc.campaignName.ToLowerInvariant();
                    campagins = campagins.Where(s => s.CampaignName.IndexOf(sc.campaignName, StringComparison.CurrentCultureIgnoreCase) >= 0).ToList();
                    ViewBag.CampaignName = sc.campaignName;
                }

                if (!string.IsNullOrEmpty(sc.isTested))
                {
                    bool IsTested = Boolean.Parse(sc.isTested);
                    campagins = campagins.Where(s => s.Testing != null
                                                  && s.Testing?.IsTested == IsTested).ToList();
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

            if (!IsAdmin)
            {
                campagins = campagins.Where(s => s.CreatedBy == LoggedInUser?.UserName).ToList();
            }

            ViewBag.BasicOrderNumber = OrderNumberList;
            ViewBag.BasicStatus = StatusList;
            ViewBag.AdvancedStatus = StatusList;
            ViewBag.AdvancedUser = UsersList;
            ViewBag.Customer = UsersList;

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

        public ActionResult SendToTracking(Guid? Id, string SegmentNumber, string IONumber)
        {
            Campaign campaign = db.Campaigns.FirstOrDefault(x => x.Id == Id);
            if (campaign == null)
            {
                throw new HttpException(404, "Not found");
            }
            try
            {
                CampaignTracking campaignTracking = null;

                if(string.IsNullOrEmpty(SegmentNumber))
                    campaignTracking = db.CampaignTrackings.FirstOrDefault(x => x.CampaignId == Id);
                else
                    campaignTracking = db.CampaignTrackings.FirstOrDefault(x => x.CampaignId == Id && x.SegmentNumber == SegmentNumber);

                if (campaignTracking != null)
                {
                    campaignTracking.IONumber = IONumber;
                }
                campaign.Status = (int) CampaignStatusEnum.Traffic;
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
