using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Enums;
using PagedList;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Controllers
{
    public class CampaignsController : BaseController
    {
        private WFPICTContext db = new WFPICTContext();
        int pageSize = 10;

        // GET: Campaigns
        public ActionResult Index(CampaignSearchVM sc)
        {
            ViewBag.CurrentSort = sc.sortOrder;
            ViewBag.CampaignNameSortParm = sc.sortOrder == "CampaignName" ? "CampaignName_desc" : "CampaignName";
            ViewBag.BroadcastDateSortParm = sc.sortOrder == "BroadcastDate" ? "BroadcastDate_desc" : "BroadcastDate";
            ViewBag.CreatedBySortParm = sc.sortOrder == "CreatedBy" ? "CreatedBy_desc" : "CreatedBy";
            ViewBag.StatusSortParm = sc.sortOrder == "Status" ? "Status_desc" : "Status";
            ViewBag.OrderNumberSortParm = sc.sortOrder == "OrderNumber" ? "OrderNumber_desc" : "OrderNumber";

            var campagins =
                db.Campaigns.Include(x => x.Copy).Where(x => x.Status != (int) CampaignStatusEnum.Completed && x.ParentOrderNumber == null).ToList();

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
                    campagins = campagins.Where(s => s.OrderNumber.ToString().Equals(sc.searchString)).ToList();
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
                    campagins = campagins.Where(s => s.IsTested == Boolean.Parse(sc.IsTested)).ToList();
                }

                if (!string.IsNullOrEmpty(sc.dateFrom))
                {
                    DateTime dateFrom = DateTime.ParseExact(sc.dateFrom, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    campagins = campagins.Where(s => s.CreatedAt.Date >= dateFrom.Date).ToList();
                    ViewBag.DateFrom = sc.dateFrom;
                }

                if (!string.IsNullOrEmpty(sc.dateTo))
                {
                    DateTime dateTo = DateTime.ParseExact(sc.dateTo, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    campagins = campagins.Where(s => s.CreatedAt.Date <= dateTo.Date).ToList();
                    ViewBag.DateTo = sc.dateTo;
                }
            }

            if (!User.Identity.Name.Equals("josh.silver"))
            {
                campagins = campagins.Where(s => s.CreatedBy == LoggedInUser.UserName).ToList();
            }

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
                ReferenceNumber = 0
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
                     "ID,CreatedAt,CampaignName,BroadcastDate,RepresentativeName,RepresentativeEmail,ReBroadCast,ReBroadcastDate,Price,TestingUrgency,ZipCodeFile,GeoDetails,Demographics,Quantity,FromLine,SubjectLine,HtmlImageFiles,TestSeedList,FinalSeedList,SuppressionFile,IsPersonalization,IsMatchback,IsSuppression,WhiteLabel,OptOut,SpecialInstructions,ReferenceNumber,OrderNumber")] Campaign campaign)
        {
            if (ModelState.IsValid)
            {
                int newOrderNumber = db.Campaigns.ToList().Max(x => int.Parse(x.OrderNumber)) + 1;
                campaign.Id = Guid.NewGuid();
                campaign.CreatedAt = DateTime.Now;
                campaign.CreatedBy = LoggedInUser.UserName;

                campaign.OrderNumber = newOrderNumber.ToString();
                db.Campaigns.Add(campaign);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

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
                     "ID,CreatedAt,CreatedBy,CampaignName,BroadcastDate,RepresentativeName,RepresentativeEmail,ReBroadCast,ReBroadcastDate,Price,TestingUrgency,ZipCodeFile,GeoDetails,Demographics,Quantity,FromLine,SubjectLine,HtmlImageFiles,TestSeedList,FinalSeedList,SuppressionFile,IsPersonalization,IsMatchback,IsSuppression,WhiteLabel,OptOut,SpecialInstructions,ReferenceNumber,OrderNumber,Status"
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
            db.Campaigns.Remove(campaign);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult MoveTo(Guid id, string to)
        {
            var campaign = db.Campaigns
                .Include(ds => ds.Copy)
                .FirstOrDefault(e => e.Id == id);

            if(string.IsNullOrEmpty(campaign.OrderNumber))
                throw new Exception("Please enter Order Number first");

            if (campaign.Copy != null)
            {
                switch (to)
                {
                    case "Testing":
                        campaign.Status = (int) CampaignStatusEnum.Testing;
                        campaign.Copy.Status = (int) CampaignStatusEnum.Testing;
                        db.SaveChanges();
                        return RedirectToAction("Index", "Copy", new {id = campaign.Copy.Id, from = "Testing"});
                        break;
                    case "Approved":
                        campaign.Status = (int) CampaignStatusEnum.Approved;
                        campaign.Copy.Status = (int) CampaignStatusEnum.Approved;
                        campaign.Copy.LinkBreakout = string.Format(
                            "http://www.digitaldynamixs.net/ep2/{0}/{0}linkr.csv", campaign.OrderNumber);
                        db.SaveChanges();
                        return RedirectToAction("Index", "Copy", new {id = campaign.Copy.Id, from = "Approved"});
                        break;
                    case "Tracking":
                        campaign.Status = (int) CampaignStatusEnum.Tracking;
                        campaign.Copy.Status = (int) CampaignStatusEnum.Tracking;
                        db.SaveChanges();
                        return RedirectToAction("Index", "Copy", new {id = campaign.Copy.Id, from = "Tracking"});
                        break;
                }
            }
            else
            {
                var copy = new Campaign();
                db.Campaigns.Add(copy);
                db.Entry(copy).CurrentValues.SetValues(db.Entry(campaign).CurrentValues);
                copy.Id = Guid.NewGuid();
                copy.CreatedAt = DateTime.Now;
                copy.ParentOrderNumber = campaign.OrderNumber;

                copy.CreativeURL = string.Format("http://www.digitaldynamixs.net/ep2/{0}/{0}.htm", campaign.OrderNumber);
                copy.ZipURL = string.Format("http://www.digitaldynamixs.net/ep2/{0}/{0}zip.csv", campaign.OrderNumber);

                copy.Status = (int) CampaignStatusEnum.Testing;
                db.SaveChanges();

                campaign.Copy = copy;
                db.SaveChanges();

                return RedirectToAction("Index", "Copy", new {id = campaign.Copy.Id, from = "Testing"});
            }
            return null;
        }

        public ActionResult Status(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Campaign campaign = db.Campaigns.Include("Copy").FirstOrDefault(x => x.Id == id);
            if (campaign == null)
            {
                return HttpNotFound();
            }

            if (campaign.Copy != null)
                campaign = campaign.Copy;

            var allUsers = db.Users.Where(x => !x.UserName.Equals("josh.silver")).ToList();
            allUsers.Insert(0, new WFPUser() {Id = "", UserName = "Select User"});

            ViewBag.Customer = new SelectList(allUsers, "Id", "UserName", campaign.AssignedToCustomer);
            return View(campaign);
        }

        public ActionResult ChangeAssigned(Guid? Id, string UserId)
        {
            Campaign campaign = db.Campaigns.Include("Copy").FirstOrDefault(x => x.Id == Id);
            if (campaign == null)
            {
                return HttpNotFound();
            }
            try
            {
                campaign.Copy.AssignedToCustomer = UserId;
                db.SaveChanges();
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }

        }

        public ActionResult Report(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Campaign campaign = db.Campaigns.Include("ProDatas").Include("Copy").FirstOrDefault(x => x.Id == id);
            if (campaign == null)
            {
                return HttpNotFound();
            }

            SortedDictionary<int, double> hoursPercentageDictionary = new SortedDictionary<int, double>()
            {
                {10, 0.22181 }, {20, 0.40928}, {30, 0.55004}, {40, 0.67389}, {50, 0.78330}, {60, 0.87274}, {70, 0.93972}, {80, 0.99955}, {90, 1}
            };

            long clicked = 0 , opened = 0;
            if (campaign.ProDatas.Count > 0)
            {
                clicked = campaign.ProDatas.Sum(x => x.ClickCount);
                DateTime startDateTime = DateTime.Parse(campaign.ProDatas.FirstOrDefault().CampaignStartDate);
                int hrsPassed = ((int)Math.Round((DateTime.Now - startDateTime).TotalHours / 10.0)) * 10;
                double percentage = hrsPassed >= 90 ? 1 : hoursPercentageDictionary[hrsPassed];
                opened = ((int)Math.Round(campaign.ProDatas.Sum(x => x.ClickCount) * percentage));
            }
            var model = new CampaignReportVM()
            {
                Id = campaign.Id.ToString(),
                OrderNumber = campaign.OrderNumber,
                CampaignName = campaign.CampaignName,
                Status = ((CampaignStatusEnum)campaign.Status).ToString(),
                WhiteLabel = campaign.WhiteLabel,
                Quantity = campaign.Quantity.ToString(),
                Clicked = clicked == 0 ? "NA" : clicked.ToString(),
                Opened = opened == 0 ? "NA" : opened.ToString(),

                IONumber = campaign.Copy.IONumber,
                StartDate = campaign.Copy.DeployDateTime.ToString(),
                EmailsSent = campaign.Quantity.ToString(),
                OpenedPercentage = ((opened/ campaign.Quantity)* 100).ToString("0.00%"),
                ClickedPercentage = ((clicked / campaign.Quantity) * 100).ToString("0.00%"),
                CTRPercentage = ((clicked/opened) * 100).ToString("0.00%"),
            };
            model.PerLink = new List<CampaignReportDetailVM>();
            foreach (var proData in campaign.ProDatas)
            {
                model.PerLink.Add(new CampaignReportDetailVM()
                {
                    IONumber = proData.IO,
                    Link = proData.Destination_URL,
                    Quantity = proData.ClickCount.ToString()
                });
            }
            
            return View(model);
        }

        public JsonResult RefreshProData(string OrderNumber)
        {
            try
            {
                if (OrderNumber == null)
                {
                    throw  new Exception("Order Number missing");
                }

                ProDataHelper.FetchAndUpdate(db, OrderNumber);

                return Json(new JsonResponse() { IsSucess = true });
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message });
            }

        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
