using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.IO;
using System.Threading.Tasks;
using System.Web.Mvc;
using Hangfire;
using MailChimp.Net;
using MailChimp.Net.Interfaces;
using MailChimp.Net.Models;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.Async;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;
using WFP.ICT.Enum;

namespace WFP.ICT.Web.Controllers
{
    public class CreativeController : BaseController
    {
        // Creative
        public ActionResult Index(Guid id)
        {
            var campaign = db.Campaigns
                .Include(c => c.Assets)
                .Include(c => c.Testing)
                .Include(c => c.Approved)
                .Include(c => c.Creative)
                .FirstOrDefault(c => c.Id == id);

            Session["id"] = id;
            Session["OrderNumber"] = campaign.OrderNumber;

            var creative = new CreativeVM()
            {
                CampaignId = campaign.Id.ToString(),
                OrderNumber = campaign.OrderNumber,
                CampaignName = campaign.Testing.CampaignName,
                FromLine = campaign.Testing.FromLine,
                SubjectLine = campaign.Testing.SubjectLine,
                TestSeedFile = campaign.Assets.TestSeedFile,
                LiveSeedFile = campaign.Assets.LiveSeedFile,
                Creatives = campaign.Creative?.CreativeHtml,
                TestEmails = new List<SelectItemPair>(),
                LiveEmails = new List<SelectItemPair>()
            };

            if (!string.IsNullOrEmpty(campaign.Assets.TestSeedFile))
            {
                string filePath = Path.Combine(UploadPath, campaign.Assets.TestSeedFile);
                if(!System.IO.File.Exists(filePath) && !string.IsNullOrEmpty(campaign.Assets.TestSeedFile))
                    S3FileManager.Download(campaign.Assets.TestSeedFile, filePath);
                creative.TestEmails = CreativeUtility.ReadEmails(filePath);
            }
            
            if (!string.IsNullOrEmpty(campaign.Assets.LiveSeedFile))
            {
                string filePathLive = Path.Combine(UploadPath, campaign.Assets.LiveSeedFile);
                if (!System.IO.File.Exists(filePathLive) && !string.IsNullOrEmpty(campaign.Assets.LiveSeedFile))
                    S3FileManager.Download(campaign.Assets.LiveSeedFile, filePathLive);
                creative.LiveEmails = CreativeUtility.ReadEmails(filePathLive);
            }

            Session["TestSeedFile"] = campaign.Assets.TestSeedFile;
            Session["TestSeedUrl"] = campaign.Assets.TestSeedUrl;
            Session["LiveSeedFile"] = campaign.Assets.LiveSeedFile;
            Session["LiveSeedUrl"] = campaign.Assets.LiveSeedUrl;
            return View(creative);
        }

        [HttpPost]
        [ValidateInput(false)]
        [MultipleButton(Name = "action", Argument = "Save")]
        public ActionResult Save(CreativeVM model)
        {
            try
            {
                var alreay = db.CampaignCreatives.FirstOrDefault(x => x.CampaignId.ToString() == model.CampaignId);
                if (alreay == null)
                {
                    var creativeId = Guid.NewGuid();
                    alreay = new CampaignCreative()
                    {
                        Id = creativeId,
                        CreatedAt = DateTime.Now,
                        CampaignId = Guid.Parse(model.CampaignId),
                        CreativeHtml = model.Creatives
                    };
                    db.CampaignCreatives.Add(alreay);
                    var campaign = db.Campaigns.FirstOrDefault(c => c.Id.ToString() == model.CampaignId);
                    campaign.CreativeId = creativeId;
                }
                else
                {
                    alreay.CreativeHtml = model.Creatives;
                }
                db.SaveChanges();
                TempData["Success"] = "Creatives has been saved successfully!";
            }
            catch (Exception ex)
            {
                TempData["Error"] = "There is error in saving data." + string.Join("<br/>", ex.Message);
            }
            return RedirectToAction("Index", new { id = model.CampaignId });
        }

        public ActionResult AddToList(string list, string email)
        {
            try
            {
                switch (list)
                {
                    case "test":
                        string filePath = Path.Combine(UploadPath, (string)Session["TestSeedList"]);
                        new CreativeUtility().Add(filePath, email);
                        S3FileManager.Upload((string)Session["TestSeedURL"], filePath, true);
                        break;
                    case "live":
                        string filePathLive = Path.Combine(UploadPath, (string)Session["FinalSeedList"]);
                        new CreativeUtility().Add(filePathLive, email);
                        S3FileManager.Upload((string)Session["LiveSeedURL"], filePathLive, true);
                        break;
                }
                return Json(new JsonResponse() {IsSucess = true});
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() {IsSucess = false, ErrorMessage = ex.Message});
            }
        }

        public ActionResult DeleteFromList(string list, string email)
        {
            try
            {
                switch (list)
                {
                    case "test":
                        string filePath = Path.Combine(UploadPath, (string)Session["TestSeedList"]);
                        new CreativeUtility().Remove(filePath, email);
                        S3FileManager.Upload((string)Session["TestSeedURL"], filePath, true);
                        break;
                    case "live":
                        string filePathLive = Path.Combine(UploadPath, (string)Session["FinalSeedList"]);
                        new CreativeUtility().Remove(filePathLive, email);
                        S3FileManager.Upload((string)Session["LiveSeedURL"], filePathLive, true);
                        break;
                }
                return Json(new JsonResponse() { IsSucess = true });
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message });
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        [MultipleButton(Name = "action", Argument = "TestSend")]
        public ActionResult TestSend(CreativeVM model)
        {
            try
            {
                string filePath = Path.Combine(UploadPath, (string)Session["TestSeedList"]);
                string filePathLive = Path.Combine(UploadPath, (string)Session["FinalSeedList"]);
                model.TestEmails = CreativeUtility.ReadEmails(filePath);
                model.LiveEmails = CreativeUtility.ReadEmails(filePathLive);

                BackgroundJob.Enqueue(() => MailChimpProcessor.TestSend(model));
                TempData["Success"] = "Testing creatives has been started successfully!";
            }
            catch (Exception ex)
            {
                TempData["Error"] = "There is error in saving data." + string.Join("<br/>", ex.Message);
            }
            return RedirectToAction("Index", new {id= model.CampaignId});
        }

        [HttpPost]
        [ValidateInput(false)]
        [MultipleButton(Name = "action", Argument = "QuickTestSend")]
        public ActionResult QuickTestSend(CreativeVM model)
        {
            try
            {
                MailChimpProcessor.QucikTestSend(model);
                TempData["Success"] = "Qucik Test has been sent successfully!";
            }
            catch (Exception ex)
            {
                TempData["Error"] = "There is error in saving data." + string.Join("<br/>", ex.Message);
            }
            return RedirectToAction("Index", new { id = model.CampaignId });
        }

        public JsonResult RefreshMailChimpLog(string OrderNumber)
        {
            try
            {
                if (OrderNumber == null)
                {
                    throw new Exception("Order Number missing");
                }

                var messages = db.MailChimpAPILogs.Where(x => x.OrderNumber == OrderNumber)
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