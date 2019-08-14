using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web.Mvc;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.Models;
using PagedList;
using ADSDataDirect.Infrastructure.S3;
using ADSDataDirect.Infrastructure.Image;
using ADSDataDirect.Infrastructure.ProData;
using ADSDataDirect.Infrastructure.Db;
using ADSDataDirect.Infrastructure.TemplateReports;
using ADSDataDirect.Infrastructure.ClickMeter;
using ADSDataDirect.Infrastructure.Emails;

namespace ADSDataDirect.Web.Controllers
{
    //[Authorize]
    public class TrackingController : BaseController
    {
        // NOT USED
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

        public ActionResult Monitoring(CampaignSearchVm sc)
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
                .Include(x => x.Notifications)
                .OrderByDescending(x => x.CreatedAt)
                .Where(x => 
                    x.Approved != null && !string.IsNullOrEmpty(x.Testing.ClickMeterRotatorLinkId) &&
                    (x.Status == (int)CampaignStatus.Monitoring || x.Segments.Any(s => s.SegmentStatus == (int)SegmentStatus.Monitoring)));

            campagins = FilterSortCampaigns(campagins, sc);

            ViewBag.BasicOrderNumber = OrderNumberList;
            ViewBag.BasicStatus = StatusList;
            ViewBag.AdvancedStatus = StatusList;
            ViewBag.AdvancedUser = UsersList;
            ViewBag.AdvancedWhiteLabel = CustomersWithWLList;
            
            var trackingVms = new List<CampaignMonitoringVm>();
            foreach (var campaign in campagins)
            {
                foreach (var campaignTracking in campaign.Trackings)
                {
                    var model = CampaignMonitoringVm.FromCampaignTracking(campaign, campaignTracking);
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

            Session["id"] = id;
            Session["OrderNumber"] = campaign.OrderNumber;

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

            Session["id"] = id;
            Session["OrderNumber"] = campaign.OrderNumber;

            var trackingVms = new List<CampaignTrackingVm>();
            foreach (var campaignTracking in campaign.Trackings)
            {
                var model = CampaignTrackingVm.FromCampaignTracking(campaign, campaignTracking);
                trackingVms.Add(model);
            }
            trackingVms = trackingVms.OrderBy(x => x.OrderNumber).ToList();

            ViewBag.Templates = new SelectList(ReportTemplates, "Value", "Text");
            ViewBag.Formats = new SelectList(DownloadFormats, "Value", "Text");
            ViewBag.Templates1 = new SelectList(ReportTemplates, "Value", "Text");
            ViewBag.Formats1 = new SelectList(DownloadFormats, "Value", "Text");

            return View(trackingVms);
        }

        public ActionResult DownloadReport(Guid? id, Guid? trackingId, string template, string format)
        {
            ReportGenerationResultVm result;
            try
            {
                result = GenerateReport(id, trackingId, template, format);
            }
            catch (Exception ex)
            {
                TempData["Error"] = ex.Message;
                return RedirectToAction("Index", "Campaigns");
            }
            return File(result.outputFilePath, result.contentType, result.outputFileName);
        }

        public ActionResult EmailReport(Guid? id, Guid? trackingId, string template, string format, string email)
        {
            try
            {
                ReportGenerationResultVm result = GenerateReport(id, trackingId, template, format);

                EmailHelper.SendTrackingReport(email, result.orderNumber, (new string[] { result.outputFilePath}).ToList() );

                return Json(new JsonResponse() { IsSucess = true });
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message });
            }
        }

