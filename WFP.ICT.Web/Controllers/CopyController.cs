using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;
using Hangfire;
using Microsoft.Reporting.Map.WebForms.VirtualEarth;
using WFP.ICT.Web.Async;

namespace WFP.ICT.Web.Controllers
{
    //[Authorize]
    public class CopyController : BaseController
    {
        int pageSize = 10;

        public ActionResult MoveTo(Guid id, string to)
        {
            var campaign = db.Campaigns
                .Include(c => c.Assets)
                .Include(c => c.Testing)
                .Include(c => c.Approved)
                .Include(c => c.ProDatas)
                .FirstOrDefault(c => c.Id == id);
            
            if (string.IsNullOrEmpty(campaign.OrderNumber))
            {
                TempData["Error"] = "Please enter Order Number first.";
                return RedirectToAction("Index", "Campaigns");
            }

            Session["id"] = id;
            Session["OrderNumber"] = campaign.OrderNumber;

            switch (to)
            {
                case "Testing":
                    if (campaign.Testing == null)
                    {
                        campaign.Assets.ZipCodeUrl = string.Format("http://www.digitaldynamixs.net/ep2/{0}/{0}zip.csv",
                            campaign.OrderNumber);
                        campaign.Assets.CreativeUrl = string.Format("http://www.digitaldynamixs.net/ep2/{0}/{0}.htm",
                           campaign.OrderNumber);

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
                            DataFileSegments = campaign.DataFileSegments,
                            //DataFileUrl = string.Format("http://www.digitaldynamixs.net/ep2/{0}/{0}data.csv", campaign.OrderNumber),
                        };

                        char c1 = 'A';
                        for (int i=0;i<campaign.DataFileSegments;i++)
                        {
                            testing.Segments.Add(new CampaignSegment()
                            {
                                Id = Guid.NewGuid(),
                                CreatedAt = DateTime.Now,
                                CampaignId = campaign.Id,
                                SegmentNumber = campaign.OrderNumber + c1,
                                FirstRangeStart = 1,
                                FirstRangeEnd = 600,
                                SecondRangeStart = 0,
                                SecondRangeEnd = 0,
                                ThirdRangeStart = 0,
                                ThirdRangeEnd = 0,
                                BroadcastDate = campaign.BroadcastDate,
                                SubjectLine = campaign.SubjectLine,
                                HtmlImageFiles = campaign.Assets.CreativeFiles
                            });
                            c1++;
                        }

                        db.CampaignsTesting.Add(testing);
                        db.SaveChanges();

                        campaign.TestingId = testingId;
                        db.SaveChanges();
                    }
                    campaign.Status = (int) CampaignStatusEnum.Testing;
                    db.SaveChanges();
                    return RedirectToAction("EditTesting", "Copy", new {id = campaign.TestingId});
                    break;
                case "Approved":

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
                            ReportSiteLink = string.Format("http://report-site.com/c/ADS{0}", campaign.OrderNumber),
                            LinkBreakout = string.Format("http://www.digitaldynamixs.net/ep2/{0}/{0}linkr.csv", campaign.OrderNumber),
                            IsOpenPixel = testing.IsOpenPixel,
                            OpenPixelUrl = testing.OpenPixelUrl,
                            OpenGoals = testing.OpenGoals,
                            ClickGoals = testing.ClickGoals,
                            DataFileQuantity = testing.DataFileQuantity,
                            DataFileSegments = testing.DataFileSegments,
                            DataFileUrl = testing.DataFileUrl
                        };
                        db.CampaignsApproved.Add(approved);
                        db.SaveChanges();
                        campaign.ApprovedId = approvedId;
                        db.SaveChanges();
                    }
                    campaign.Status = (int) CampaignStatusEnum.Approved;
                    db.SaveChanges();
                    return RedirectToAction("EditApproved", "Copy", new {id = campaign.ApprovedId});
                    break;
                case "Tracking":
                    //campaign.Status = (int) CampaignStatusEnum.Tracking;
                    //db.SaveChanges();
                    return RedirectToAction("ViewReport", "Tracking", new {id = campaign.Id});
                    break;
                case "Complete":
                    if (campaign.Testing == null)
                    {
                        TempData["Error"] = "Please pass through Testing first.";
                        return RedirectToAction("Index", "Campaigns");
                    }
                    var notCompletedSegments = db.CampaignSegments
                        .Where(x => x.CampaignId == campaign.Id && x.SegmentStatus != (int) SegmentStatusEnum.Complete);
                    if (notCompletedSegments.Any())
                    {
                        string segments = string.Join(",", notCompletedSegments.Select(x => x.SegmentNumber));
                        TempData["Error"] = "You have " + segments + " in progess and is not complete.";
                        return RedirectToAction("Index", "Campaigns");
                    }
                    campaign.Status = (int) CampaignStatusEnum.Completed;
                    db.SaveChanges();
                    TempData["Success"] = "Campaign " + campaign.CampaignName + " has been completed sucessfully.";
                    return RedirectToAction("Index", "Campaigns");
                    break;
            }

            return null;
        }

        // GET: Copy/Edit/5
        public ActionResult EditTesting(Guid? id)
        {
            if (id == null)
            {
                throw new HttpException(400, "Bad Request");
            }
            var campaignTesting = db.CampaignsTesting
                                    .Include(x => x.Segments)
                                    .FirstOrDefault(c => c.Id == id);

            if (campaignTesting == null)
            {
                throw new HttpException(404, "Not found");
            }

            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgencyEnum)), "Value",
                "Text", campaignTesting.TestingUrgency);
            return View(campaignTesting);
        }

        public ActionResult UpdateSegments(Guid? Id, int oldValue, int newValue)
        {
            try
            {
                CampaignTesting campaignTesting = db.CampaignsTesting
                   .Include(x => x.Segments)
                   .FirstOrDefault(x => x.Id == Id);

                Campaign campaign = db.Campaigns
                   .FirstOrDefault(x => x.Id == campaignTesting.CampaignId);

                var lastSegment = campaignTesting.Segments.OrderBy(x => x.SegmentNumber).LastOrDefault();
                
                if (oldValue + 1 == newValue) // add 
                {
                    char c1 = 'A';
                    if (lastSegment != null)
                    {
                        c1 = lastSegment.SegmentNumber.ToCharArray().Last();
                        c1++;
                    }
                    campaignTesting.Segments.Add(new CampaignSegment()
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
                    campaignTesting.DataFileSegments = newValue;
                    db.SaveChanges();
                }
                else if (oldValue - 1 == newValue) // removed
                {
                    if (lastSegment == null)
                    {
                        throw new Exception("No more Segments");
                    }

                    db.CampaignSegments.Remove(lastSegment);
                    campaignTesting.Segments.Remove(lastSegment);
                    campaignTesting.DataFileSegments = newValue;
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

        // POST: Copy/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButton(Name = "action", Argument = "EditTesting")]
        public ActionResult EditTesting([Bind(
        Include =
                     "Id,CampaignId,OrderNumber,CampaignName,WhiteLabel,ReBroadCast,ReBroadcastDate,FromLine,SubjectLine,HtmlImageFiles,CreativeURL,TestSeedList,FinalSeedList,IsTested,TestingTime,TestingUrgency,DeployDate,ZipCodeFile,ZipURL,GeoDetails,Demographics,Quantity,SpecialInstructions,CreatedAt,CreatedBy,IsOpenPixel,OpenPixelUrl,OpenGoals,ClickGoals,DataFileQuantity,DataFileSegments,Segments"
             )] 
            CampaignTesting campaignTesting)
        {
            if (ModelState.IsValid)
            {
                if (campaignTesting.Segments != null)
                {
                    foreach (var segment in campaignTesting.Segments)
                    {
                        db.Entry(segment).State = EntityState.Modified;
                    }
                }
                db.Entry(campaignTesting).State = EntityState.Modified;
                db.SaveChanges();
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
                "Text", campaignTesting.TestingUrgency);
            return View("EditTesting", campaignTesting);
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
        public ActionResult Approve(
            [Bind(
        Include =
                     "Id,CampaignId,OrderNumber,CampaignName,WhiteLabel,ReBroadCast,ReBroadcastDate,FromLine,SubjectLine,HtmlImageFiles,CreativeURL,TestSeedList,FinalSeedList,IsTested,TestingTime,TestingUrgency,DeployDate,ZipCodeFile,ZipURL,GeoDetails,Demographics,Quantity,SpecialInstructions,CreatedAt,CreatedBy,OpenGoals,ClickGoals,DataFileQuantity,DataFileSegments,Segments"
             )]  CampaignTesting campaignTesting)
        {
            if (ModelState.IsValid)
            {
               if (campaignTesting.Segments != null)
                {
                    foreach (var segment in campaignTesting.Segments)
                    {
                        db.Entry(segment).State = EntityState.Modified;
                    }
                }
                db.Entry(campaignTesting).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("MoveTo", new {id = Session["id"], to = "Approved"});
            }
            else
            {
                var errorList = (from item in ModelState.Values
                    from error in item.Errors
                    select error.ErrorMessage).ToList();
                TempData["Error"] = "There is error in saving data." + string.Join("<br/>", errorList);
            }
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgencyEnum)), "Value",
                "Text", campaignTesting.TestingUrgency);
            return View("EditTesting", campaignTesting);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButton(Name = "action", Argument = "Cancel")]
        public ActionResult Cancel([Bind(Include = "Id,CampaignId")] CampaignTesting campaignTesting)
        {
            var campaign = db.Campaigns.Find(campaignTesting.CampaignId);
            campaign.Status = (int) CampaignStatusEnum.Cancelled;
            db.SaveChanges();
            TempData["Success"] = "Order :" + campaign.OrderNumber + " has been cancelled succesfully.";
            return RedirectToAction("Index", "Campaigns");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButton(Name = "action", Argument = "ProcessFiles")]
        public ActionResult ProcessFiles([Bind(Include = "Id,CampaignId,OrderNumber")] CampaignTesting campaignTesting)
        {
            var campaign = db.Campaigns.FirstOrDefault(x => x.Id == campaignTesting.CampaignId);
            BackgroundJob.Enqueue(() => FileProcessor.ProcessFiles(UploadPath, campaign.OrderNumber));

            TempData["Success"] = "File Processing has been started succesfully.";
            return RedirectToAction("EditTesting", new {id = campaignTesting.Id});
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButton(Name = "action", Argument = "FetchProcessDataFiles")]
        public ActionResult FetchProcessDataFiles([Bind(Include = "Id,CampaignId,OrderNumber,ZipCodeFile, DataFileQuantity,Segments")] CampaignTesting campaignTesting)
        {
            var campaign = db.Campaigns.Include(x => x.Assets).FirstOrDefault(x => x.Id == campaignTesting.CampaignId);

            BackgroundJob.Enqueue(() => DataFileProcessor.FetchSQLDataFile(UploadPath, campaign.OrderNumber, campaign.Assets.ZipCodeFile, campaignTesting.DataFileQuantity));

            TempData["Success"] = "SQL Data is being fetched and processed, please wait about 5m ...";
            return RedirectToAction("EditTesting", new { id = campaignTesting.Id });
        }

        // GET: CampaignApproveds/Edit/5
        public ActionResult EditApproved(Guid? id)
        {
            if (id == null)
            {
                throw new HttpException(400, "Bad Request");
            }
            CampaignApproved campaignApproved = db.CampaignsApproved.Find(id);
            if (campaignApproved == null)
            {
                throw new HttpException(404, "Not found");
            }
            var proData = VendorsList.FirstOrDefault(x => x.Text.ToLowerInvariant().Contains("pro"));
            ViewBag.Vendor = new SelectList(VendorsList, "Value","Text", proData);

            var campaignTesting = db.CampaignsTesting
                                    .Include(x => x.Segments)
                                    .FirstOrDefault(c => c.CampaignId == campaignApproved.CampaignId);
            ViewBag.Segments = campaignTesting?.Segments.OrderBy(x => x.SegmentNumber).ToList();

            //var segmentsList = campaignTesting?.Segments.OrderBy(x => x.SegmentNumber).Select(x => new SelectListItem()
            //{
            //    Text = x.SegmentNumber,
            //    Value = x.Id.ToString()
            //}).ToList();
            //segmentsList.Insert(0, new SelectListItem()
            // {
            //     Text = "Select Segment",
            //     Value = string.Empty
            // });
            //ViewBag.SegmentsList = new SelectList(segmentsList, "Value", "Text");

            return View(campaignApproved);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditApproved([Bind(Include = "Id,CampaignId,ReferenceNumber,OrderNumber,CampaignName,WhiteLabel,ReBroadCast,ReBroadcastDate,FromLine,SubjectLine,HtmlImageFiles,CreativeURL,DeployDate,ZipURL,GeoDetails,Demographics,Quantity,SpecialInstructions,LinkBreakout,ReportSiteLink,CreatedAt,CreatedBy,IsUseApiDataForOpen,IsOpenPixel,OpenPixelUrl,OpenGoals,ClickGoals,DataFileQuantity,DataFileSegments")] CampaignApproved campaignApproved)
        {
            if (ModelState.IsValid)
            {
                db.Entry(campaignApproved).State = EntityState.Modified;
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
            var proData = VendorsList.FirstOrDefault(x => x.Text.Contains("pro"));
            ViewBag.Vendor = new SelectList(VendorsList, "Value", "Text", proData);

            var campaignTesting = db.CampaignsTesting
                                   .Include(x => x.Segments)
                                   .FirstOrDefault(c => c.CampaignId == campaignApproved.CampaignId);
            ViewBag.Segments = campaignTesting?.Segments.OrderBy(x => x.SegmentNumber).ToList();

            return View(campaignApproved);
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
                        campaign.Status = (int)CampaignStatusEnum.Traffic;
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
