﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
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
        public ActionResult Index(Guid? id)
        {
            var campaign = Db.Campaigns
                .Include(c => c.Assets)
                .Include(c => c.Testing)
                .FirstOrDefault(c => c.Id == id);

            if (campaign == null) return View("Error");

            Session["id"] = id;
            Session["OrderNumber"] = campaign.OrderNumber;

            if (campaign.Testing == null)
            {
                campaign.Assets.ZipCodeUrl = $"http://www.digitaldynamixs.net/ep2/{campaign.OrderNumber}/{campaign.OrderNumber}zip.csv";
                campaign.Assets.CreativeUrl =$"http://www.digitaldynamixs.net/ep2/{campaign.OrderNumber}/{campaign.OrderNumber}.htm";

                var testingId = Guid.NewGuid();
                var testing = new CampaignTesting()
                {
                    Id = testingId,
                    CampaignId = campaign.Id,
                    CreatedAt = DateTime.Now,
                    CreatedBy = campaign.CreatedBy,
                    CampaignName = campaign.CampaignName,
                    WhiteLabel = campaign.WhiteLabel,
                    ReBroadCast = campaign.ReBroadCast,
                    ReBroadcastDate = campaign.ReBroadcastDate,
                    FromLine = campaign.FromLine,
                    SubjectLine = campaign.SubjectLine,

                    TestingUrgency = campaign.TestingUrgency,
                    DeployDate = campaign.BroadcastDate,
                    GeoDetails = campaign.GeoDetails,
                    Demographics = campaign.Demographics,
                    Quantity = campaign.Quantity,
                    SpecialInstructions = campaign.SpecialInstructions,

                    IsOpenPixel = campaign.IsOpenPixel,
                    OpenPixelUrl = campaign.OpenPixelUrl,
                    OpenGoals = campaign.Quantity * 12 / 100,
                    ClickGoals = campaign.Quantity * 15 / 100,
                    DataFileQuantity = campaign.DataFileQuantity,
                    //DataFileUrl = string.Format("http://www.digitaldynamixs.net/ep2/{0}/{0}data.csv", campaign.OrderNumber),

                    IsOmniOrder = campaign.IsOmniOrder,
                    OmniDeployDate = campaign.OmniDeployDate,
                    Impressions = campaign.Impressions,
                    ChannelTypes = campaign.ChannelTypes,

                };
                Db.CampaignsTesting.Add(testing);
                Db.SaveChanges();

                campaign.TestingId = testingId;
                Db.SaveChanges();
            }
            campaign.Status = (int)CampaignStatus.Testing;
            Db.SaveChanges();
            return RedirectToAction("EditTesting", "Testing", new { id = campaign.TestingId });
        }

        // GET: Copy/Edit/5
        static char c1;
        public ActionResult EditTesting(Guid? id)
        {
            var campaignTesting = Db.CampaignsTesting.FirstOrDefault(c => c.Id == id);

            if (campaignTesting == null)
            {
                throw new HttpException(404, "Not found");
            }

            TinyMapper.Bind<CampaignTesting, CampaignTestingVM>(config =>
            {
                config.Ignore(x => x.ChannelTypes);
            });

            var campaignTestingVm = TinyMapper.Map<CampaignTestingVM>(campaignTesting);
            Campaign campaign = Db.Campaigns
                   .Include(x => x.Assets)
                   .Include(x => x.Segments)
                   .FirstOrDefault(x => x.Id == campaignTesting.CampaignId);
            campaignTestingVm.OrderNumber = campaign.OrderNumber;
            if (campaign.Assets == null)
            {
                var assetId = Guid.NewGuid();
                Db.CampaignAssets.Add(new CampaignAsset()
                {
                    Id = assetId,
                    CampaignId = campaign.Id,
                    CreatedAt = DateTime.Now
                });
                campaign.AssetsId = assetId;
                Db.SaveChanges();
                campaign = Db.Campaigns
                   .Include(x => x.Assets)
                   .Include(x => x.Segments)
                   .FirstOrDefault(x => x.Id == campaignTesting.CampaignId);
            }
            campaignTestingVm.Assets = campaign.Assets;
            c1 = 'A';
            foreach (var segment in campaign.Segments.OrderBy(x => x.SegmentNumber))
            {
                var segmentVm = TinyMapper.Map<CampaignSegmentVM>(segment);
                campaignTestingVm.Segments.Add(segmentVm);
                c1 = segment.SegmentNumber.Replace(campaignTestingVm.OrderNumber, string.Empty).ToCharArray().Select(x => ++x).FirstOrDefault();
            }
            campaignTestingVm.ChannelTypes = string.IsNullOrEmpty(campaignTesting.ChannelTypes) ? new List<ChannelType> { } :
                campaignTesting.ChannelTypes
                    .Split(",".ToCharArray())
                    .Select(x => (ChannelType)System.Enum.Parse(typeof(ChannelType),x)).ToList();
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgency)), "Value",
                "Text", campaignTestingVm.TestingUrgency);
            ViewBag.WhiteLabel = new SelectList(CustomersList, "Value", "Text", campaignTestingVm.WhiteLabel);
            return View(campaignTestingVm);
        }

        public ActionResult NewSegment(string orderNumber)
        {
            //TempData["PianoMake"] = new SelectList(PianoMakeList, "Value", "Text");
            var segment = new CampaignSegment()
            {
                Id = Guid.NewGuid(),
                CreatedAt = DateTime.Now,
                SegmentNumber = orderNumber + c1++
            };
            return PartialView("~/Views/Shared/Editors/_NewSegment.cshtml", segment);
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
                Db.Entry(campaignTesting).State = EntityState.Modified;
                Db.SaveChanges();

                // Updatin Asssets
                var campaignAssets = Db.CampaignAssets.FirstOrDefault(x => x.CampaignId == campaignTestingVm.CampaignId);
                campaignAssets.CreativeFiles = campaignTestingVm.Assets.CreativeFiles;
                campaignAssets.CreativeUrl = campaignTestingVm.Assets.CreativeUrl;
                campaignAssets.ZipCodeFile = campaignTestingVm.Assets.ZipCodeFile;
                campaignAssets.ZipCodeUrl = campaignTestingVm.Assets.ZipCodeUrl;
                campaignAssets.TestSeedFile = campaignTestingVm.Assets.TestSeedFile;
                campaignAssets.LiveSeedFile = campaignTestingVm.Assets.LiveSeedFile;
                Db.Entry(campaignAssets).State = EntityState.Modified;
                Db.SaveChanges();

                // Updating Segments
                if(campaignTestingVm.Segments != null)
                foreach (var segmentVm in campaignTestingVm.Segments)
                {
                    var segment = Db.CampaignSegments.FirstOrDefault(x => x.Id == segmentVm.Id);
                    if (segment == null)
                    {
                        segment = new CampaignSegment()
                        {
                            Id = Guid.NewGuid(),
                            CreatedAt = DateTime.Now,
                            CampaignId = campaignTestingVm.CampaignId,
                            OrderNumber = campaignTestingVm.OrderNumber,
                            SegmentNumber = segmentVm.SegmentNumber
                        };
                        Db.CampaignSegments.Add(segment);
                        Db.SaveChanges();
                    }
                    segment.SubjectLine = segmentVm.SubjectLine;
                    segment.FromLine = segmentVm.FromLine;
                    segment.WhiteLabel = segmentVm.WhiteLabel;
                    segment.Quantity = segmentVm.Quantity;
                    segment.DeploymentDate = segmentVm.DeploymentDate;
                    segment.CreativeFiles = segmentVm.CreativeFiles;
                    segment.FirstRangeStart = segmentVm.FirstRangeStart;
                    segment.FirstRangeEnd = segmentVm.FirstRangeEnd;
                    segment.SecondRangeStart = segmentVm.SecondRangeStart;
                    segment.SecondRangeEnd = segmentVm.SecondRangeEnd;
                    segment.ThirdRangeStart = segmentVm.ThirdRangeStart;
                    segment.ThirdRangeEnd = segmentVm.ThirdRangeEnd;
                    Db.Entry(segment).State = EntityState.Modified;
                    Db.SaveChanges();
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
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgency)), "Value",
                "Text", campaignTestingVm.TestingUrgency);
            ViewBag.WhiteLabel = new SelectList(CustomersList, "Value", "Text", campaignTestingVm.WhiteLabel);
            return View("EditTesting", campaignTestingVm);
        }

        public ActionResult ApproveSegment(Guid? Id)
        {
            try
            {
                var segment = Db.CampaignSegments.FirstOrDefault(x => x.Id == Id);
                segment.SegmentStatus = (int)SegmentStatus.Approved;
                segment.DateApproved = DateTime.Now;
                Db.SaveChanges();
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
                return RedirectToAction("Index", "Approved", new { id = Session["id"] });
            }
            else
            {
                var errorList = (from item in ModelState.Values
                                 from error in item.Errors
                                 select error.ErrorMessage).ToList();
                TempData["Error"] = "There is error in saving data." + string.Join("<br/>", errorList);
            }
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgency)), "Value",
                "Text", campaignTestingVm.TestingUrgency);
            return View("EditTesting", campaignTestingVm);
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButton(Name = "action", Argument = "ProcessFiles")]
        public ActionResult ProcessFiles([Bind(Include = "Id,CampaignId,OrderNumber")] CampaignTestingVM campaignTestingVm)
        {
            var campaign = Db.Campaigns.FirstOrDefault(x => x.Id == campaignTestingVm.CampaignId);
            BackgroundJob.Enqueue(() => FileProcessor.ProcessAssetUpdateUrls(UploadPath, campaign.OrderNumber));

            TempData["Success"] = "File Processing has been started succesfully.";
            return RedirectToAction("EditTesting", new { id = campaignTestingVm.Id });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButton(Name = "action", Argument = "FetchProcessDataFiles")]
        public ActionResult FetchProcessDataFiles([Bind(Include = "Id,CampaignId,OrderNumber,ZipCodeFile, DataFileQuantity,Segments")] CampaignTestingVM campaignTestingVm)
        {
            try
            {
                var campaign = Db.Campaigns
                .Include(x => x.Assets)
                .Include(x => x.Segments)
                .FirstOrDefault(x => x.Id == campaignTestingVm.CampaignId);

                if(campaign.Segments.Count == 0)
                    throw new AdsException("There are no data segments.");

                BackgroundJob.Enqueue(() => DataFileProcessor.FetchSQLDataFile(UploadPath, campaign.OrderNumber, campaign.Assets.ZipCodeFile, campaignTestingVm.DataFileQuantity));

                TempData["Success"] = "SQL Data is being fetched and processed, please wait about 5m ...";
            }
            catch (Exception ex)
            {
                TempData["Error"] = ex.Message;
            }
            return RedirectToAction("EditTesting", new { id = campaignTestingVm.Id });
        }

    }
}