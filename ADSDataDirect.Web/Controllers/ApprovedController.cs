using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.Async;
using ADSDataDirect.Web.Helpers;
using ADSDataDirect.Web.Models;
using Hangfire;
using Nelibur.ObjectMapper;

namespace ADSDataDirect.Web.Controllers
{
    [Authorize]
    public class ApprovedController : BaseController
    {
        public ActionResult Index(Guid? id)
        {
            var campaign = Db.Campaigns
                .Include(c => c.Testing)
                .Include(c => c.Approved)
                .FirstOrDefault(c => c.Id == id);

            if (campaign == null)
            {
                TempData["Error"] = "Campaign not found.";
                return RedirectToAction("Index", "Campaigns");
            }

            Session["id"] = id;
            Session["OrderNumber"] = campaign.OrderNumber;

            if (campaign.Testing == null)
            {
                TempData["Error"] = "Please pass through Testing first.";
                return RedirectToAction("Index", "Campaigns");
            }

            if (campaign.Approved == null)
            {
                var testing = campaign.Testing;
                var approvedId = Guid.NewGuid();
                var approved = new CampaignApproved()
                {
                    Id = approvedId,
                    CampaignId = campaign.Id,
                    CreatedAt = DateTime.Now,
                    CreatedBy = campaign.CreatedBy,
                    CampaignName = testing.CampaignName,
                    WhiteLabel = testing.WhiteLabel,
                    ReBroadCast = testing.ReBroadCast,
                    ReBroadcastDate = testing.ReBroadcastDate,
                    FromLine = testing.FromLine,
                    SubjectLine = testing.SubjectLine,
                    DeployDate = testing.DeployDate,

                    GeoDetails = testing.GeoDetails,
                    Demographics = testing.Demographics,
                    Quantity = testing.Quantity,
                    SpecialInstructions = testing.SpecialInstructions,
                    ReportSiteLink = $"http://report-site.com/c/ADS{campaign.OrderNumber}",
                    LinkBreakout = $"http://www.digitaldynamixs.net/ep2/{campaign.OrderNumber}/{campaign.OrderNumber}linkr.csv",
                    IsOpenPixel = testing.IsOpenPixel,
                    OpenPixelUrl = testing.OpenPixelUrl,
                    OpenGoals = testing.OpenGoals,
                    ClickGoals = testing.ClickGoals,
                    DataFileQuantity = testing.DataFileQuantity,
                    DataFileUrl = testing.DataFileUrl,

                    IsOmniOrder = testing.IsOmniOrder,
                    OmniDeployDate = testing.OmniDeployDate,
                    Impressions = testing.Impressions,
                    ChannelTypes = testing.ChannelTypes,
                };
                Db.CampaignsApproved.Add(approved);
                Db.SaveChanges();
                campaign.ApprovedId = approvedId;
                Db.SaveChanges();
            }
            // Only update status when not in monitoring
            if (campaign.Status < (int)CampaignStatus.Monitoring)
            {
                campaign.Status = (int)CampaignStatus.Approved;
                Db.SaveChanges();
            }
            return RedirectToAction("EditApproved", "Approved", new { id = campaign.ApprovedId });

        }

