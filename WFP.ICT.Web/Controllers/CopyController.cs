using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Enums;
using PagedList;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;
using System.IO;
using System.Threading.Tasks;
using System.Web.Hosting;
using Hangfire;
using WFP.ICT.Web.Async;

namespace WFP.ICT.Web.Controllers
{
    [Authorize]
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
                            SpecialInstructions = campaign.SpecialInstructions
                        };
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
                            ReportSiteLink = string.Format("http://report-site.com/c/ADS{0}", campaign.OrderNumber)
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
                    return RedirectToAction("ViewReport", "Report", new {id = campaign.Id});
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
            var campaignTesting = db.CampaignsTesting.FirstOrDefault(c => c.Id == id);

            if (campaignTesting == null)
            {
                throw new HttpException(404, "Not found");
            }
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgencyEnum)), "Value",
                "Text", campaignTesting.TestingUrgency);
            return View(campaignTesting);
        }

        // POST: Copy/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButton(Name = "action", Argument = "EditTesting")]
        public ActionResult EditTesting(
            [Bind(
                 Include =
                     "Id,CampaignId,OrderNumber,CampaignName,WhiteLabel,ReBroadCast,ReBroadcastDate,FromLine,SubjectLine,HtmlImageFiles,CreativeURL,TestSeedList,FinalSeedList,IsTested,TestingTime,TestingUrgency,DeployDate,ZipCodeFile,ZipURL,GeoDetails,Demographics,Quantity,SpecialInstructions,CreatedAt,CreatedBy"
             )] CampaignTesting campaignTesting)
        {
            if (ModelState.IsValid)
            {
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
                     "Id,CampaignId,OrderNumber,CampaignName,WhiteLabel,ReBroadCast,ReBroadcastDate,FromLine,SubjectLine,HtmlImageFiles,CreativeURL,TestSeedList,FinalSeedList,IsTested,TestingTime,TestingUrgency,DeployDate,ZipCodeFile,ZipURL,GeoDetails,Demographics,Quantity,SpecialInstructions,CreatedAt,CreatedBy"
             )] CampaignTesting campaignTesting)
        {
            if (ModelState.IsValid)
            {
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
        [MultipleButton(Name = "action", Argument = "Process")]
        public ActionResult Process([Bind(Include = "Id,CampaignId,OrderNumber")] CampaignTesting campaignTesting)
        {
            BackgroundJob.Enqueue(() => FileProcessor.ProcessFiles(UploadPath, campaignTesting.OrderNumber));

            TempData["Success"] = "File Processing has been started succesfully.";
            return RedirectToAction("EditTesting", new {id = campaignTesting.Id});
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
            return View(campaignApproved);
        }

        // POST: CampaignApproveds/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditApproved([Bind(Include = "Id,CampaignId,ReferenceNumber,OrderNumber,CampaignName,WhiteLabel,ReBroadCast,ReBroadcastDate,FromLine,SubjectLine,HtmlImageFiles,CreativeURL,DeployDate,ZipURL,GeoDetails,Demographics,Quantity,SpecialInstructions,LinkBreakout,ReportSiteLink,CreatedAt,CreatedBy")] CampaignApproved campaignApproved)
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