        public ReportGenerationResultVm GenerateReport(Guid? id, Guid? trackingId, string template, string format)
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
                throw new AdsException("Campaign not found.");
            }
            if (campaign.Approved == null)
            {
                throw new AdsException("Campaign is not passed through Testing and Approved phase.");
            }
            var campaignTracking = campaign.Trackings.FirstOrDefault(x => x.Id == trackingId);
            if (campaignTracking == null)
            {
                throw new AdsException("No Tracking data available.");
            }

            var whiteLable = Db.Customers.FirstOrDefault(x => x.WhiteLabel == campaign.Approved.WhiteLabel);
            if (whiteLable == null)
            {
                throw new AdsException("Campaign White Label not set in approved screen.");
            }

            var reportTemplate = !string.IsNullOrEmpty(template) ? template : whiteLable.ReportTemplate;

            // Creative HTML screenshot
            string creativeUrl = campaign.Assets.CreativeUrl,
                screenshotFilePathTemp = $"{UploadPath}\\{campaign.OrderNumber}t.png",
                screenshotFilePath = $"{UploadPath}\\{campaign.OrderNumber}.png";

            if (whiteLable.IsUseOpenModel && !string.IsNullOrEmpty(campaign.Assets.OpenModelImageFile))
            {
                S3FileManager.Download(campaign.Assets.OpenModelImageFile, screenshotFilePathTemp);
            }
            else
            {
                var helper = new ImageHelper(creativeUrl, screenshotFilePathTemp);
                if (!System.IO.File.Exists(screenshotFilePath))
                {
                    helper.Capture();
                }
            }
            int ScreenshotHeight = "Tracking1".Equals(reportTemplate) || "Tracking2".Equals(reportTemplate) || "TrackingReTargeting".Equals(reportTemplate) ? 750 : 500;
            if (System.IO.File.Exists(screenshotFilePathTemp))
            {
                ImageResizer.Resize(screenshotFilePathTemp, screenshotFilePath, 400, ScreenshotHeight, true);
                System.IO.File.Delete(screenshotFilePathTemp);
            }

            string contentType = "", outputFileName = "", outputFilePath = "";
            switch (format)
            {
                //case "pdf":
                //    var modelView = CampaignTrackingVm.FromCampaignTracking(campaign, campaignTracking);
                //    outputFileName = $"{campaign.OrderNumber} {whiteLable?.WhiteLabel}.pdf";
                //    outputFilePath = Path.Combine(DownloadPath, outputFileName);
                //    contentType = "application/pdf";
                //    // Generate pdf
                //    new TemplateReportPdf().Generate(modelView, outputFilePath, whiteLable.CompanyLogo, screenshotFilePath);
                //    break;
                // case "excel":
                default:
                    var modelReport = TemplateReportVm.FromCampaignTracking(campaign, campaignTracking);
                    outputFileName = $"{campaign.OrderNumber}.xlsx";
                    outputFilePath = Path.Combine(DownloadPath, outputFileName);
                    contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

                    BaseTrackingReport report = null;
                    switch (reportTemplate)
                    {
                        case "Tracking1":
                        case "Tracking2":
                        case "TrackingReTargeting":
                            report = new TrackingReportTemplate12(reportTemplate, campaign.Approved.WhiteLabel, whiteLable.CompanyLogo, screenshotFilePath);
                            break;
                        case "Tracking3":
                        case "Tracking4":
                            report = new TrackingReportTemplate34(reportTemplate, campaign.Approved.WhiteLabel, whiteLable.CompanyLogo, screenshotFilePath);
                            break;
                        case "TrackingStrat":
                            report = new TrackingReportTemplateStrat(reportTemplate, campaign.Approved.WhiteLabel, whiteLable.CompanyLogo, screenshotFilePath);
                            break;
                        default:
                            report = new TrackingReportTemplate12(reportTemplate, campaign.Approved.WhiteLabel, whiteLable.CompanyLogo, screenshotFilePath);
                            break;
                    }
                    report.Generate(modelReport, outputFilePath);

                    break;
            }

            if ("pdf".Equals(format))
            {
                string outputFileNamePdf = $"{campaign.OrderNumber} {whiteLable?.WhiteLabel}t.pdf";
                string outputFilePathPdf = Path.Combine(DownloadPath, outputFileNamePdf);

                string outputFileNamePdfFinal = $"{campaign.OrderNumber} {whiteLable?.WhiteLabel}.pdf";
                string outputFilePathPdfFinal = Path.Combine(DownloadPath, outputFileNamePdfFinal);

                contentType = "application/pdf";
                
                Infrastructure.Pdf.Introp.Generate(outputFilePath, outputFilePathPdf);

                string pageSelection = ("Tracking1".Equals(reportTemplate) || "Tracking2".Equals(reportTemplate) || 
                    "TrackingReTargeting".Equals(reportTemplate) || "Tracking3".Equals(reportTemplate) ? "1-2" : 
                    "Tracking4".Equals(reportTemplate) || "TrackingStrat".Equals(reportTemplate) ? "1-3" : "1");

                Infrastructure.Pdf.PdfOrganizer.SelectPages(outputFilePathPdf, pageSelection, outputFilePathPdfFinal);
                System.IO.File.Delete(outputFilePathPdf);
                
                outputFileName = outputFileNamePdfFinal;
                outputFilePath = outputFilePathPdfFinal;
            }

            return new ReportGenerationResultVm()
            {
                orderNumber = campaign.OrderNumber,
                contentType = contentType,
                outputFileName = outputFileName,
                outputFilePath = outputFilePath
            };
        }

        public JsonResult RefreshFromVendor(Guid? id)
        {
            try
            {
                Campaign campaign = Db.Campaigns
                    .Include(x => x.Testing)
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

                // On refresh it is deciding which vendor to call
                if (IsNxs)
                {
                    ClickMeterModelProcessor.PopulateFromClickMeter(Db, campaign);
                }
                else
                {
                    ProDataApiManager.FetchAndUpdateTrackings(Db, campaign);
                }

                return Json(new JsonResponse() { IsSucess = true });
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message });
            }
        }
        
    }
}