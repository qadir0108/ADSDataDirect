using System;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.Models;
using PagedList;

namespace ADSDataDirect.Web.Controllers
{
    [Authorize]
    public class StatusController : BaseController
    {
        // GET: Campaigns
        public ActionResult Index(CampaignSearchVm sc)
        {
            if (!string.IsNullOrEmpty(sc.ClearSessionId))
            {
                Session["id"] = null;
                sc.BasicString = string.Empty;
            }

            ViewBag.CurrentSort = sc.SortOrder;
            ViewBag.CampaignNameSortParm = sc.SortOrder == "CampaignName" ? "CampaignName_desc" : "CampaignName";
            ViewBag.BroadcastDateSortParm = sc.SortOrder == "BroadcastDate" ? "BroadcastDate_desc" : "BroadcastDate";
            ViewBag.CreatedBySortParm = sc.SortOrder == "CreatedBy" ? "CreatedBy_desc" : "CreatedBy";
            ViewBag.StatusSortParm = sc.SortOrder == "Status" ? "Status_desc" : "Status";
            ViewBag.OrderNumberSortParm = sc.SortOrder == "OrderNumber" ? "OrderNumber_desc" : "OrderNumber";

            var campagins = Db.Campaigns
                .Include(x => x.Testing)
                .Include(x => x.Approved)
                .Include(x => x.Trackings)
                .ToList();

            switch (sc.SortOrder)
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

            ViewBag.SearchType = sc.SearchType;
            if (sc.SearchType == "basic")
            {
                if (!string.IsNullOrEmpty(sc.BasicString))
                {
                    campagins = campagins.Where(s =>
                    s.OrderNumber.Equals(sc.BasicString) ||
                    s.ReBroadcastedOrderNumber == sc.BasicString ||
                    s.CampaignName.IndexOf(sc.BasicString, StringComparison.InvariantCultureIgnoreCase) >= 0).ToList();
                    ViewBag.BasicStringSearched = sc.BasicString;
                }
                else if (!string.IsNullOrEmpty(sc.BasicStatus))
                {
                    int status = int.Parse(sc.BasicStatus);
                    if (status == (int)CampaignStatus.Rebroadcasted)
                        campagins = campagins.Where(s => s.ReBroadcasted).ToList();
                    else if (status == (int)CampaignStatus.NotRebroadcasted)
                        campagins = campagins.Where(s => s.ReBroadCast && !s.ReBroadcasted).ToList();
                    else
                        campagins = campagins.Where(s => s.Status == status).ToList();
                    ViewBag.BasicStatusSearched = sc.BasicStatus;
                }
                else if (!string.IsNullOrEmpty(sc.BasicOrderNumber))
                {
                    campagins = campagins.Where(s => s.Id.ToString().Equals(sc.BasicOrderNumber)).ToList();
                }
            }
            else if (sc.SearchType == "advanced")
            {
                if (!string.IsNullOrEmpty(sc.AdvancedStatus))
                {
                    int status = int.Parse(sc.AdvancedStatus);
                    if (status == (int)CampaignStatus.Rebroadcasted)
                        campagins = campagins.Where(s => s.OrderNumber.EndsWith("RDP")).ToList();
                    else
                        campagins = campagins.Where(s => s.Status == status).ToList();
                    ViewBag.AdvancedStatusSearched = sc.AdvancedStatus;
                }
                if (!string.IsNullOrEmpty(sc.AdvancedUser))
                {
                    campagins = campagins.Where(s => s.CreatedBy == sc.AdvancedUser).ToList();
                    ViewBag.AdvancedUserSearched = sc.AdvancedUser;
                }

                if (!string.IsNullOrEmpty(sc.CampaignName))
                {
                    sc.CampaignName = sc.CampaignName.ToLowerInvariant();
                    campagins = campagins.Where(s => s.CampaignName.IndexOf(sc.CampaignName, StringComparison.CurrentCultureIgnoreCase) >= 0).ToList();
                    ViewBag.CampaignName = sc.CampaignName;
                }

                if (!string.IsNullOrEmpty(sc.IsTested))
                {
                    bool isTested = Boolean.Parse(sc.IsTested);
                    campagins = campagins.Where(s => s.Testing != null
                                                  && s.Testing?.IsTested == isTested).ToList();
                    ViewBag.IsTested = sc.IsTested;
                }

                if (!string.IsNullOrEmpty(sc.OrderedFrom))
                {
                    DateTime dateFrom = DateTime.ParseExact(sc.OrderedFrom, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                    campagins = campagins.Where(s => s.CreatedAt.Date >= dateFrom.Date).ToList();
                    ViewBag.OrderedFrom = sc.OrderedFrom;
                }

                if (!string.IsNullOrEmpty(sc.OrderedTo))
                {
                    DateTime dateTo = DateTime.ParseExact(sc.OrderedTo, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                    campagins = campagins.Where(s => s.CreatedAt.Date <= dateTo.Date).ToList();
                    ViewBag.OrderedTo = sc.OrderedTo;
                }

                if (!string.IsNullOrEmpty(sc.BroadcastFrom))
                {
                    DateTime dateFrom = DateTime.ParseExact(sc.BroadcastFrom, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                    campagins = campagins.Where(s => s.BroadcastDate?.Date >= dateFrom.Date).ToList();
                    ViewBag.BroadcastFrom = sc.BroadcastFrom;
                }

                if (!string.IsNullOrEmpty(sc.BroadcastTo))
                {
                    DateTime dateTo = DateTime.ParseExact(sc.BroadcastTo, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                    campagins = campagins.Where(s => s.BroadcastDate?.Date <= dateTo.Date).ToList();
                    ViewBag.BroadcastTo = sc.BroadcastTo;
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
            int pageNumber = (sc.Page ?? 1);
            return View(campagins.ToPagedList(pageNumber, PageSize));
        }

        public ActionResult ChangeAssigned(Guid? id, string userId)
        {
            Campaign campaign = Db.Campaigns.FirstOrDefault(x => x.Id == id);
            if (campaign == null)
            {
                throw new HttpException(404, "Not found");
            }
            try
            {
                campaign.AssignedToCustomer = userId;
                Db.SaveChanges();
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult SendToTracking(Guid? id, string segmentNumber, string ioNumber)
        {
            Campaign campaign = Db.Campaigns.FirstOrDefault(x => x.Id == id);
            if (campaign == null)
            {
                throw new HttpException(404, "Not found");
            }
            try
            {
                CampaignTracking campaignTracking = null;

                if(string.IsNullOrEmpty(segmentNumber))
                    campaignTracking = Db.CampaignTrackings.FirstOrDefault(x => x.CampaignId == id);
                else
                    campaignTracking = Db.CampaignTrackings.FirstOrDefault(x => x.CampaignId == id && x.SegmentNumber == segmentNumber);

                if (campaignTracking != null)
                {
                    campaignTracking.IoNumber = ioNumber;
                }
                campaign.Status = (int) CampaignStatus.Monitoring;
                Db.SaveChanges();
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}
