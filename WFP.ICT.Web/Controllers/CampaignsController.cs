using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web.Mvc;
using ADSDataDirect.Enums;
using Hangfire;
using PagedList;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;
using WFP.ICT.Web.Async;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;
using WFP.ICT.Web.Reports;

namespace WFP.ICT.Web.Controllers
{
    [Authorize]
    public class CampaignsController : BaseController
    {
        int pageSize = 10;
        
        // GET: Campaigns
        public ActionResult Index(CampaignSearchVM sc)
        {
            //FileManager.ProcessHtml("C:\\123.htm", "C:\\1.htm");
            //FileManager.UploadFile(UploadFileType.ZipFile, @"C:\\zip_codesCopy.csv", "123");
            if (LoggedInUser == null) return RedirectToAction("LogOff", "Account");

            ViewBag.CurrentSort = sc.sortOrder;
            ViewBag.CampaignNameSortParm = sc.sortOrder == "CampaignName" ? "CampaignName_desc" : "CampaignName";
            ViewBag.BroadcastDateSortParm = sc.sortOrder == "BroadcastDate" ? "BroadcastDate_desc" : "BroadcastDate";
            ViewBag.CreatedBySortParm = sc.sortOrder == "CreatedBy" ? "CreatedBy_desc" : "CreatedBy";
            ViewBag.StatusSortParm = sc.sortOrder == "Status" ? "Status_desc" : "Status";
            ViewBag.OrderNumberSortParm = sc.sortOrder == "OrderNumber" ? "OrderNumber_desc" : "OrderNumber";

            var campagins =
                db.Campaigns
                .Include(x => x.Testing).Include(x => x.Approved)
                .ToList();

            switch (sc.sortOrder)
            {
                case "CampaignName":
                    campagins = campagins.OrderBy(s => s.CampaignName).ToList();
                    break;
                case "CampaignName_desc":
                    campagins = campagins.OrderByDescending(s => s.CampaignName).ToList();
                    break;
                case "BroadcastDate":
                    campagins = campagins.OrderBy(s => s.BroadcastDate).ToList();
                    break;
                case "BroadcastDate_desc":
                    campagins = campagins.OrderByDescending(s => s.BroadcastDate).ToList();
                    break;
                case "CreatedBy":
                    campagins = campagins.OrderBy(s => s.CreatedBy).ToList();
                    break;
                case "CreatedBy_desc":
                    campagins = campagins.OrderByDescending(s => s.CreatedBy).ToList();
                    break;
                case "Status":
                    campagins = campagins.OrderBy(s => s.Status).ToList();
                    break;
                case "Status_desc":
                    campagins = campagins.OrderByDescending(s => s.Status).ToList();
                    break;
                case "OrderNumber":
                    campagins = campagins.OrderBy(s => s.OrderNumber).ToList();
                    break;
                case "OrderNumber_desc":
                    campagins = campagins.OrderByDescending(s => s.OrderNumber).ToList();
                    break;
                default:
                    campagins = campagins.OrderByDescending(s => s.CreatedAt).ToList();
                    break;
            }

            if (sc.searchType == "basic")
            {
                ViewBag.SearchString = sc.searchString;
                if (!string.IsNullOrEmpty(sc.searchString))
                {
                    var searchRDP = sc.searchString + "RDP";
                    campagins = campagins.Where(s => s.OrderNumber.Equals(sc.searchString) || s.OrderNumber.Equals(searchRDP)).ToList();
                }
            }
            else if (sc.searchType == "advanced")
            {
                if (!string.IsNullOrEmpty(sc.campaignName))
                {
                    sc.campaignName = sc.campaignName.ToLowerInvariant();
                    campagins = campagins.Where(s => s.CampaignName.IndexOf(sc.campaignName, StringComparison.CurrentCultureIgnoreCase) >= 0).ToList();
                }

                if (!string.IsNullOrEmpty(sc.IsTested))
                {
                    bool IsTested = Boolean.Parse(sc.IsTested);
                    campagins = campagins.Where(s => s.Testing != null 
                                                  && s.Testing.IsTested == IsTested).ToList();
                }

                if (!string.IsNullOrEmpty(sc.dateFrom))
                {
                    DateTime dateFrom = DateTime.ParseExact(sc.dateFrom, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                    campagins = campagins.Where(s => s.CreatedAt.Date >= dateFrom.Date).ToList();
                    ViewBag.DateFrom = sc.dateFrom;
                }

                if (!string.IsNullOrEmpty(sc.dateTo))
                {
                    DateTime dateTo = DateTime.ParseExact(sc.dateTo, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                    campagins = campagins.Where(s => s.CreatedAt.Date <= dateTo.Date).ToList();
                    ViewBag.DateTo = sc.dateTo;
                }
                
            }

            if (LoggedInUser != null && !IsAdmin)
            {
                campagins = campagins.Where(s => s.CreatedBy == LoggedInUser.UserName).ToList();
            }

            if (!string.IsNullOrEmpty(sc.Status))
            {
                int status = int.Parse(sc.Status);
                if(status == (int)CampaignStatusEnum.Rebroadcasted)
                    campagins = campagins.Where(s => s.OrderNumber.EndsWith("RDP")).ToList();
                else
                    campagins = campagins.Where(s => s.Status == status).ToList();
                ViewBag.StatusSearched = sc.Status;
            }
            else
            {
                campagins = campagins.Where(x => x.Status != (int) CampaignStatusEnum.Completed).ToList();
            }

            ViewBag.Status = StatusList;

            // Paging
            int pageNumber = (sc.page ?? 1);
            return View(campagins.ToPagedList(pageNumber, pageSize));
        }

        // GET: Campaigns/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Campaign campaign = db.Campaigns.Find(id);
            if (campaign == null)
            {
                return HttpNotFound();
            }
            return View(campaign);
        }

        // GET: Campaigns/Create
        public ActionResult Create()
        {
            Campaign model = new Campaign()
            {
                Id = Guid.NewGuid(),
                CreatedAt = DateTime.Now,
                OrderNumber = "",
                RepresentativeName = LoggedInUser?.UserName,
                RepresentativeEmail = LoggedInUser?.Email
            };
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgencyEnum)), "Value",
                "Text", model.TestingUrgency);
            return View(model);
        }

        // POST: Campaigns/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(
            [Bind(
                 Include =
                     "ID,CreatedAt,CampaignName,BroadcastDate,RepresentativeName,RepresentativeEmail,ReBroadCast,ReBroadcastDate,Price,TestingUrgency,ZipCodeFile,GeoDetails,Demographics,Quantity,FromLine,SubjectLine,HtmlImageFiles,TestSeedList,FinalSeedList,SuppressionFile,IsPersonalization,IsMatchback,IsSuppression,WhiteLabel,OptOut,SpecialInstructions,OrderNumber,IsAddViewInBrowser,IsAddOptOut")] Campaign campaign)
        {
            if (ModelState.IsValid)
            {
                try
                {

                    var camps = db.Campaigns.ToList();
                    int newOrderNumber = camps.Count > 0
                        ? camps.Max(x => int.Parse(x.OrderNumber.TrimEnd("RDP".ToCharArray()))) + 1
                        : 2500;
                    campaign.Id = Guid.NewGuid();
                    campaign.CreatedAt = DateTime.Now;
                    campaign.CreatedBy = LoggedInUser.UserName;
                    campaign.OrderNumber = newOrderNumber.ToString();
                    campaign.IP = Request.ServerVariables["REMOTE_ADDR"];
                    campaign.Browser = Request.UserAgent;
                    campaign.OS = Environment.OSVersion.Platform + " " + Environment.OSVersion.VersionString;
                    campaign.Referrer = Request.UrlReferrer.AbsolutePath;
                    
                    db.Campaigns.Add(campaign);
                    db.SaveChanges();

                    BackgroundJob.Enqueue(() => CampaignProcessor.ProcessNewOrder(campaign.OrderNumber, LoggedInUser));

                    TempData["Success"] = "Order #: "+ campaign.OrderNumber + " , Campaign " + campaign.CampaignName + " has been submitted sucessfully.";
                }
                catch (Exception ex)
                {
                    TempData["Error"] = "This is error while creating order." + ex.Message;
                }
                return RedirectToAction("Index");
            }
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgencyEnum)), "Value",
                "Text", campaign.TestingUrgency);
            return View(campaign);
        }

     
        // GET: Campaigns/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Campaign campaign = db.Campaigns.Find(id);
            if (campaign == null)
            {
                return HttpNotFound();
            }
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgencyEnum)), "Value",
                "Text", campaign.TestingUrgency);
            ViewBag.Status = new SelectList(EnumHelper.GetEnumTextValues(typeof(CampaignStatusEnum)), "Value", "Text",
                campaign.Status);
            return View(campaign);
        }

        // POST: Campaigns/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(
            [Bind(
                 Include =
                     "ID,CreatedAt,CreatedBy,CampaignName,BroadcastDate,RepresentativeName,RepresentativeEmail,ReBroadCast,ReBroadcastDate,Price,TestingUrgency,ZipCodeFile,GeoDetails,Demographics,Quantity,FromLine,SubjectLine,HtmlImageFiles,TestSeedList,FinalSeedList,SuppressionFile,IsPersonalization,IsMatchback,IsSuppression,WhiteLabel,OptOut,SpecialInstructions,OrderNumber,Status"
             )] Campaign campaign)
        {
            if (ModelState.IsValid)
            {
                db.Entry(campaign).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgencyEnum)), "Value",
                "Text", campaign.TestingUrgency);
            ViewBag.Status = new SelectList(EnumHelper.GetEnumTextValues(typeof(CampaignStatusEnum)), "Value", "Text",
                campaign.Status);
            return View(campaign);
        }

        // GET: Campaigns/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Campaign campaign = db.Campaigns.Find(id);
            if (campaign == null)
            {
                return HttpNotFound();
            }
            return View(campaign);
        }

        // POST: Campaigns/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Campaign campaign = db.Campaigns.Find(id);
            var proDatas = db.ProDatas.Where(x => x.CampaignId == campaign.Id);
            foreach (var proData in proDatas)
            {
                db.ProDatas.Remove(proData);
            }
            db.SaveChanges();

            if (campaign.OrderNumber.EndsWith("RDP"))
            {
                Campaign campaign1 = db.Campaigns.Include(x => x.Testing).Include(x => x.Approved)
                    .FirstOrDefault(x => x.RebroadId == campaign.Id);
                campaign1.RebroadId = null;
                db.SaveChanges();

                db.CampaignsTesting.Remove(campaign1.Testing);
                db.CampaignsApproved.Remove(campaign1.Approved);
                db.SaveChanges();
            }
            db.Campaigns.Remove(campaign);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Campaigns/Delete/5
        public ActionResult Clone(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Campaign campaign = db.Campaigns.Find(id);
            if (campaign == null)
            {
                return HttpNotFound();
            }
            return View(campaign);
        }

        [HttpPost, ActionName("Clone")]
        [ValidateAntiForgeryToken]
        public ActionResult CloneConfirmed(Guid id)
        {
            var camps = db.Campaigns.ToList();
            int newOrderNumber = camps.Count > 0 ? camps.Max(x => int.Parse(x.OrderNumber.TrimEnd("RDP".ToCharArray()))) + 1 : 2500;

            Campaign campaign = db.Campaigns.Include(x => x.Testing).Include(x => x.Approved).FirstOrDefault(x => x.Id == id);

            var copy = new Campaign();
            db.Campaigns.Add(copy);
            db.Entry(copy).CurrentValues.SetValues(db.Entry(campaign).CurrentValues);
            copy.Id = Guid.NewGuid();
            copy.CreatedAt = DateTime.Now;
            copy.OrderNumber = newOrderNumber.ToString();
            copy.Status = (int)CampaignStatusEnum.OrderRecevied;
            db.SaveChanges();

            if (campaign.Testing != null)
            {
                var testingId = Guid.NewGuid();
                var copyTesting = new CampaignTesting();
                db.CampaignsTesting.Add(copyTesting);
                db.Entry(copyTesting).CurrentValues.SetValues(db.Entry(campaign.Testing).CurrentValues);
                copyTesting.Id = testingId;
                copyTesting.CreatedAt = DateTime.Now;
                copyTesting.CampaignId = copy.Id;
                copyTesting.OrderNumber = newOrderNumber.ToString();
                db.SaveChanges();

                copy.TestingId = testingId;
                db.SaveChanges();
            }

            if (campaign.Approved != null)
            {
                var approvedId = Guid.NewGuid();
                var copyApproved = new CampaignApproved();
                db.CampaignsApproved.Add(copyApproved);
                db.Entry(copyApproved).CurrentValues.SetValues(db.Entry(campaign.Approved).CurrentValues);
                copyApproved.Id = approvedId;
                copyApproved.CreatedAt = DateTime.Now;
                copyApproved.CampaignId = copy.Id;
                copyApproved.OrderNumber = newOrderNumber.ToString();
                db.SaveChanges();

                copy.ApprovedId = approvedId;
                db.SaveChanges();
            }
            TempData["Success"] = "Order : " + campaign.OrderNumber + " has been cloned to Order: " + newOrderNumber + " sucessfully.";
            return RedirectToAction("Index");
        }

    }
}