        // GET: CampaignApproveds/Edit/5
        public ActionResult EditApproved(Guid? id)
        {
            CampaignApproved campaignApproved = Db.CampaignsApproved.FirstOrDefault(c => c.Id == id);
            if (campaignApproved == null)
            {
                throw new HttpException(404, "Not found");
            }

            TinyMapper.Bind<CampaignApproved, CampaignApprovedVm>(config =>
            {
                config.Ignore(x => x.ChannelTypes);
            });

            var campaignApprovedVm = TinyMapper.Map<CampaignApprovedVm>(campaignApproved);
            Campaign campaign = Db.Campaigns
                   .Include(x => x.Assets)
                   .Include(x => x.Segments)
                   .FirstOrDefault(x => x.Id == campaignApprovedVm.CampaignId);
            campaignApprovedVm.OrderNumber = campaign.OrderNumber;
            campaignApprovedVm.Assets = campaign.Assets;
            foreach (var segment in campaign.Segments)
            {
                var segmentVm = TinyMapper.Map<CampaignSegmentVm>(segment);
                campaignApprovedVm.Segments.Add(segmentVm);
            }

            campaignApprovedVm.ChannelTypes = string.IsNullOrEmpty(campaignApproved.ChannelTypes) ? new List<ChannelType> { } :
                campaignApproved.ChannelTypes
                    .Split(",".ToCharArray())
                    .Select(x => (ChannelType)System.Enum.Parse(typeof(ChannelType), x)).ToList();

            var proData = VendorsList.FirstOrDefault(x => x.Text.ToLowerInvariant().Contains("pro"));
            ViewBag.Vendor = new SelectList(VendorsList, "Value", "Text", proData);
            ViewBag.WhiteLabel = new SelectList(CustomersWithWLList, "Value", "Text", campaignApprovedVm.WhiteLabel);
            
            return View(campaignApprovedVm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditApproved([Bind(Include = "Assets,Segments,Id,CampaignId,ReferenceNumber,OrderNumber,CampaignName,WhiteLabel,ReBroadCast,ReBroadcastDate,FromLine,SubjectLine,HtmlImageFiles,CreativeURL,DeployDate,ZipURL,GeoDetails,Demographics,Quantity,SpecialInstructions,LinkBreakout,ReportSiteLink,CreatedAt,CreatedBy,IsUseApiDataForOpen,IsOpenPixel,OpenPixelUrl,OpenGoals,ClickGoals,DataFileQuantity,IsOmniOrder,OmniDeployDate,Impressions,ChannelTypes")] CampaignApprovedVm campaignApprovedVm)
        {
            if (ModelState.IsValid)
            {

                // Updatin Testing
                TinyMapper.Bind<CampaignApprovedVm, CampaignApproved>(config =>
                {
                    config.Ignore(x => x.ChannelTypes);
                    config.Ignore(x => x.Assets);
                    config.Ignore(x => x.Segments);
                });
                var campaignApproved = TinyMapper.Map<CampaignApproved>(campaignApprovedVm);
                campaignApproved.ChannelTypes = campaignApprovedVm.ChannelTypes == null ? null :
                    string.Join(",", campaignApprovedVm.ChannelTypes);
                Db.Entry(campaignApproved).State = EntityState.Modified;
                Db.SaveChanges();

                // Updatin Asssets
                var campaignAssets = Db.CampaignAssets.FirstOrDefault(x => x.CampaignId == campaignApprovedVm.CampaignId);
                campaignAssets.CreativeFiles = campaignApprovedVm.Assets.CreativeFiles;
                campaignAssets.CreativeUrl = campaignApprovedVm.Assets.CreativeUrl;
                campaignAssets.ZipCodeFile = campaignApprovedVm.Assets.ZipCodeFile;
                campaignAssets.ZipCodeUrl = campaignApprovedVm.Assets.ZipCodeUrl;
                campaignAssets.TestSeedFile = campaignApprovedVm.Assets.TestSeedFile;
                campaignAssets.LiveSeedFile = campaignApprovedVm.Assets.LiveSeedFile;
                Db.Entry(campaignAssets).State = EntityState.Modified;
                Db.SaveChanges();

                TempData["Success"] = "Approved data saved successfully!";
            }
            else
            {
                var errorList = (from item in ModelState.Values
                                 from error in item.Errors
                                 select error.ErrorMessage).ToList();
                TempData["Error"] = "There is error in saving data." + string.Join("<br/>", errorList);
            }
            var proData = VendorsList.FirstOrDefault(x => x.Text.Contains("Pro"));
            ViewBag.Vendor = new SelectList(VendorsList, "Value", "Text", proData);
            ViewBag.WhiteLabel = new SelectList(CustomersWithWLList, "Value", "Text", campaignApprovedVm.WhiteLabel);

            return View(campaignApprovedVm);
        }

        public ActionResult CompleteSegment(Guid? id)
        {
            try
            {
                var segment = Db.CampaignSegments.FirstOrDefault(x => x.Id == id);
                segment.SegmentStatus = (int)SegmentStatus.Complete;
                segment.DateComplete = DateTime.Now;
                Db.SaveChanges();
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult SendToVendor(OrderVia via, Guid? vendorId, Guid? id, string[] segmentsSelected)
        {
            try
            {
                Campaign campaign = Db.Campaigns.Include(x => x.Approved).FirstOrDefault(x => x.Id == id);
                if (campaign == null)
                {
                    throw new AdsException("Campagin with Id: " + id + " Not Found.");
                }
                if (campaign.Approved == null)
                {
                    throw new AdsException("Campagin: " + campaign.CampaignName + " is not yet approved.");
                }

                switch (via)
                {
                        case OrderVia.Email:
                            BackgroundJob.Enqueue(() => CampaignProcessor.SendToVendor(via, vendorId, campaign.OrderNumber, segmentsSelected, string.Empty));
                        break;
                        case OrderVia.Api:
                            string whiteLabel = LoggedInUser?.CustomerId == null ? "ADS" : LoggedInUser?.Customer.WhiteLabel;
                            string whiteLabelDomain = Db.Customers.FirstOrDefault(x => x.WhiteLabel == whiteLabel)?.WebDomain;
                            if(string.IsNullOrEmpty(whiteLabelDomain))
                                throw new AdsException("White Label Web Domain can not be empty.");
                            CampaignProcessor.SendToVendor(via, vendorId, campaign.OrderNumber, segmentsSelected, whiteLabelDomain);
                        break;
                }
                
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }

        }
    }
}