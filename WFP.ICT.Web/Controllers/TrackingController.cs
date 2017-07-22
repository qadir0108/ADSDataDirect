using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Globalization;
using System.IO;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Enums;
using PagedList;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;
using WFP.ICT.Web.Async;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;
using WFP.ICT.Web.Reports;

namespace WFP.ICT.Web.Controllers
{
    public class TrackingController : BaseController
    {
        int pageSize = 10;

        public ActionResult Index(CampaignSearchVM sc)
        {
            ViewBag.CurrentSort = sc.sortOrder;
            ViewBag.CampaignNameSortParm = sc.sortOrder == "CampaignName" ? "CampaignName_desc" : "CampaignName";
            ViewBag.BroadcastDateSortParm = sc.sortOrder == "BroadcastDate" ? "BroadcastDate_desc" : "BroadcastDate";
            ViewBag.CreatedBySortParm = sc.sortOrder == "CreatedBy" ? "CreatedBy_desc" : "CreatedBy";
            ViewBag.StatusSortParm = sc.sortOrder == "Status" ? "Status_desc" : "Status";
            ViewBag.OrderNumberSortParm = sc.sortOrder == "OrderNumber" ? "OrderNumber_desc" : "OrderNumber";

            var campagins = db.Campaigns
                .Include(x => x.ProDatas)
                .Include(x => x.Testing)
                .Include(x => x.Approved)
                .OrderByDescending(x => x.CreatedAt)
                .Where(x => x.Status == (int)CampaignStatusEnum.Completed)
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

            if (!IsAdmin)
            {
                campagins = campagins.Where(s => s.CreatedBy == LoggedInUser?.UserName).ToList();
            }

            var reportVms = new List<CampaignReportVM>();
            foreach (var campaign in campagins)
            {
                long clicked = 0, opened = 0;
                DateTime startDateTime = DateTime.MinValue;
                string IONumber = "NA";
                if (campaign.ProDatas.Count > 0)
                {
                    clicked = campaign.ProDatas.Sum(x => x.ClickCount);
                    startDateTime = DateTime.Parse(campaign.ProDatas.FirstOrDefault().CampaignStartDate);
                    IONumber = campaign.ProDatas.FirstOrDefault().IO;
                    opened = ADS.API.Models.Campaign.GetOpens(campaign.Approved.Quantity, startDateTime);
                }
                var model = new CampaignReportVM()
                {
                    Id = campaign.Id.ToString(),
                    OrderNumber = campaign.OrderNumber,
                    CampaignName = campaign.CampaignName,
                    OrderDate = campaign.CreatedAt.ToString(),
                    Status = ((CampaignStatusEnum) campaign.Status).ToString(),
                    WhiteLabel = campaign.WhiteLabel,
                    Quantity = campaign.Approved?.Quantity.ToString(),
                    Clicked = clicked == 0 ? "NA" : clicked.ToString(),
                    Opened = opened == 0 ? "NA" : opened.ToString(),

                    IONumber = IONumber,
                    StartDate = startDateTime == DateTime.MinValue ? "NA" : startDateTime.ToString(),
                    EmailsSent = campaign.Approved?.Quantity.ToString(),
                    OpenedPercentage =
                        campaign.Approved?.Quantity == 0
                            ? "NA"
                            : ((double) opened/campaign.Approved?.Quantity)?.ToString("0.00%"),
                    ClickedPercentage =
                        campaign.Approved?.Quantity == 0
                            ? "NA"
                            : ((double) clicked/campaign.Approved?.Quantity)?.ToString("0.00%"),
                    CTRPercentage = opened == 0 ? "NA" : ((double) clicked/opened).ToString("0.00%"),
                };
                model.PerLink = new List<CampaignReportDetailVM>();
                foreach (var proData in campaign.ProDatas.OrderBy(x => ProDataHelper.GetIndex(x.Reportsite_URL)))
                {
                    model.PerLink.Add(new CampaignReportDetailVM()
                    {
                        IONumber = proData.IO,
                        Link = proData.Destination_URL,
                        ClickCount = proData.ClickCount.ToString()
                    });
                }

                reportVms.Add(model);
            }

            ViewBag.Status = StatusList;
            ViewBag.SearchStatus = StatusList;

            // Paging
            int pageNumber = (sc.page ?? 1);
            return View(reportVms.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult ViewReport(Guid? id)
        {
            if (id == null)
            {
                throw new HttpException(400, "Bad Request");
            }
            Campaign campaign = db.Campaigns
                .Include(x => x.ProDatas)
                .Include(x => x.Testing)
                .Include(x => x.Approved)
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
            long clicked = 0, opened = 0;
            DateTime startDateTime = DateTime.MinValue;
            string IONumber = "NA";
            if (campaign.ProDatas.Count > 0)
            {
                clicked = campaign.ProDatas.Sum(x => x.ClickCount);
                startDateTime = DateTime.Parse(campaign.ProDatas.FirstOrDefault().CampaignStartDate);
                IONumber = campaign.ProDatas.FirstOrDefault().IO;
                opened = ADS.API.Models.Campaign.GetOpens(campaign.Approved.Quantity, startDateTime);
            }
            var model = new CampaignReportVM()
            {
                Id = campaign.Id.ToString(),
                OrderNumber = campaign.OrderNumber,
                CampaignName = campaign.CampaignName,
                OrderDate = campaign.CreatedAt.ToString(),
                Status = ((CampaignStatusEnum) campaign.Status).ToString(),
                WhiteLabel = campaign.WhiteLabel,
                Quantity = campaign.Approved.Quantity.ToString(),
                Clicked = clicked == 0 ? "NA" : clicked.ToString(),
                Opened = opened == 0 ? "NA" : opened.ToString(),

                IONumber = IONumber,
                StartDate = startDateTime == DateTime.MinValue ? "NA" : startDateTime.ToString(),
                EmailsSent = campaign.Approved.Quantity.ToString(),
                OpenedPercentage =
                    campaign.Approved.Quantity == 0
                        ? "NA"
                        : ((double) opened/campaign.Approved.Quantity).ToString("0.00%"),
                ClickedPercentage =
                    campaign.Approved.Quantity == 0
                        ? "NA"
                        : ((double) clicked/campaign.Approved.Quantity).ToString("0.00%"),
                CTRPercentage = opened == 0 ? "NA" : ((double) clicked/opened).ToString("0.00%"),
            };
            model.PerLink = new List<CampaignReportDetailVM>();
            foreach (var proData in campaign.ProDatas.OrderBy(x => ProDataHelper.GetIndex(x.Reportsite_URL)))
            {
                model.PerLink.Add(new CampaignReportDetailVM()
                {
                    IONumber = proData.IO,
                    OrderNumber = proData.Reportsite_URL,
                    Link = proData.Destination_URL,
                    ClickCount = proData.ClickCount.ToString()
                });
            }

            return View(model);
        }

        public ActionResult Report()
        {
            string creativeURL = "", imagePath = "", imageURL = "";
            var reportDatas = new List<CampaignReportDetailVM>();
            if (Request.Params["id"] != null)
            {
                Guid id;
                try
                {
                    Guid.TryParse(Request.Params["id"], out id);
                }
                catch (Exception ex)
                {
                    throw new Exception("Wrong Input" + ex.Message);
                }

                Campaign campaign =
                    db.Campaigns.Include("ProDatas")
                        .Include("Testing")
                        .Include("Approved")
                        .FirstOrDefault(x => x.Id == id);

                if (campaign == null)
                {
                    throw new HttpException(404, "Not found");
                }

                creativeURL = campaign.Approved.CreativeURL;
                imagePath = string.Format("{0}\\{1}.png", UploadPath, campaign.OrderNumber);
                imageURL = new Uri(Request.Url, Url.Content(string.Format("~/Uploads/{0}.png", campaign.OrderNumber))).AbsoluteUri;

                long clicked = 0, opened = 0;
                DateTime startDateTime = DateTime.MinValue;
                string IONumber = "NA";
                if (campaign.ProDatas.Count > 0)
                {
                    clicked = campaign.ProDatas.Sum(x => x.ClickCount);
                    startDateTime = DateTime.Parse(campaign.ProDatas.FirstOrDefault().CampaignStartDate);
                    IONumber = campaign.ProDatas.FirstOrDefault().IO;
                    opened = ADS.API.Models.Campaign.GetOpens(campaign.Approved.Quantity, startDateTime);
                }

                foreach (var proData in campaign.ProDatas.OrderBy(x => ProDataHelper.GetIndex(x.Reportsite_URL)))
                {
                    reportDatas.Add(new CampaignReportDetailVM()
                    {
                        Id = campaign.Id.ToString(),
                        OrderNumber = campaign.OrderNumber,
                        CampaignName = campaign.CampaignName,
                        OrderDate = campaign.CreatedAt.ToString(),
                        Status = ((CampaignStatusEnum) campaign.Status).ToString(),
                        WhiteLabel = campaign.WhiteLabel,
                        Quantity = campaign.Approved.Quantity.ToString(),
                        Clicked = clicked == 0 ? "NA" : clicked.ToString(),
                        Opened = opened == 0 ? "NA" : opened.ToString(),
                        StartDate = startDateTime == DateTime.MinValue ? "NA" : startDateTime.ToString(),
                        EmailsSent = campaign.Approved.Quantity.ToString(),
                        OpenedPercentage =
                            campaign.Approved.Quantity == 0
                                ? "NA"
                                : ((double) opened/campaign.Approved.Quantity).ToString("0.00%"),
                        ClickedPercentage =
                            campaign.Approved.Quantity == 0
                                ? "NA"
                                : ((double) clicked/campaign.Approved.Quantity).ToString("0.00%"),
                        CTRPercentage = opened == 0 ? "NA" : ((double) clicked/opened).ToString("0.00%"),
                        IONumber = IONumber,
                        Link = proData.Destination_URL,
                        ClickCount = proData.ClickCount.ToString(),
                    });
                }
            }
            var reportModel = new ReportModel
            {
                DataSet = reportDatas.ToDataSet(),
                Parameters = new Dictionary<string, object>()
            };

            string logoPath;
            if (LoggedInUser != null && !string.IsNullOrEmpty(LoggedInUser.CompanyLogo))
                logoPath = Url.Content("~/Uploads/" + LoggedInUser.CompanyLogo);
            else
                logoPath = Url.Content("~/images/logo.png");

            reportModel.Parameters.Add("pLogoUrl", new Uri(Request.Url, logoPath).AbsoluteUri);

            new ImageHelper(creativeURL, imagePath).Capture();
            reportModel.Parameters.Add("pCapturedUrl", imageURL);

            return View("Report", reportModel);
        }

        public ActionResult DownloadReport(Guid? id)
        {
            if (id == null)
            {
                throw new HttpException(400, "Bad Request");
            }
            Campaign campaign = db.Campaigns
                .Include(x => x.ProDatas)
                .Include(x => x.Testing)
                .Include(x => x.Approved)
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
            long clicked = 0, opened = 0;
            long mobile = 0, desktop = 0;
            DateTime startDateTime = DateTime.MinValue;
            string IONumber = "NA";
            if (campaign.ProDatas.Count > 0)
            {
                clicked = campaign.ProDatas.Sum(x => x.ClickCount);
                mobile = campaign.ProDatas.Sum(x => x.MobileCnt);
                desktop = campaign.ProDatas.FirstOrDefault().UniqueCnt;
                startDateTime = DateTime.Parse(campaign.ProDatas.FirstOrDefault().CampaignStartDate);
                IONumber = campaign.ProDatas.FirstOrDefault().IO;
                opened = ADS.API.Models.Campaign.GetOpens(campaign.Approved.Quantity, startDateTime);
            }
            var model = new CampaignReportVM()
            {
                Id = campaign.Id.ToString(),
                OrderNumber = campaign.OrderNumber,
                CampaignName = campaign.Approved.CampaignName,
                WhiteLabel = campaign.Approved.WhiteLabel,
                SubjectLine = campaign.Approved.SubjectLine,
                FromLine = campaign.Approved.FromLine,
                OrderDate = campaign.CreatedAt.ToString(),
                Status = ((CampaignStatusEnum)campaign.Status).ToString(),
                Quantity = campaign.Approved.Quantity.ToString(),
                Clicked = clicked == 0 ? "NA" : clicked.ToString(),
                Opened = opened == 0 ? "NA" : opened.ToString(),

                IONumber = IONumber,
                StartDate = startDateTime == DateTime.MinValue ? "NA" : startDateTime.ToString(StringConstants.DateFormatSlashes),
                EmailsSent = campaign.Approved.Quantity.ToString(),
                OpenedPercentage =
                    campaign.Approved.Quantity == 0
                        ? "NA"
                        : ((double)opened / campaign.Approved.Quantity).ToString("0.00%"),
                ClickedPercentage =
                    campaign.Approved.Quantity == 0
                        ? "NA"
                        : ((double)clicked / campaign.Approved.Quantity).ToString("0.00%"),
                CTRPercentage = opened == 0 ? "NA" : ((double)clicked / opened).ToString("0.00%"),
                Mobile = mobile.ToString(),
                Desktop = desktop.ToString()
            };
            model.PerLink = new List<CampaignReportDetailVM>();
            foreach (var proData in campaign.ProDatas.OrderBy(x => ProDataHelper.GetIndex(x.Reportsite_URL)))
            {
                model.PerLink.Add(new CampaignReportDetailVM()
                {
                    IONumber = proData.IO,
                    OrderNumber = proData.Reportsite_URL,
                    Link = proData.Destination_URL,
                    ClickCount = proData.ClickCount.ToString(),
                    UniqueCount = proData.UniqueCnt.ToString(),
                    MobileCount = proData.MobileCnt.ToString()
                });
            }

            string creativeURL = "", imagePath = "", imageURL = "";
            string fileName = "", filePath = "";
            Dictionary<string, string> keyValues = new Dictionary<string, string>();
              
            creativeURL = campaign.Approved.CreativeURL;
            imagePath = string.Format("{0}\\{1}.png", UploadPath, campaign.OrderNumber);
            imageURL = new Uri(Request.Url, Url.Content(string.Format("~/Uploads/{0}.png", campaign.OrderNumber))).AbsoluteUri;

            fileName = campaign.OrderNumber + ".xlsx";
            filePath = Path.Combine(DownloadPath, fileName);
            keyValues.Add("CampaignName", campaign.CampaignName);
            
            string logoFilePath;
            if (LoggedInUser != null && !string.IsNullOrEmpty(LoggedInUser.CompanyLogo))
                logoFilePath = string.Format("{0}\\{1}.png", UploadPath, LoggedInUser.CompanyLogo);
            else
                logoFilePath = string.Format("{0}\\logo1.png", ImagesPath);

            new ImageHelper(creativeURL, imagePath).Capture();

            ExcelHelper.GenerateTrackingReport(model, logoFilePath, imagePath, filePath);
            return File(filePath, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", fileName);
        }

        public JsonResult RefreshProData(string OrderNumber)
        {
            try
            {
                if (OrderNumber == null)
                {
                    throw new Exception("Order Number missing");
                }
                
                ProDataAPIManager.FetchAndUpdate(db, OrderNumber);

                return Json(new JsonResponse() { IsSucess = true });
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message });
            }
        }

        public JsonResult RefreshProDataLog(string OrderNumber)
        {
            try
            {
                if (OrderNumber == null)
                {
                    throw new Exception("Order Number missing");
                }

                var messages = db.ProDataAPILogs.Where(x => x.OrderNumber == OrderNumber)
                    .OrderByDescending(x => x.CreatedAt)
                    .Select(x => new { CreatedAt = x.CreatedAt.ToString(), Message = x.Message })
                    .ToList();

                return Json(new JsonResponse() { IsSucess = true, Result = messages });
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message });
            }
        }

    }
}