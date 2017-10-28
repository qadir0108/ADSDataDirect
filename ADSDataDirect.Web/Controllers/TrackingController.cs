using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.Helpers;
using ADSDataDirect.Web.Models;
using ADSDataDirect.Web.ProData;
using ADSDataDirect.Web.Reports;
using PagedList;

namespace ADSDataDirect.Web.Controllers
{
    [Authorize]
    public class TrackingController : BaseController
    {
        public ActionResult Index(CampaignSearchVm sc)
        {
            ViewBag.CurrentSort = sc.SortOrder;
            ViewBag.CampaignNameSortParm = sc.SortOrder == "CampaignName" ? "CampaignName_desc" : "CampaignName";
            ViewBag.BroadcastDateSortParm = sc.SortOrder == "BroadcastDate" ? "BroadcastDate_desc" : "BroadcastDate";
            ViewBag.CreatedBySortParm = sc.SortOrder == "CreatedBy" ? "CreatedBy_desc" : "CreatedBy";
            ViewBag.StatusSortParm = sc.SortOrder == "Status" ? "Status_desc" : "Status";
            ViewBag.OrderNumberSortParm = sc.SortOrder == "OrderNumber" ? "OrderNumber_desc" : "OrderNumber";

            var campagins = Db.Campaigns
                .Include(x => x.Testing)
                .Include(x => x.Approved)
                .Include(x => x.ProDatas)
                .Include(x => x.Trackings)
                .Include(x => x.Segments)
                .OrderByDescending(x => x.CreatedAt)
                .Where(x => x.Approved != null && (x.Status == (int)CampaignStatus.Monitoring || x.Segments.Any(s => s.SegmentStatus == (int)SegmentStatus.Monitoring)) );

            campagins = FilterSortCampaigns(campagins, sc);

            ViewBag.BasicOrderNumber = OrderNumberList;
            ViewBag.BasicStatus = StatusList;
            ViewBag.AdvancedStatus = StatusList;
            ViewBag.AdvancedUser = UsersList;
            ViewBag.AdvancedWhiteLabel = CustomersWithWLList;

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
            int pageNumber = (sc.Page ?? 1);
            return View(trackingVms.ToPagedList(pageNumber, PageSize));
        }

        public ActionResult Sent(Guid? id)
        {
            Campaign campaign = Db.Campaigns
                .Include(x => x.Approved)
                .Include(x => x.ProDatas)
                .Include(x => x.Trackings)
                .FirstOrDefault(x => x.Id == id);

            if (campaign == null)
            {
                TempData["Error"] = "Campaign not found.";
                return RedirectToAction("Index", "Campaigns");
            }
            if (campaign.Approved == null)
            {
                TempData["Error"] = "Campaign is not passed through Testing and Approved phase.";
                return RedirectToAction("Index", "Campaigns");
            }
            var trackingVms = new List<CampaignTrackingVm>();
            foreach (var campaignTracking in campaign.Trackings.OrderByDescending(x => x.CreatedAt))
            {
                var model = CampaignTrackingVm.FromCampaignTracking(campaign, campaignTracking);
                trackingVms.Add(model);
            }
            trackingVms = trackingVms.ToList();
            return View(trackingVms);
        }

        public ActionResult Report(Guid? id)
        {
            Campaign campaign = Db.Campaigns
                .Include(x => x.Approved)
                .Include(x => x.ProDatas)
                .Include(x => x.Trackings)
                .FirstOrDefault(x => x.Id == id);

            if (campaign == null)
            {
                TempData["Error"] = "Campaign not found.";
                return RedirectToAction("Index", "Campaigns");
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
                TempData["Error"] = "Campaign not found.";
                return RedirectToAction("Index", "Campaigns");
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
            
            var helper = new ImageHelper(creativeUrl, imagePathTemp);
            if (!System.IO.File.Exists(imagePath))
            {
                helper.Capture();
                if (System.IO.File.Exists(imagePathTemp))
                    helper.ResizeImage(imagePathTemp, imagePath, 600, 750, true);
                if (System.IO.File.Exists(imagePathTemp))
                    System.IO.File.Delete(imagePathTemp);
            }
            // !string.IsNullOrEmpty(LoggedInUser?.Customer?.CompanyLogo) $"{ImagesPath}\\{LoggedInUser?.Customer?.CompanyLogo}"
            var whiteLable = Db.Customers.FirstOrDefault(x => x.WhiteLabel == campaign.Approved.WhiteLabel);
            string logoFilePath = string.IsNullOrEmpty(campaign.Approved.WhiteLabel) || whiteLable == null
                ? $"{ImagesPath}\\logo1.png"
                : $"{ImagesPath}\\{whiteLable.CompanyLogo}";

            string logoResized = $"{ImagesPath}\\logoResized.png";
            string templateFile = string.IsNullOrEmpty(campaign.Approved.WhiteLabel) || whiteLable == null
                ? DefaultTemplate
                : $"~/Templates/{whiteLable.ReportTemplate}.xlsx";

            bool isStrategus = "Strategus".Equals(campaign.Approved.WhiteLabel);

            if (templateFile == $"~/Templates/Tracking1.xlsx" || templateFile == $"~/Templates/Tracking2.xlsx")
            {
                helper.ResizeImage(logoFilePath, logoResized, 650, 116, true);
                TrackingReports.GenerateTemplate1(model, Server.MapPath(templateFile),  !isStrategus, logoResized, imagePath, filePath);
            } 
            else
            {
                helper.ResizeImage(logoFilePath, logoResized, 500, 86, true);
                TrackingReports.GenerateTemplate2(model, Server.MapPath(templateFile), logoResized, imagePath, filePath);
            }

            return File(filePath, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", fileName);
        }

        public JsonResult RefreshProData(Guid? id)
        {
            try
            {
                Campaign campaign = Db.Campaigns
                    .Include(x => x.Approved)
                    .Include(x => x.Segments)
                    .Include(x => x.Trackings)
                    //.Where(x => x.Status == (int)CampaignStatus.Monitoring || x.Segments.Any(s => s.SegmentStatus == (int)SegmentStatus.Monitoring))
                    .Where(x => x.Approved != null)
                    .FirstOrDefault(x => x.Id == id);

                // Update Tracking
                if (campaign == null)
                {
                    throw new AdsException("Campaign not found.");
                }

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