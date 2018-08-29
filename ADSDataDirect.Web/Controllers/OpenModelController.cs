using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Web.Models;
using ADSDataDirect.Web.OpenModel;
using ADSDataDirect.Web.Helpers;
using ADSDataDirect.Web.Async.Helpers;
using System.IO;
using OfficeOpenXml;

namespace ADSDataDirect.Web.Controllers
{
    [Authorize]
    public class OpenModelController : BaseController
    {
        public ActionResult View(Guid? id)
        {
            Campaign campaign = Db.Campaigns
                .Include(x => x.Assets)
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

            string screenshotFilePath = $"{UploadPath}\\{campaign.OrderNumber}.png";

            var trackingVms = new List<CampaignTrackingOpenModelVm>();
            foreach (var campaignTracking in campaign.Trackings)
            {
                var model = CampaignTrackingOpenModelVm.FromCampaignTracking(campaign, campaignTracking);
                trackingVms.Add(model);
            }
            trackingVms = trackingVms.OrderBy(x => x.OrderNumber).ToList();

            ViewBag.Templates = new SelectList(ReportTemplates, "Value", "Text");

            return View(trackingVms);
        }

        public ActionResult SaveInput(Guid? id)
        {
            Campaign campaign = Db.Campaigns
                   .Include(x => x.Assets)
                   .FirstOrDefault(x => x.Id == id);

            if (campaign == null)
            {
                TempData["Error"] = "Campaign not found.";
                return RedirectToAction("View", "OpenModel", new { id = id });
            }

            var vm = new OpenModelInputVm()
            {
                Id = campaign.Id.ToString(),
                OrderNumber = campaign.OrderNumber,
                OpenModelLinksFile = campaign.Assets.OpenModelLinksFile,
                OpenModelImageFile = campaign.Assets.OpenModelImageFile,
                SFDClientId = campaign.Assets.SFDClientId.ToString()
            };
            // Lists
            ViewBag.SfidClientCampaigns = new SelectList(SfidClientCampaigns, "Value", "Text", vm.SFDClientId);

            return View(vm);
        }

        // POST: Copy/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SaveInput(OpenModelInputVm vm)
        {
            if (ModelState.IsValid)
            {
                Campaign campaign = Db.Campaigns
                    .Include(x => x.Assets)
                    .FirstOrDefault(x => x.Id.ToString() == vm.Id);

                campaign.Assets.OpenModelLinksFile = vm.OpenModelLinksFile;
                campaign.Assets.OpenModelImageFile = vm.OpenModelImageFile;
                campaign.Assets.SFDClientId = int.Parse(vm.SFDClientId);

                if (!string.IsNullOrEmpty(campaign.Assets.OpenModelLinksFile))
                {
                string filePath = Path.Combine(UploadPath, campaign.Assets.OpenModelLinksFile);
                S3FileManager.Download(campaign.Assets.OpenModelLinksFile, filePath);
                List<string> links = CsvReader.ReadCsv(filePath);
                campaign.Assets.OpenModelLinksCount = links.Count;
                }
                Db.SaveChanges();
                
                TempData["Success"] = "Open Model Input data saved successfully!";
                return RedirectToAction("View", "OpenModel", new { id = vm.Id });
            }
            else
            {
                var errorList = (from item in ModelState.Values
                                 from error in item.Errors
                                 select error.ErrorMessage).ToList();
                TempData["Error"] = "There is error in saving data." + string.Join("<br/>", errorList);
            }
            return View("OpenModelInput", vm);
        }

        public JsonResult ProcessModel(Guid? id)
        {
            try
            {
                Campaign campaign = Db.Campaigns
                    .Include(x => x.Assets)
                    .Include(x => x.Approved)
                    .Include(x => x.Trackings)
                    .Where(x => x.Approved != null)
                    .FirstOrDefault(x => x.Id == id);

                // Update Tracking
                if (campaign == null)
                {
                    throw new AdsException("Campaign not found.");
                }

                if(string.IsNullOrEmpty(campaign.Assets.OpenModelLinksFile))
                {
                    throw new AdsException("Please upload link files first.");
                }

                OpenModelProcessor.PopulateFakeData(Db, campaign);

                return Json(new JsonResponse() { IsSucess = true });
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message });
            }
        }

        public ActionResult ExportMetricsAndUrls(Guid? id, Guid? trackingId)
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

            var whiteLable = Db.Customers.FirstOrDefault(x => x.WhiteLabel == campaign.Approved.WhiteLabel);
            if (whiteLable == null)
            {
                TempData["Error"] = "Campaign White Label not set in approved screen.";
                return RedirectToAction("Index", "Campaigns");
            }

            var metric = CampaignTrackingMetricVm.FromCampaignTracking(campaign, campaignTracking);
            var urls = CampaignTrackingMetricDetailVm.FromCampaignTracking(campaign, campaignTracking);

            ExcelPackage excel = new ExcelPackage();
            var workSheet = excel.Workbook.Worksheets.Add("Strat Metrics");
            workSheet.Cells[1, 1].LoadFromCollection(metric, true);

            var workSheet2 = excel.Workbook.Worksheets.Add("Strat URLs");
            workSheet2.Cells[1, 1].LoadFromCollection(urls, true);

            using (var memoryStream = new MemoryStream())
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;  filename=MetricsURLs.xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
            return null;
        }
    }
}