﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Hangfire;
using Nelibur.ObjectMapper;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;
using WFP.ICT.Web.Async;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;
using WFP.ICT.Web.ProData;

namespace WFP.ICT.Web.Controllers
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
            campaign.Status = (int)CampaignStatus.Approved;
            Db.SaveChanges();
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

            TinyMapper.Bind<CampaignApproved, CampaignApprovedVM>(config =>
            {
                config.Ignore(x => x.ChannelTypes);
            });

            var campaignApprovedVm = TinyMapper.Map<CampaignApprovedVM>(campaignApproved);
            Campaign campaign = Db.Campaigns
                   .Include(x => x.Assets)
                   .Include(x => x.Segments)
                   .FirstOrDefault(x => x.Id == campaignApprovedVm.CampaignId);
            campaignApprovedVm.OrderNumber = campaign.OrderNumber;
            campaignApprovedVm.Assets = campaign.Assets;
            foreach (var segment in campaign.Segments)
            {
                var segmentVm = TinyMapper.Map<CampaignSegmentVM>(segment);
                campaignApprovedVm.Segments.Add(segmentVm);
            }

            campaignApprovedVm.ChannelTypes = string.IsNullOrEmpty(campaignApproved.ChannelTypes) ? new List<ChannelType> { } :
                campaignApproved.ChannelTypes
                    .Split(",".ToCharArray())
                    .Select(x => (ChannelType)System.Enum.Parse(typeof(ChannelType), x)).ToList();

            var proData = VendorsList.FirstOrDefault(x => x.Text.ToLowerInvariant().Contains("pro"));
            ViewBag.Vendor = new SelectList(VendorsList, "Value", "Text", proData);
            ViewBag.WhiteLabel = new SelectList(CustomersList, "Value", "Text", campaignApprovedVm.WhiteLabel);
            return View(campaignApprovedVm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditApproved([Bind(Include = "Assets,Segments,Id,CampaignId,ReferenceNumber,OrderNumber,CampaignName,WhiteLabel,ReBroadCast,ReBroadcastDate,FromLine,SubjectLine,HtmlImageFiles,CreativeURL,DeployDate,ZipURL,GeoDetails,Demographics,Quantity,SpecialInstructions,LinkBreakout,ReportSiteLink,CreatedAt,CreatedBy,IsUseApiDataForOpen,IsOpenPixel,OpenPixelUrl,OpenGoals,ClickGoals,DataFileQuantity,IsOmniOrder,OmniDeployDate,Impressions,ChannelTypes")] CampaignApprovedVM campaignApprovedVm)
        {
            if (ModelState.IsValid)
            {

                // Updatin Testing
                TinyMapper.Bind<CampaignApprovedVM, CampaignApproved>(config =>
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
            ViewBag.WhiteLabel = new SelectList(CustomersList, "Value", "Text", campaignApprovedVm.WhiteLabel);

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

        public ActionResult SendToVendor(Guid? vendorId, Guid? id, string[] segmentsSelected)
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

                BackgroundJob.Enqueue(() => CampaignProcessor.SendVendorEmail(vendorId, campaign.OrderNumber, segmentsSelected));

                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }

        }

        public ActionResult SendViaApi(Guid? id)
        {
            try
            {
                Campaign campaign = Db.Campaigns
                    .Include(x => x.Assets)
                    .Include(x => x.Segments)
                    .Include(x => x.Approved)
                    .FirstOrDefault(x => x.Id == id);
                if (campaign == null)
                {
                    throw new AdsException("Campagin with Id: " + id + " Not Found.");
                }
                if (campaign.Approved == null)
                {
                    throw new AdsException("Campagin: " + campaign.CampaignName + " is not yet approved.");
                }

                var segment = campaign.Segments.FirstOrDefault();
                string whiteLabel = string.IsNullOrEmpty(LoggedInUser?.WhiteLabel) ? "MM" : LoggedInUser?.WhiteLabel;
                string whiteLabelDomain = CustomersList.FirstOrDefault(x => x.Value == whiteLabel)?.Text.Split("-".ToCharArray()).LastOrDefault()?.Trim();
                var response = ProDataApiManager.Create(campaign, segment, whiteLabelDomain);
                if (response.status == ProDataApiManager.Success)
                {
                    var campaignTracking =
                       Db.CampaignTrackings.FirstOrDefault(x => x.CampaignId == campaign.Id && x.SegmentNumber == (segment != null ? segment.SegmentNumber : null));

                    if (campaignTracking == null)
                    {
                        var trackingId = Guid.NewGuid();
                        var tracking = new CampaignTracking()
                        {
                            Id = trackingId,
                            CreatedAt = DateTime.Now,
                            CampaignId = campaign.Id,
                            SegmentNumber = segment?.SegmentNumber,
                            DateSent = DateTime.Now,
                            IsCreatedThroughApi = true,
                            QueuedCampaignId = response.queued_pending_campaign_id.ToString(),
                        };
                        Db.CampaignTrackings.Add(tracking);
                        campaign.Status = (int)CampaignStatus.Monitoring;
                        Db.SaveChanges();
                    }
                }
                else
                {
                    StringBuilder message = new StringBuilder(response.message);
                    foreach (var field in response.error_fields)
                    {
                        message.Append($"<br/>{field}");
                    }
                    throw new AdsException(message.ToString());
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