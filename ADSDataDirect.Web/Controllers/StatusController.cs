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
                .Include(x => x.Trackings);

            campagins = FilterSortCampaigns(campagins, sc);

            ViewBag.BasicOrderNumber = OrderNumberList;
            ViewBag.BasicStatus = StatusList;
            ViewBag.AdvancedStatus = StatusList;
            ViewBag.AdvancedUser = UsersList;
            ViewBag.AdvancedWhiteLabel = CustomersWithWLList;
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
