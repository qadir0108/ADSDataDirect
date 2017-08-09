using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Enums;
using Hangfire;
using PagedList;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;
using WFP.ICT.Web.Async;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Controllers
{
    //[Authorize]
    public class CampaignsController : BaseController
    {
        int pageSize = 10;
        
        // GET: Campaigns
        public ActionResult Index(CampaignSearchVM sc)
        {
            //FileManager.ProcessHtml("C:\\123.htm", "C:\\1.htm");
            //FileManager.UploadFile(UploadFileType.ZipFile, @"C:\\zip_codesCopy.csv", "123");
            //if (LoggedInUser == null) return RedirectToAction("LogOff", "Account");

            ViewBag.CurrentSort = sc.sortOrder;
            ViewBag.OrderNumberSortParm = sc.sortOrder == "OrderNumber" ? "OrderNumber_desc" : "OrderNumber";
            ViewBag.CampaignNameSortParm = sc.sortOrder == "CampaignName" ? "CampaignName_desc" : "CampaignName";
            ViewBag.CreatedBySortParm = sc.sortOrder == "CreatedBy" ? "CreatedBy_desc" : "CreatedBy";
            ViewBag.CreatedAtSortParm = sc.sortOrder == "CreatedAt" ? "CreatedAt_desc" : "CreatedAt";
            ViewBag.BroadcastDateSortParm = sc.sortOrder == "BroadcastDate" ? "BroadcastDate_desc" : "BroadcastDate";
            ViewBag.QuantitySortParm = sc.sortOrder == "Quantity" ? "Quantity_desc" : "Quantity";
            ViewBag.StatusSortParm = sc.sortOrder == "Status" ? "Status_desc" : "Status";

            var campagins =
                db.Campaigns
                .Include(x => x.Testing).Include(x => x.Approved)
                .ToList();

            switch (sc.sortOrder)
            {
                case "OrderNumber":
                    campagins = campagins.OrderBy(s => s.OrderNumber).ToList();
                    break;
                case "OrderNumber_desc":
                    campagins = campagins.OrderByDescending(s => s.OrderNumber).ToList();
                    break;
                case "CampaignName":
                    campagins = campagins.OrderBy(s => s.CampaignName).ToList();
                    break;
                case "CampaignName_desc":
                    campagins = campagins.OrderByDescending(s => s.CampaignName).ToList();
                    break;
                case "CreatedBy":
                    campagins = campagins.OrderBy(s => s.CreatedBy).ToList();
                    break;
                case "CreatedBy_desc":
                    campagins = campagins.OrderByDescending(s => s.CreatedBy).ToList();
                    break;
                case "CreatedAt":
                    campagins = campagins.OrderBy(s => s.CreatedAt).ToList();
                    break;
                case "CreatedAt_desc":
                    campagins = campagins.OrderByDescending(s => s.CreatedAt).ToList();
                    break;
                case "BroadcastDate":
                    campagins = campagins.OrderBy(s => s.BroadcastDate).ToList();
                    break;
                case "BroadcastDate_desc":
                    campagins = campagins.OrderByDescending(s => s.BroadcastDate).ToList();
                    break;
                case "Quantity":
                    campagins = campagins.OrderBy(s => s.Quantity).ToList();
                    break;
                case "Quantity_desc":
                    campagins = campagins.OrderByDescending(s => s.Quantity).ToList();
                    break;
                case "Status":
                    campagins = campagins.OrderBy(s => s.Status).ToList();
                    break;
                case "Status_desc":
                    campagins = campagins.OrderByDescending(s => s.Status).ToList();
                    break;
                default:
                    campagins = campagins.OrderByDescending(s => s.CreatedAt).ToList();
                    break;
            }

            ViewBag.SearchType = sc.searchType;
            if (sc.searchType == "basic")
            {
                if (!string.IsNullOrEmpty(sc.basicString))
                {
                    var searchRDP = sc.basicString + "RDP";
                    campagins = campagins.Where(s => 
                    s.OrderNumber.Equals(sc.basicString) || 
                    s.OrderNumber.Equals(searchRDP) ||
                    s.CampaignName.IndexOf(sc.basicString, StringComparison.InvariantCultureIgnoreCase) >= 0).ToList();
                    ViewBag.BasicStringSearched = sc.basicString;
                } else if (!string.IsNullOrEmpty(sc.basicStatus))
                {
                    int status = int.Parse(sc.basicStatus);
                    if (status == (int)CampaignStatusEnum.Rebroadcasted)
                        campagins = campagins.Where(s => s.OrderNumber.EndsWith("RDP")).ToList();
                    else
                        campagins = campagins.Where(s => s.Status == status).ToList();
                    ViewBag.BasicStatusSearched = sc.basicStatus;
                } else if (!string.IsNullOrEmpty(sc.basicOrderNumber))
                {
                    campagins = campagins.Where(s => s.Id.ToString().Equals(sc.basicOrderNumber)).ToList();
                }

            }
            else if (sc.searchType == "advanced")
            {
                if (!string.IsNullOrEmpty(sc.advancedStatus))
                {
                    int status = int.Parse(sc.advancedStatus);
                    if (status == (int)CampaignStatusEnum.Rebroadcasted)
                        campagins = campagins.Where(s => s.OrderNumber.EndsWith("RDP")).ToList();
                    else
                        campagins = campagins.Where(s => s.Status == status).ToList();
                    ViewBag.AdvancedStatusSearched = sc.advancedStatus;
                }
                if (!string.IsNullOrEmpty(sc.advancedUser))
                {
                    campagins = campagins.Where(s => s.CreatedBy == sc.advancedUser).ToList();
                    ViewBag.AdvancedUserSearched = sc.advancedUser;
                }
                
                if (!string.IsNullOrEmpty(sc.campaignName))
                {
                    sc.campaignName = sc.campaignName.ToLowerInvariant();
                    campagins = campagins.Where(s => s.CampaignName.IndexOf(sc.campaignName, StringComparison.CurrentCultureIgnoreCase) >= 0).ToList();
                    ViewBag.CampaignName = sc.campaignName;
                }

                if (!string.IsNullOrEmpty(sc.isTested))
                {
                    bool IsTested = Boolean.Parse(sc.isTested);
                    campagins = campagins.Where(s => s.Testing != null 
                                                  && s.Testing?.IsTested == IsTested).ToList();
                    ViewBag.IsTested = sc.isTested;
                }

                if (!string.IsNullOrEmpty(sc.orderedFrom))
                {
                    DateTime dateFrom = DateTime.ParseExact(sc.orderedFrom, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                    campagins = campagins.Where(s => s.CreatedAt.Date >= dateFrom.Date).ToList();
                    ViewBag.OrderedFrom = sc.orderedFrom;
                }

                if (!string.IsNullOrEmpty(sc.orderedTo))
                {
                    DateTime dateTo = DateTime.ParseExact(sc.orderedTo, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                    campagins = campagins.Where(s => s.CreatedAt.Date <= dateTo.Date).ToList();
                    ViewBag.OrderedTo = sc.orderedTo;
                }

                if (!string.IsNullOrEmpty(sc.broadcastFrom))
                {
                    DateTime dateFrom = DateTime.ParseExact(sc.broadcastFrom, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                    campagins = campagins.Where(s => s.BroadcastDate?.Date >= dateFrom.Date).ToList();
                    ViewBag.BroadcastFrom = sc.broadcastFrom;
                }

                if (!string.IsNullOrEmpty(sc.broadcastTo))
                {
                    DateTime dateTo = DateTime.ParseExact(sc.broadcastTo, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                    campagins = campagins.Where(s => s.BroadcastDate?.Date <= dateTo.Date).ToList();
                    ViewBag.BroadcastTo = sc.broadcastTo;
                }
            }

            if (LoggedInUser != null && !IsAdmin)
            {
                campagins = campagins.Where(s => s.CreatedBy == LoggedInUser.UserName).ToList();
            }

            ViewBag.BasicOrderNumber = OrderNumberList;
            ViewBag.BasicStatus = StatusList;
            ViewBag.AdvancedStatus = StatusList;
            ViewBag.AdvancedUser = UsersList;

            string idsForPrint = string.IsNullOrEmpty(ViewBag.SearchIds) ?
                                    string.Join(",", campagins.Select(x => x.Id.ToString()))
                                    : ViewBag.SearchIds;
            Session["idsForPrint"] = idsForPrint;

            // Paging
            int pageNumber = (sc.page ?? 1);
            return View(campagins.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Download()
        {
            string fileName = string.Format("Orders_{0:yyyyMMdd_HHmmss}.csv", DateTime.Now);
            var filePath = string.Format("{0}\\{1}", DownloadPath, fileName);
            if (Session["idsForPrint"] != null)
            {
                List<Guid> ids;
                try
                {
                    ids =
                        (Session["idsForPrint"] as string).Split(",".ToCharArray()).Select(x => Guid.Parse(x)).ToList();
                    var campagins = db.Campaigns
                        .Include(x => x.Testing).Include(x => x.Approved)
                        .Where(x => ids.Contains(x.Id))
                        .ToList()
                        .Select(x => new CampaignReportVM()
                        {
                            OrderNumber = x.OrderNumber,
                            CampaignName = x.CampaignName,
                            BroadcastDate = x.BroadcastDate?.ToString(),
                            Quantity = x.Approved != null ? x.Approved.Quantity.ToString() : x.Testing != null ? x.Testing.Quantity.ToString() : x.Quantity.ToString(),
                            Status = System.Enum.GetName(typeof(CampaignStatusEnum), x.Status)
                        });

                    campagins.ToCsv(filePath, new CsvDefinition()
                    {
                        EndOfLine = "\r\n",
                        FieldSeparator = ',',
                        TextQualifier = '"',
                        Columns   = new List<string> { "OrderNumber", "CampaignName", "BroadcastDate", "Quantity", "Status" }
                    });
                }
                catch (Exception ex)
                {
                    throw new Exception("Wrong Numbers" + ex.Message);
                }
            }
            return File(filePath, "text/csv", fileName);
        }

        // GET: Campaigns/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                throw new HttpException(400, "Bad Request");
            }
            Campaign campaign = db.Campaigns.Find(id);
            if (campaign == null)
            {
                throw new HttpException(404, "Not found");
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
                RepresentativeEmail = LoggedInUser?.Email,
                DataFileSegments = 1
            };
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgencyEnum)), "Value",
                "Text", model.TestingUrgency);
            ViewBag.Retargeting = new SelectList(EnumHelper.GetEnumTextValues(typeof(RetargetingEnum)), "Value",
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
                     "Assets,ID,CreatedAt,CampaignName,BroadcastDate,RepresentativeName,RepresentativeEmail,ReBroadCast,ReBroadcastDate,Price,TestingUrgency,GeoDetails,Demographics,Quantity,FromLine,SubjectLine,IsPersonalization,IsMatchback,IsSuppression,WhiteLabel,OptOut,SpecialInstructions,OrderNumber,IsAddViewInBrowser,IsAddOptOut,DataFileQuantity,DataFileSegments,IsAccessCreativeManager,IsOpenPixel,OpenPixelUrl,IsOmniOrder,OmniDeployDate,Impressions,Retargeting")] Campaign campaign)
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
                    campaign.CreatedBy = LoggedInUser?.UserName;
                    campaign.OrderNumber = newOrderNumber.ToString();
                    campaign.IP = Request.ServerVariables["REMOTE_ADDR"];
                    campaign.Browser = Request.UserAgent;
                    campaign.OS = Environment.OSVersion.Platform + " " + Environment.OSVersion.VersionString;
                    campaign.Referrer = Request.UrlReferrer.AbsolutePath;

                    campaign.Assets.Id = Guid.NewGuid();
                    campaign.Assets.CampaignId = campaign.Id;
                    campaign.Assets.CreatedAt = DateTime.Now;
                    campaign.Assets.CreatedBy = LoggedInUser?.UserName;

                    db.Campaigns.Add(campaign);
                    db.SaveChanges();

                    BackgroundJob.Enqueue(() => FileProcessor.ProcessNewOrder(campaign.OrderNumber, LoggedInUser));

                    _forceOrders = true;
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
            ViewBag.Retargeting = new SelectList(EnumHelper.GetEnumTextValues(typeof(RetargetingEnum)), "Value",
               "Text", campaign.TestingUrgency);
            return View(campaign);
        }

     
        // GET: Campaigns/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                throw new HttpException(400, "Bad Request");
            }
            Campaign campaign = db.Campaigns.Find(id);
            if (campaign == null)
            {
                throw new HttpException(404, "Not found");
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
                throw new HttpException(400, "Bad Request");
            }
            Campaign campaign = db.Campaigns.Find(id);
            if (campaign == null)
            {
                throw new HttpException(404, "Not found");
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

            db.Campaigns.Remove(campaign);
            db.SaveChanges();
            _forceOrders = true;
            return RedirectToAction("Index");
        }

        // GET: Campaigns/Delete/5
        public ActionResult Clone(Guid? id)
        {
            if (id == null)
            {
                throw new HttpException(400, "Bad Request");
            }
            Campaign campaign = db.Campaigns.Find(id);
            if (campaign == null)
            {
                throw new HttpException(404, "Not found");
            }
            return View(campaign);
        }

        [HttpPost, ActionName("Clone")]
        [ValidateAntiForgeryToken]
        public ActionResult CloneConfirmed(Guid id)
        {
            var camps = db.Campaigns.ToList();
            int newOrderNumber = camps.Count > 0 ? camps.Max(x => int.Parse(x.OrderNumber.TrimEnd("RDP".ToCharArray()))) + 1 : 2500;

            Campaign campaign = db.Campaigns
                .Include(x => x.Testing)
                .Include(x => x.Approved)
                .FirstOrDefault(x => x.Id == id);

            var copy = new Campaign();
            db.Campaigns.Add(copy);
            db.Entry(copy).CurrentValues.SetValues(db.Entry(campaign).CurrentValues);
            copy.Id = Guid.NewGuid();
            copy.CreatedAt = DateTime.Now;
            copy.OrderNumber = newOrderNumber.ToString();
            copy.Status = (int)CampaignStatusEnum.OrderRecevied;
            copy.TestingId = null;
            copy.ApprovedId = null;
            db.SaveChanges();

            if (campaign.Testing != null)
            {
                var testingId = Guid.NewGuid();
                var testing = new CampaignTesting();
                db.CampaignsTesting.Add(testing);
                db.Entry(testing).CurrentValues.SetValues(db.Entry(campaign.Testing).CurrentValues);
                testing.Id = testingId;
                testing.CreatedAt = DateTime.Now;
                testing.CampaignId = copy.Id;
                db.SaveChanges();

                copy.TestingId = testingId;
                db.SaveChanges();
            }

            if (campaign.Approved != null)
            {
                var approvedId = Guid.NewGuid();
                var approved = new CampaignApproved();
                db.CampaignsApproved.Add(approved);
                db.Entry(approved).CurrentValues.SetValues(db.Entry(campaign.Approved).CurrentValues);
                approved.Id = approvedId;
                approved.CreatedAt = DateTime.Now;
                approved.CampaignId = copy.Id;
                db.SaveChanges();

                copy.ApprovedId = approvedId;
                db.SaveChanges();
            }
            _forceOrders = true;
            TempData["Success"] = "Order : " + campaign.OrderNumber + " has been cloned to Order: " + newOrderNumber + " sucessfully.";
            return RedirectToAction("Index");
        }

    }
}
