using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;
using Hangfire;
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
                .Include(c => c.Testing)
                .Include(c => c.Approved)
                .Include(c => c.Rebroad)
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
                        var testingId = Guid.NewGuid();
                        var testing = new CampaignTesting()
                        {
                            Id = testingId,
                            CampaignId = campaign.Id,
                            CreatedAt = DateTime.Now,
                            CreatedBy = campaign.CreatedBy,
                            OrderNumber = campaign.OrderNumber,
                            CampaignName = campaign.CampaignName,
                            WhiteLabel = campaign.WhiteLabel,
                            ReBroadCast = campaign.ReBroadCast,
                            ReBroadcastDate = campaign.ReBroadcastDate,
                            FromLine = campaign.FromLine,
                            SubjectLine = campaign.SubjectLine,
                            HtmlImageFiles = campaign.HtmlImageFiles,
                            CreativeURL = string.Format("http://www.digitaldynamixs.net/ep2/{0}/{0}.htm", campaign.OrderNumber),
                            TestSeedList = campaign.TestSeedList,
                            FinalSeedList = campaign.FinalSeedList,
                            TestingUrgency = campaign.TestingUrgency,
                            DeployDate = campaign.BroadcastDate,

                            ZipCodeFile = campaign.ZipCodeFile,
                            ZipURL = string.Format("http://www.digitaldynamixs.net/ep2/{0}/{0}zip.csv",campaign.OrderNumber),
                            GeoDetails = campaign.GeoDetails,
                            Demographics = campaign.Demographics,
                            Quantity = campaign.Quantity,
                            SpecialInstructions = campaign.SpecialInstructions,

                            OpenGoals = campaign.OpenGoals,
                            ClickGoals = campaign.ClickGoals,
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
                                SegmentIoNumber = campaign.OrderNumber + c1,
                                FirstRangeStart = 1,
                                FirstRangeEnd = 60000,
                                SecondRangeStart = 60001,
                                SecondRangeEnd = 120000
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
                            OrderNumber = testing.OrderNumber,
                            CampaignName = testing.CampaignName,
                            WhiteLabel = testing.WhiteLabel,
                            ReBroadCast = testing.ReBroadCast,
                            ReBroadcastDate = testing.ReBroadcastDate,
                            FromLine = testing.FromLine,
                            SubjectLine = testing.SubjectLine,
                            HtmlImageFiles = testing.HtmlImageFiles,
                            CreativeURL = testing.CreativeURL,
                            DeployDate = testing.DeployDate,

                            ZipURL = testing.ZipURL,
                            GeoDetails = testing.GeoDetails,
                            Demographics = testing.Demographics,
                            Quantity = testing.Quantity,
                            SpecialInstructions = testing.SpecialInstructions,
                            LinkBreakout =
                                string.Format("http://www.digitaldynamixs.net/ep2/{0}/{0}linkr.csv",
                                    campaign.OrderNumber),
                            ReportSiteLink = string.Format("http://report-site.com/c/ADS{0}", campaign.OrderNumber),

                            OpenGoals = testing.OpenGoals,
                            ClickGoals = testing.ClickGoals,
                            DataFileQuantity = testing.DataFileQuantity,
                            DataFileSegments = testing.DataFileSegments,
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
                case "ReBroadcast":
                    if (campaign.OrderNumber.EndsWith("RDP"))
                    {
                        TempData["Error"] = "This is already broadcasted.";
                        return RedirectToAction("Index", "Campaigns");
                    }

                    if (!campaign.RebroadId.HasValue)
                    {
                        if (campaign.Approved == null)
                        {
                            TempData["Error"] = "Please pass through Approved first.";
                            return RedirectToAction("Index", "Campaigns");
                        }

                        var copy = new Campaign();
                        db.Campaigns.Add(copy);
                        db.Entry(copy).CurrentValues.SetValues(db.Entry(campaign).CurrentValues);
                        copy.Id = Guid.NewGuid();
                        copy.CreatedAt = DateTime.Now;
                        copy.OrderNumber = campaign.Approved.OrderNumber + "RDP";
                        copy.Status = (int) CampaignStatusEnum.Rebroadcasted;
                        copy.TestingId = null;
                        copy.ApprovedId = null;
                        db.SaveChanges();

                        var testingId = Guid.NewGuid();
                        var testing = new CampaignTesting()
                        {
                            Id = testingId,
                            CampaignId = copy.Id,
                            CreatedAt = DateTime.Now,
                            CreatedBy = copy.CreatedBy,
                            OrderNumber = copy.OrderNumber,
                            CampaignName = campaign.Approved.CampaignName,
                            WhiteLabel = campaign.Approved.WhiteLabel,
                            ReBroadCast = campaign.Approved.ReBroadCast,
                            ReBroadcastDate = campaign.Approved.ReBroadcastDate,
                            FromLine = campaign.Approved.FromLine,
                            SubjectLine = campaign.Approved.SubjectLine,
                            HtmlImageFiles = campaign.Approved.HtmlImageFiles,
                            CreativeURL = string.Format("http://www.digitaldynamixs.net/ep2/{0}/{0}.htm", campaign.OrderNumber),
                            TestSeedList = campaign.Testing.TestSeedList,
                            FinalSeedList = campaign.Testing.FinalSeedList,
                            TestingUrgency = campaign.Testing.TestingUrgency,
                            DeployDate = campaign.Approved.DeployDate,

                            ZipCodeFile = campaign.Testing.ZipCodeFile,
                            ZipURL = string.Format("http://www.digitaldynamixs.net/ep2/{0}/{0}zip.csv",campaign.OrderNumber),
                            GeoDetails = campaign.Approved.GeoDetails,
                            Demographics = campaign.Approved.Demographics,
                            Quantity = campaign.Approved.Quantity,
                            SpecialInstructions = campaign.Approved.SpecialInstructions
                        };
                        db.CampaignsTesting.Add(testing);
                        db.SaveChanges();

                        copy.TestingId = testingId;
                        db.SaveChanges();

                        campaign.RebroadId = copy.Id;
                        db.SaveChanges();
                    }
                    return RedirectToAction("MoveTo", "Copy", new {id = campaign.RebroadId, to = "Testing"});
                    break;
                case "Complete":
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
                var campaignTesting = db.CampaignsTesting
                                     .Include(x => x.Segments)
                                     .FirstOrDefault(c => c.Id == Id);
                if (campaignTesting == null)
                {
                    throw new Exception("Not found");
                }

                var lastSegment = campaignTesting.Segments.OrderBy(x => x.SegmentIoNumber).LastOrDefault();
                
                if (oldValue + 1 == newValue) // add 
                {
                    char c1 = 'A';
                    if (lastSegment != null)
                    {
                        c1 = lastSegment.SegmentIoNumber.ToCharArray().Last();
                        c1++;
                    }
                    campaignTesting.Segments.Add(new CampaignSegment()
                    {
                        Id = Guid.NewGuid(),
                        CreatedAt = DateTime.Now,
                        CampaignId = campaignTesting.CampaignId,
                        SegmentIoNumber = campaignTesting.OrderNumber + c1,
                        FirstRangeStart = 1,
                        FirstRangeEnd = 60000,
                        SecondRangeStart = 60001,
                        SecondRangeEnd = 120000
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
                     "Id,CampaignId,OrderNumber,CampaignName,WhiteLabel,ReBroadCast,ReBroadcastDate,FromLine,SubjectLine,HtmlImageFiles,CreativeURL,TestSeedList,FinalSeedList,IsTested,TestingTime,TestingUrgency,DeployDate,ZipCodeFile,ZipURL,GeoDetails,Demographics,Quantity,SpecialInstructions,CreatedAt,CreatedBy,OpenGoals,ClickGoals,DataFileQuantity,DataFileSegments,Segments"
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
            BackgroundJob.Enqueue(() => FileProcessor.ProcessFiles(UploadPath, campaignTesting.OrderNumber));

            TempData["Success"] = "File Processing has been started succesfully.";
            return RedirectToAction("EditTesting", new {id = campaignTesting.Id});
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButton(Name = "action", Argument = "FetchDataFile")]
        public ActionResult FetchDataFile([Bind(Include = "Id,CampaignId,OrderNumber")] CampaignTesting campaignTesting)
        {
            //BackgroundJob.Enqueue(() => FileProcessor.ProcessFiles(UploadPath, campaignTesting.OrderNumber));

            TempData["Success"] = "SQL Data File is being fetched, please wait...";
            return RedirectToAction("EditTesting", new { id = campaignTesting.Id });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButton(Name = "action", Argument = "ProcessDataFiles")]
        public ActionResult ProcessDataFiles([Bind(Include = "Id,CampaignId,OrderNumber")] CampaignTesting campaignTesting)
        {
            //BackgroundJob.Enqueue(() => FileProcessor.ProcessFiles(UploadPath, campaignTesting.OrderNumber));

            TempData["Success"] = "Data Files are being generated, please wait...";
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
            var files = campaignTesting.Segments.Select(x => x.SegmentDataFileUrl);
            ViewBag.DataFiles = new SelectList(files, "Value", "Text", proData);

            return View(campaignApproved);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditApproved([Bind(Include = "Id,CampaignId,ReferenceNumber,OrderNumber,CampaignName,WhiteLabel,ReBroadCast,ReBroadcastDate,FromLine,SubjectLine,HtmlImageFiles,CreativeURL,DeployDate,ZipURL,GeoDetails,Demographics,Quantity,SpecialInstructions,LinkBreakout,ReportSiteLink,CreatedAt,CreatedBy,IsUseApiDataForOpen,OpenGoals,ClickGoals,DataFileQuantity,DataFileSegments")] CampaignApproved campaignApproved)
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
            var files = campaignTesting.Segments.Select(x => x.SegmentDataFileUrl);
            ViewBag.DataFiles = new SelectList(files, "Value", "Text", proData);
            return View(campaignApproved);
        }
        
        public ActionResult SendToVendor(Guid? Id, Guid? VendorId)
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

                BackgroundJob.Enqueue(() => CampaignProcessor.SendVendorEmail(campaign.OrderNumber, VendorId));

                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }

        }

        

    }
}
