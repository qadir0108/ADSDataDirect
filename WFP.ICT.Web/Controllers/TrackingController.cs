using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Globalization;
using System.IO;
using System.Web;
using System.Web.Mvc;
using PagedList;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;
using WFP.ICT.Web.ProData;
using WFP.ICT.Web.Reports;

namespace WFP.ICT.Web.Controllers
{
    [Authorize]
    public class TrackingController : BaseController
    {
        public ActionResult Index(CampaignSearchVM sc)
        {
            ViewBag.CurrentSort = sc.sortOrder;
            ViewBag.CampaignNameSortParm = sc.sortOrder == "CampaignName" ? "CampaignName_desc" : "CampaignName";
            ViewBag.BroadcastDateSortParm = sc.sortOrder == "BroadcastDate" ? "BroadcastDate_desc" : "BroadcastDate";
            ViewBag.CreatedBySortParm = sc.sortOrder == "CreatedBy" ? "CreatedBy_desc" : "CreatedBy";
            ViewBag.StatusSortParm = sc.sortOrder == "Status" ? "Status_desc" : "Status";
            ViewBag.OrderNumberSortParm = sc.sortOrder == "OrderNumber" ? "OrderNumber_desc" : "OrderNumber";

            var campagins = Db.Campaigns
                .Include(x => x.Approved)
                .Include(x => x.ProDatas)
                .Include(x => x.Trackings)
                .OrderByDescending(x => x.CreatedAt)
                .Where(x => x.Status == (int)CampaignStatus.Monitoring)
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
            switch (sc.searchType)
            {
                case "basic":
                    if (!string.IsNullOrEmpty(sc.basicString))
                    {
                        campagins = campagins.Where(s =>
                        s.OrderNumber.Equals(sc.basicString) ||
                        s.ReBroadcastedOrderNumber == sc.basicString ||
                        s.CampaignName.IndexOf(sc.basicString, StringComparison.InvariantCultureIgnoreCase) >= 0).ToList();
                        ViewBag.BasicStringSearched = sc.basicString;
                    }
                    else if (!string.IsNullOrEmpty(sc.basicStatus))
                    {
                        int status = int.Parse(sc.basicStatus);
                        if (status == (int)CampaignStatus.Rebroadcasted)
                            campagins = campagins.Where(s => s.ReBroadcasted).ToList();
                        else if (status == (int)CampaignStatus.NotRebroadcasted)
                            campagins = campagins.Where(s => s.ReBroadCast && !s.ReBroadcasted).ToList();
                        else
                            campagins = campagins.Where(s => s.Status == status).ToList();
                        ViewBag.BasicStatusSearched = sc.basicStatus;
                    }
                    else if (!string.IsNullOrEmpty(sc.basicOrderNumber))
                    {
                        campagins = campagins.Where(s => s.Id.ToString().Equals(sc.basicOrderNumber)).ToList();
                    }
                    break;
                case "advanced":
                    if (!string.IsNullOrEmpty(sc.advancedStatus))
                    {
                        int status = int.Parse(sc.advancedStatus);
                        if (status == (int)CampaignStatus.Rebroadcasted)
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
                        bool isTested = bool.Parse(sc.isTested);
                        campagins = campagins.Where(s => s.Testing != null
                                                      && s.Testing?.IsTested == isTested).ToList();
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
                    break;
            }
           
            if (LoggedInUser != null && !IsAdmin)
            {
                campagins = campagins.Where(s => s.CreatedBy == LoggedInUser.UserName).ToList();
            }

            ViewBag.BasicOrderNumber = OrderNumberList;
            ViewBag.BasicStatus = StatusList;
            ViewBag.AdvancedStatus = StatusList;
            ViewBag.AdvancedUser = UsersList;

            var trackingVms = new List<CampaignTrackingVm>();
            foreach (var campaign in campagins)
            {
                foreach (var campaignTracking in campaign.Trackings)
                {
                    var model = CampaignTrackingVm.FromCampaignTracking(campaign, campaignTracking);
                    trackingVms.Add(model);
                }
            }

            ViewBag.Status = StatusList;
            ViewBag.SearchStatus = StatusList;

            // Paging
            int pageNumber = (sc.page ?? 1);
            return View(trackingVms.OrderBy(x => x.OrderNumber).ToPagedList(pageNumber, PageSize));
        }

        public ActionResult Report(Guid? id)
        {
            if (id == null)
            {
                throw new HttpException(400, "Bad Request");
            }
            Campaign campaign = Db.Campaigns
                .Include(x => x.Approved)
                .Include(x => x.ProDatas)
                .Include(x => x.Trackings)
                .FirstOrDefault(x => x.Id == id);
            if (campaign == null)
            {
                throw new HttpException(404, "Not found");
            }
            if (campaign.Approved == null)
            {
                TempData["Error"] = "Campaign is not passed through Testing and Approved phase.";
                return RedirectToAction("Index", "Campaigns");
            }
            var trackingVms = new List<CampaignTrackingVm>();
            foreach (var campaignTracking in campaign.Trackings)
            {
                var model = CampaignTrackingVm.FromCampaignTracking(campaign, campaignTracking);
                trackingVms.Add(model);
            }
            trackingVms = trackingVms.OrderBy(x => x.OrderNumber).ToList();
            return View(trackingVms);
        }

        public ActionResult DownloadReport(Guid? id, Guid? trackingId)
        {
            if (id == null)
            {
                throw new HttpException(400, "Bad Request");
            }
            Campaign campaign = Db.Campaigns
                .Include(x => x.Assets)
                .Include(x => x.Segments)
                .Include(x => x.ProDatas)
                .Include(x => x.Testing)
                .Include(x => x.Approved)
                .Include(x => x.Trackings)
                .FirstOrDefault(x => x.Id == id);
            if (campaign == null)
            {
                throw new HttpException(404, "Not found");
            }
            if (campaign.Approved == null)
            {
                TempData["Error"] = "Campaign is not passed through Testing and Approved phase.";
                return RedirectToAction("Index", "Campaigns");
            }

            var campaignTracking = campaign.Trackings.FirstOrDefault(x => x.Id == trackingId);
            if (campaignTracking == null)
            {
                TempData["Error"] = "No Tracking data available.";
                return RedirectToAction("Index", "Campaigns");
            }
            var model = CampaignTrackingVm.FromCampaignTracking(campaign, campaignTracking);

            string creativeUrl = campaign.Assets.CreativeUrl,
                imagePathTemp = $"{UploadPath}\\{model.OrderNumber}t.png",
                imagePath = $"{UploadPath}\\{model.OrderNumber}.png",
                fileName = $"{model.OrderNumber}.xlsx",
                filePath = Path.Combine(DownloadPath, fileName);

            string logoFilePath = !string.IsNullOrEmpty(LoggedInUser?.CompanyLogo)
                ? $"{ImagesPath}\\{LoggedInUser.CompanyLogo}"
                : $"{ImagesPath}\\logo1.png";

            var helper = new ImageHelper(creativeUrl, imagePathTemp);
            if (!System.IO.File.Exists(imagePath))
            {
                helper.Capture();
                if (System.IO.File.Exists(imagePathTemp))
                    helper.ResizeImage(imagePathTemp, imagePath, 600, 750, true);
                if (System.IO.File.Exists(imagePathTemp))
                    System.IO.File.Delete(imagePathTemp);
            }

            string templateFile;
            if (LoggedInUser?.ReportTemplate == "0" || string.IsNullOrEmpty(LoggedInUser?.ReportTemplate))
                templateFile = $"~/Templates/Tracking1.xlsx";
            else
                templateFile = $"~/Templates/Tracking2.xlsx";

            string logoResized = $"{ImagesPath}\\logoResized.png";
            if (templateFile == $"~/Templates/Tracking1.xlsx")
            {
                helper.ResizeImage(logoFilePath, logoResized, 700, 116, true);
                TrackingReports.GenerateTemplate1(model, Server.MapPath(templateFile), logoResized, imagePath, filePath);
            }
            else //if (templateFile == $"~/Templates/Tracking2.xlsx")
            {
                helper.ResizeImage(logoFilePath, logoResized, 700, 86, true);
                TrackingReports.GenerateTemplate2(model, Server.MapPath(templateFile), logoResized, imagePath, filePath);
            }

            return File(filePath, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", fileName);
        }

        public JsonResult RefreshProData(string orderNumber)
        {
            try
            {
                if (orderNumber == null)
                {
                    throw new AdsException("Order Number missing");
                }

                Campaign campaign = Db.Campaigns
                    .Include(x => x.Approved)
                    .Include(x => x.Segments)
                    .Include(x => x.Trackings)
                    .Where(x => x.Status == (int)CampaignStatus.Monitoring || x.Segments.Any(s => s.SegmentStatus == (int)SegmentStatus.Monitoring))
                    .Where(x => x.Approved != null)
                    .FirstOrDefault(x => x.OrderNumber == orderNumber);

                // Update Tracking
                if(campaign != null)
                    ProDataApiManager.FetchAndUpdateTrackings(Db, campaign);

                // Only updating prodata
                //ProDataApiManager.FetchAndUpdateProDatas(Db, orderNumber);

                return Json(new JsonResponse() { IsSucess = true });
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message });
            }
        }

    }
}