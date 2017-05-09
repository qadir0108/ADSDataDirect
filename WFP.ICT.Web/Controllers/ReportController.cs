using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;
using WFP.ICT.Web.Reports;

namespace WFP.ICT.Web.Controllers
{
    public class ReportController : BaseController
    {
        public ActionResult ViewReport(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Campaign campaign = db.Campaigns.Include("ProDatas").Include("Testing").Include("Approved").FirstOrDefault(x => x.Id == id);
            if (campaign == null)
            {
                return HttpNotFound();
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
                Status = ((CampaignStatusEnum)campaign.Status).ToString(),
                WhiteLabel = campaign.WhiteLabel,
                Quantity = campaign.Quantity.ToString(),
                Clicked = clicked == 0 ? "NA" : clicked.ToString(),
                Opened = opened == 0 ? "NA" : opened.ToString(),

                IONumber = IONumber,
                StartDate = startDateTime == DateTime.MinValue ? "NA" : startDateTime.ToString(),
                EmailsSent = campaign.Quantity.ToString(),
                OpenedPercentage = campaign.Quantity == 0 ? "NA" : ((opened / campaign.Quantity) * 100).ToString("0.00%"),
                ClickedPercentage = campaign.Quantity == 0 ? "NA" : ((clicked / campaign.Quantity) * 100).ToString("0.00%"),
                CTRPercentage = opened == 0 ? "NA" : ((clicked / opened) * 100).ToString("0.00%"),
            };
            model.PerLink = new List<CampaignReportDetailVM>();
            foreach (var proData in campaign.ProDatas)
            {
                model.PerLink.Add(new CampaignReportDetailVM()
                {
                    IONumber = proData.IO,
                    Link = proData.Destination_URL,
                    QuantityDetail = proData.ClickCount.ToString()
                });
            }

            return View(model);
        }

        public ActionResult Report()
        {
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

                Campaign campaign = db.Campaigns.Include("ProDatas").Include("Testing").Include("Approved").FirstOrDefault(x => x.Id == id);
                if (campaign == null)
                {
                    return HttpNotFound();
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

                foreach (var proData in campaign.ProDatas)
                {
                    reportDatas.Add(new CampaignReportDetailVM()
                    {
                        Id = campaign.Id.ToString(),
                        OrderNumber = campaign.OrderNumber,
                        CampaignName = campaign.CampaignName,
                        OrderDate = campaign.CreatedAt.ToString(),
                        Status = ((CampaignStatusEnum)campaign.Status).ToString(),
                        WhiteLabel = campaign.WhiteLabel,
                        Quantity = campaign.Quantity.ToString(),
                        Clicked = clicked == 0 ? "NA" : clicked.ToString(),
                        Opened = opened == 0 ? "NA" : opened.ToString(),

                        StartDate = startDateTime == DateTime.MinValue ? "NA" : startDateTime.ToString(),
                        EmailsSent = campaign.Quantity.ToString(),
                        OpenedPercentage = ((opened / campaign.Quantity) * 100).ToString("0.00%"),
                        ClickedPercentage = ((clicked / campaign.Quantity) * 100).ToString("0.00%"),
                        CTRPercentage = ((clicked / opened) * 100).ToString("0.00%"),
                        IONumber = IONumber,
                        Link = proData.Destination_URL,
                        QuantityDetail = proData.ClickCount.ToString()
                    });
                }
            }
            var reportModel = new ReportModel
            {
                DataSet = reportDatas.ToDataSet(),
                Parameters = new Dictionary<string, object>()
            };

            string logoPath;
            if(LoggedInUser != null && !string.IsNullOrEmpty(LoggedInUser.CompanyLogo))
                logoPath = Url.Content("~/Uploads/" + LoggedInUser.CompanyLogo);
            else
                logoPath = Url.Content("~/images/logo.png");

            var logoUrl = new Uri(Request.Url, logoPath).AbsoluteUri;
            reportModel.Parameters.Add("pLogoUrl", logoUrl);
            return View("Report", reportModel);
        }

        public JsonResult RefreshProData(string OrderNumber)
        {
            try
            {
                if (OrderNumber == null)
                {
                    throw new Exception("Order Number missing");
                }
                
                ProDataHelper.FetchAndUpdate(db, OrderNumber);

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