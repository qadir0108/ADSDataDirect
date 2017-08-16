using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Enums;
using Hangfire;
using Nelibur.ObjectMapper;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.Async;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Controllers
{
    [Authorize]
    public class ApprovedController : BaseController
    {
        // GET: CampaignApproveds/Edit/5
        public ActionResult EditApproved(Guid? id)
        {
            CampaignApproved campaignApproved = db.CampaignsApproved.FirstOrDefault(c => c.Id == id);
            if (campaignApproved == null)
            {
                throw new HttpException(404, "Not found");
            }

            TinyMapper.Bind<CampaignApproved, CampaignApprovedVM>(config =>
            {
                config.Ignore(x => x.ChannelTypes);
            });

            var campaignApprovedVm = TinyMapper.Map<CampaignApprovedVM>(campaignApproved);
            Campaign campaign = db.Campaigns
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

            campaignApprovedVm.ChannelTypes = string.IsNullOrEmpty(campaignApproved.ChannelTypes) ? new List<ChannelTypeEnum> { } :
                campaignApproved.ChannelTypes
                    .Split(",".ToCharArray())
                    .Select(x => (ChannelTypeEnum)System.Enum.Parse(typeof(ChannelTypeEnum), x)).ToList();

            var proData = VendorsList.FirstOrDefault(x => x.Text.ToLowerInvariant().Contains("pro"));
            ViewBag.Vendor = new SelectList(VendorsList, "Value", "Text", proData);

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
                db.Entry(campaignApproved).State = EntityState.Modified;
                db.SaveChanges();

                // Updatin Asssets
                var campaignAssets = db.CampaignAssets.FirstOrDefault(x => x.CampaignId == campaignApprovedVm.CampaignId);
                campaignAssets.CreativeFiles = campaignApprovedVm.Assets.CreativeFiles;
                campaignAssets.CreativeUrl = campaignApprovedVm.Assets.CreativeUrl;
                campaignAssets.ZipCodeFile = campaignApprovedVm.Assets.ZipCodeFile;
                campaignAssets.ZipCodeUrl = campaignApprovedVm.Assets.ZipCodeUrl;
                campaignAssets.TestSeedFile = campaignApprovedVm.Assets.TestSeedFile;
                campaignAssets.LiveSeedFile = campaignApprovedVm.Assets.LiveSeedFile;
                db.Entry(campaignAssets).State = EntityState.Modified;
                db.SaveChanges();

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

            return View(campaignApprovedVm);
        }

        public ActionResult CompleteSegment(Guid? Id)
        {
            try
            {
                var segment = db.CampaignSegments.FirstOrDefault(x => x.Id == Id);
                segment.SegmentStatus = (int)SegmentStatusEnum.Complete;
                segment.DateComplete = DateTime.Now;
                db.SaveChanges();
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult SendToVendor(Guid? VendorId, Guid? Id, string[] SegmentsSelected)
        {
            try
            {
                Campaign campaign = db.Campaigns.Include(x => x.Approved).FirstOrDefault(x => x.Id == Id);
                if (campaign == null)
                {
                    throw new Exception("Campagin with Id: " + Id + " Not Found.");
                }
                if (campaign.Approved == null)
                {
                    throw new Exception("Campagin: " + campaign.CampaignName + " is not yet approved.");
                }

                BackgroundJob.Enqueue(() => CampaignProcessor.SendVendorEmail(VendorId, campaign.OrderNumber, SegmentsSelected));

                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }

        }

        public ActionResult SendViaAPI(Guid? Id)
        {
            try
            {
                Campaign campaign = db.Campaigns.Include(x => x.Approved).FirstOrDefault(x => x.Id == Id);
                if (campaign == null)
                {
                    throw new Exception("Campagin with Id: " + Id + " Not Found.");
                }
                if (campaign.Approved == null)
                {
                    throw new Exception("Campagin: " + campaign.CampaignName + " is not yet approved.");
                }

                var segment = db.CampaignSegments
                    .OrderBy(x => x.SegmentNumber)
                    .FirstOrDefault(x => x.CampaignId == campaign.Id);
                var response = ProDataAPIManager.Create(campaign, segment);
                if (response.status == ProDataAPIManager.SUCCESS)
                {
                    var campaignTracking =
                       db.CampaignTrackings.FirstOrDefault(x => x.CampaignId == campaign.Id && x.SegmentNumber == segment.SegmentNumber);

                    if (campaignTracking == null)
                    {
                        var trackingId = Guid.NewGuid();
                        var tracking = new CampaignTracking()
                        {
                            Id = trackingId,
                            CreatedAt = DateTime.Now,
                            CampaignId = campaign.Id,
                            SegmentNumber = segment.SegmentNumber,
                            DateSent = DateTime.Now,
                            IsCreatedThroughApi = true,
                            QueuedCampaignId = response.queued_pending_campaign_id.ToString(),
                        };
                        db.CampaignTrackings.Add(tracking);
                        campaign.Status = (int)CampaignStatusEnum.Monitoring;
                        db.SaveChanges();
                    }
                }
                else
                {
                    string message = response.message;
                    foreach (var field in response.error_fields)
                    {
                        message += "<br/>" + field;
                    }
                    throw new Exception(message);
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