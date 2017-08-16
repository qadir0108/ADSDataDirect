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
using WFP.ICT.Enum;
using WFP.ICT.Web.Async;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Controllers
{
    [Authorize]
    public class TestingController : BaseController
    {
        // GET: Copy/Edit/5
        public ActionResult EditTesting(Guid? id)
        {
            var campaignTesting = db.CampaignsTesting.FirstOrDefault(c => c.Id == id);

            if (campaignTesting == null)
            {
                throw new HttpException(404, "Not found");
            }

            TinyMapper.Bind<CampaignTesting, CampaignTestingVM>(config =>
            {
                config.Ignore(x => x.ChannelTypes);
            });

            var campaignTestingVm = TinyMapper.Map<CampaignTestingVM>(campaignTesting);
            Campaign campaign = db.Campaigns
                   .Include(x => x.Assets)
                   .Include(x => x.Segments)
                   .FirstOrDefault(x => x.Id == campaignTesting.CampaignId);
            campaignTestingVm.OrderNumber = campaign.OrderNumber;
            campaignTestingVm.Assets = campaign.Assets;
            foreach (var segment in campaign.Segments)
            {
                var segmentVm = TinyMapper.Map<CampaignSegmentVM>(segment);
                campaignTestingVm.Segments.Add(segmentVm);
            }

            campaignTestingVm.ChannelTypes = string.IsNullOrEmpty(campaignTesting.ChannelTypes) ? new List<ChannelTypeEnum> { } :
                campaignTesting.ChannelTypes
                    .Split(",".ToCharArray())
                    .Select(x => (ChannelTypeEnum)System.Enum.Parse(typeof(ChannelTypeEnum),x)).ToList();
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgencyEnum)), "Value",
                "Text", campaignTesting.TestingUrgency);

            return View(campaignTestingVm);
        }
        
        // POST: Copy/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButton(Name = "action", Argument = "EditTesting")]
        public ActionResult EditTesting([Bind(Include =
                     "Assets,Segments,Id,CampaignId,OrderNumber,CampaignName,WhiteLabel,ReBroadCast,ReBroadcastDate,FromLine,SubjectLine,HtmlImageFiles,CreativeURL,TestSeedList,FinalSeedList,IsTested,TestingTime,TestingUrgency,DeployDate,ZipCodeFile,ZipURL,GeoDetails,Demographics,Quantity,SpecialInstructions,CreatedAt,CreatedBy,IsOpenPixel,OpenPixelUrl,OpenGoals,ClickGoals,DataFileQuantity,IsOmniOrder,OmniDeployDate,Impressions,ChannelTypes"
             )]CampaignTestingVM campaignTestingVm)
        {
            if (ModelState.IsValid)
            {
                // Updatin Testing
                TinyMapper.Bind<CampaignTestingVM, CampaignTesting>(config =>
                {
                    config.Ignore(x => x.ChannelTypes);
                    config.Ignore(x => x.Assets);
                    config.Ignore(x => x.Segments);
                });
                var campaignTesting = TinyMapper.Map<CampaignTesting>(campaignTestingVm);
                campaignTesting.ChannelTypes = campaignTestingVm.ChannelTypes == null ? null :
                    string.Join(",", campaignTestingVm.ChannelTypes);
                db.Entry(campaignTesting).State = EntityState.Modified;
                db.SaveChanges();

                // Updatin Asssets
                var campaignAssets = db.CampaignAssets.FirstOrDefault(x => x.CampaignId == campaignTestingVm.CampaignId);
                campaignAssets.CreativeFiles = campaignTestingVm.Assets.CreativeFiles;
                campaignAssets.CreativeUrl = campaignTestingVm.Assets.CreativeUrl;
                campaignAssets.ZipCodeFile = campaignTestingVm.Assets.ZipCodeFile;
                campaignAssets.ZipCodeUrl = campaignTestingVm.Assets.ZipCodeUrl;
                campaignAssets.TestSeedFile = campaignTestingVm.Assets.TestSeedFile;
                campaignAssets.LiveSeedFile = campaignTestingVm.Assets.LiveSeedFile;
                db.Entry(campaignAssets).State = EntityState.Modified;
                db.SaveChanges();

                // Updating Segments
                if(campaignTestingVm.Segments != null)
                foreach (var segmentVm in campaignTestingVm.Segments)
                {
                    var segment = db.CampaignSegments.FirstOrDefault(x => x.Id == segmentVm.Id);
                    segment.SubjectLine = segmentVm.SubjectLine;
                    segment.BroadcastDate = segmentVm.BroadcastDate;
                    segment.DeploymentDate = segmentVm.DeploymentDate;
                    segment.CreativeFiles = segmentVm.CreativeFiles;
                    segment.FirstRangeStart = segmentVm.FirstRangeStart;
                    segment.FirstRangeEnd = segmentVm.FirstRangeEnd;
                    segment.SecondRangeStart = segmentVm.SecondRangeStart;
                    segment.SecondRangeEnd = segmentVm.SecondRangeEnd;
                    segment.ThirdRangeStart = segmentVm.ThirdRangeStart;
                    segment.ThirdRangeEnd = segmentVm.ThirdRangeEnd;
                    db.Entry(segment).State = EntityState.Modified;
                    db.SaveChanges();
                }

                TempData["Success"] = "Testing data saved successfully!";
            }
            else
            {
                var errorList = (from item in ModelState.Values
                                 from error in item.Errors
                                 select error.ErrorMessage).ToList();
                TempData["Error"] = "There is error in saving data." + string.Join("<br/>", errorList);
            }
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgencyEnum)), "Value",
                "Text", campaignTestingVm.TestingUrgency);
            return View("EditTesting", campaignTestingVm);
        }

        public ActionResult ApproveSegment(Guid? Id)
        {
            try
            {
                var segment = db.CampaignSegments.FirstOrDefault(x => x.Id == Id);
                segment.SegmentStatus = (int)SegmentStatusEnum.Approved;
                segment.DateApproved = DateTime.Now;
                db.SaveChanges();
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButton(Name = "action", Argument = "Approve")]
        public ActionResult Approve([Bind(Include = "Assets,Segments,Id,CampaignId,OrderNumber,CampaignName,WhiteLabel,ReBroadCast,ReBroadcastDate,FromLine,SubjectLine,HtmlImageFiles,CreativeURL,TestSeedList,FinalSeedList,IsTested,TestingTime,TestingUrgency,DeployDate,ZipCodeFile,ZipURL,GeoDetails,Demographics,Quantity,SpecialInstructions,CreatedAt,CreatedBy,IsOpenPixel,OpenPixelUrl,OpenGoals,ClickGoals,DataFileQuantity,IsOmniOrder,OmniDeployDate,Impressions,ChannelTypes")]CampaignTestingVM campaignTestingVm)
        {
            if (ModelState.IsValid)
            {
                return RedirectToAction("MoveTo", "Copy", new { id = Session["id"], to = "Approved" });
            }
            else
            {
                var errorList = (from item in ModelState.Values
                                 from error in item.Errors
                                 select error.ErrorMessage).ToList();
                TempData["Error"] = "There is error in saving data." + string.Join("<br/>", errorList);
            }
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgencyEnum)), "Value",
                "Text", campaignTestingVm.TestingUrgency);
            return View("EditTesting", campaignTestingVm);
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButton(Name = "action", Argument = "ProcessFiles")]
        public ActionResult ProcessFiles([Bind(Include = "Id,CampaignId,OrderNumber")] CampaignTestingVM campaignTestingVm)
        {
            var campaign = db.Campaigns.FirstOrDefault(x => x.Id == campaignTestingVm.CampaignId);
            BackgroundJob.Enqueue(() => FileProcessor.ProcessAssetUpdateUrls(UploadPath, campaign.OrderNumber));

            TempData["Success"] = "File Processing has been started succesfully.";
            return RedirectToAction("EditTesting", new { id = campaignTestingVm.Id });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButton(Name = "action", Argument = "FetchProcessDataFiles")]
        public ActionResult FetchProcessDataFiles([Bind(Include = "Id,CampaignId,OrderNumber,ZipCodeFile, DataFileQuantity,Segments")] CampaignTestingVM campaignTestingVm)
        {
            var campaign = db.Campaigns.Include(x => x.Assets).FirstOrDefault(x => x.Id == campaignTestingVm.CampaignId);

            BackgroundJob.Enqueue(() => DataFileProcessor.FetchSQLDataFile(UploadPath, campaign.OrderNumber, campaign.Assets.ZipCodeFile, campaignTestingVm.DataFileQuantity));

            TempData["Success"] = "SQL Data is being fetched and processed, please wait about 5m ...";
            return RedirectToAction("EditTesting", new { id = campaignTestingVm.Id });
        }

        #region NOT USED
        public ActionResult UpdateSegments(Guid? Id, int oldValue, int newValue)
        {
            try
            {
                Campaign campaign = db.Campaigns
                   .Include(x => x.Segments)
                   .FirstOrDefault(x => x.Id == Id);

                var lastSegment = campaign.Segments.OrderBy(x => x.SegmentNumber).LastOrDefault();

                if (oldValue + 1 == newValue) // add 
                {
                    char c1 = 'A';
                    if (lastSegment != null)
                    {
                        c1 = lastSegment.SegmentNumber.ToCharArray().Last();
                        c1++;
                    }
                    campaign.Segments.Add(new CampaignSegment()
                    {
                        Id = Guid.NewGuid(),
                        CreatedAt = DateTime.Now,
                        CampaignId = campaign.Id,
                        SegmentNumber = campaign.OrderNumber + c1,
                        FirstRangeStart = 1,
                        FirstRangeEnd = 60000,
                        SecondRangeStart = 0,
                        SecondRangeEnd = 0,
                        ThirdRangeStart = 0,
                        ThirdRangeEnd = 0
                    });
                    db.SaveChanges();
                }
                else if (oldValue - 1 == newValue) // removed
                {
                    if (lastSegment == null)
                    {
                        throw new Exception("No more Segments");
                    }

                    db.CampaignSegments.Remove(lastSegment);
                    campaign.Segments.Remove(lastSegment);
                    db.SaveChanges();
                }
                else
                {
                    throw new Exception("Please add segments one by one");
                }

                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }

        }
        #endregion
    }
}