using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Hangfire;
using Nelibur.ObjectMapper;
using PagedList;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;
using WFP.ICT.Web.Async;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;
using WFP.ICT.Web.ProData;

namespace WFP.ICT.Web.Controllers
{
    [Authorize]
    public class CampaignsController : BaseController
    {
        private static char c1;
        
        // GET: Campaigns
        public ActionResult Index(CampaignSearchVM sc)
        {
            //NotificationsProcessor.FetchAndCheckForQcRules();
            //FileManager.ProcessHtml("C:\\123.htm", "C:\\1.htm");
            //FileManager.UploadFile(UploadFileType.ZipFile, @"C:\\zip_codesCopy.csv", "123");
            if (LoggedInUser == null) return RedirectToAction("LogOff", "Account");

            ViewBag.CurrentSort = sc.sortOrder;
            ViewBag.OrderNumberSortParm = sc.sortOrder == "OrderNumber" ? "OrderNumber_desc" : "OrderNumber";
            ViewBag.CampaignNameSortParm = sc.sortOrder == "CampaignName" ? "CampaignName_desc" : "CampaignName";
            ViewBag.CreatedBySortParm = sc.sortOrder == "CreatedBy" ? "CreatedBy_desc" : "CreatedBy";
            ViewBag.CreatedAtSortParm = sc.sortOrder == "CreatedAt" ? "CreatedAt_desc" : "CreatedAt";
            ViewBag.BroadcastDateSortParm = sc.sortOrder == "BroadcastDate" ? "BroadcastDate_desc" : "BroadcastDate";
            ViewBag.QuantitySortParm = sc.sortOrder == "Quantity" ? "Quantity_desc" : "Quantity";
            ViewBag.StatusSortParm = sc.sortOrder == "Status" ? "Status_desc" : "Status";

            var campagins =
                Db.Campaigns
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
                    campagins = campagins.Where(s => 
                    s.OrderNumber.Equals(sc.basicString) || 
                    s.ReBroadcastedOrderNumber == sc.basicString ||
                    s.CampaignName.IndexOf(sc.basicString, StringComparison.InvariantCultureIgnoreCase) >= 0).ToList();
                    ViewBag.BasicStringSearched = sc.basicString;
                } else if (!string.IsNullOrEmpty(sc.basicStatus))
                {
                    int status = int.Parse(sc.basicStatus);
                    if (status == (int)CampaignStatus.Rebroadcasted)
                        campagins = campagins.Where(s => s.ReBroadcasted).ToList();
                    else if (status == (int)CampaignStatus.NotRebroadcasted)
                        campagins = campagins.Where(s => s.ReBroadCast && !s.ReBroadcasted).ToList();
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
                    if (status == (int)CampaignStatus.Rebroadcasted)
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
            return View(campagins.ToPagedList(pageNumber, PageSize));
        }

        public ActionResult Download()
        {
            string fileName = $"Orders_{DateTime.Now:yyyyMMdd_HHmmss}.csv";
            var filePath = $"{DownloadPath}\\{fileName}";
            if (Session["idsForPrint"] != null)
            {
                List<Guid> ids;
                try
                {
                    ids = (Session["idsForPrint"] as string)?.Split(",".ToCharArray()).Select(Guid.Parse).ToList();
                    var campagins = Db.Campaigns
                        .Include(x => x.Testing).Include(x => x.Approved)
                        .Where(x => ids.Contains(x.Id))
                        .ToList()
                        .Select(x => new CampaignVM()
                        {
                            OrderNumber = x.OrderNumber,
                            CampaignName = x.CampaignName,
                            BroadcastDate = x.BroadcastDate,
                            Quantity = x.Approved?.Quantity ?? (x.Testing?.Quantity ?? x.Quantity),
                            Status = System.Enum.GetName(typeof(CampaignStatus), x.Status)
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
                    throw new AdsException("Wrong Numbers" + ex.Message);
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
            Campaign campaign = Db.Campaigns.Find(id);
            if (campaign == null)
            {
                throw new HttpException(404, "Not found");
            }
            return View(campaign);
        }

        public ActionResult NewSegment()
        {
            //TempData["PianoMake"] = new SelectList(PianoMakeList, "Value", "Text");
            var segment = new CampaignSegment()
            {
                Id = Guid.NewGuid(),
                CreatedAt = DateTime.Now,
                SegmentNumber = "" + c1++,
                WhiteLabel = LoggedInUser.WhiteLabel
            };
            return PartialView("~/Views/Shared/Editors/_NewSegment.cshtml", segment);
        }

        // GET: Campaigns/Create
        public ActionResult Create()
        {
            c1 = 'A';
            CampaignVM model = new CampaignVM()
            {
                RepresentativeName = LoggedInUser?.UserName,
                RepresentativeEmail = LoggedInUser?.Email,
                ChannelTypes = new List<ChannelType> { }
                //ChannelTypes = new List<Enum.ChannelType> { Enum.ChannelType.Retargeting, Enum.ChannelType.Display, }
            };
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgency)), "Value",
                "Text", model.TestingUrgency);
            ViewBag.WhiteLabel = new SelectList(CustomersList, "Value", "Text", LoggedInUser?.WhiteLabel);
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
                     "Assets,Segments,ID,OrderNumber,CreatedAt,CampaignName,BroadcastDate,RepresentativeName,RepresentativeEmail,ReBroadCast,ReBroadcastDate,Price,TestingUrgency,GeoDetails,Demographics,Quantity,FromLine,SubjectLine,IsPersonalization,IsMatchback,IsSuppression,IsOpenPixel,OpenPixelUrl,WhiteLabel,OptOut,SpecialInstructions,IsAddViewInBrowser,IsAddOptOut,DataFileQuantity,IsOmniOrder,OmniDeployDate,Impressions,ChannelTypes")] CampaignVM campaignVm)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    
                    var camps = Db.Campaigns.ToList();
                    int newOrderNumber = camps.Count > 0
                        ? camps.Max(x => int.Parse(x.OrderNumber.TrimEnd("RDP".ToCharArray()))) + 1
                        : 2500;

                    string userName = LoggedInUser?.UserName;

                    TinyMapper.Bind<CampaignVM, Campaign>(config =>
                    {
                        config.Ignore(x => x.Segments);
                        config.Ignore(x => x.ChannelTypes);
                    });

                    var campaign = TinyMapper.Map<Campaign>(campaignVm);
                    char c2 = 'A';
                    foreach (var segmentVm in campaignVm.Segments)
                    {
                        var segment = TinyMapper.Map<CampaignSegment>(segmentVm);
                        segment.Id = Guid.NewGuid();
                        segment.CreatedAt = DateTime.Now;
                        segment.OrderNumber = "" + newOrderNumber;
                        segment.SegmentNumber = newOrderNumber + "" + c2++;
                        campaign.Segments.Add(segment);
                    }
                    campaign.Id = Guid.NewGuid();
                    campaign.CreatedAt = DateTime.Now;
                    campaign.CreatedBy = userName;
                    campaign.OrderNumber = newOrderNumber.ToString();
                    campaign.IP = Request.ServerVariables["REMOTE_ADDR"];
                    campaign.Browser = Request.UserAgent;
                    campaign.OS = Environment.OSVersion.Platform + " " + Environment.OSVersion.VersionString;
                    campaign.Referrer = Request.UrlReferrer.AbsolutePath;
                    campaign.ChannelTypes = campaignVm.ChannelTypes == null ? null :
                        string.Join(",", campaignVm.ChannelTypes);
                    campaign.Assets.Id = Guid.NewGuid();
                    campaign.Assets.CampaignId = campaign.Id;
                    campaign.Assets.CreatedAt = DateTime.Now;
                    campaign.Assets.CreatedBy = userName;

                    Db.Campaigns.Add(campaign);
                    Db.SaveChanges();

                    BackgroundJob.Enqueue(() => FileProcessor.ProcessNewOrder(campaign.OrderNumber, userName));

                    ForceOrders = true;
                    TempData["Success"] = "Order #: "+ campaign.OrderNumber + " , Campaign " + campaign.CampaignName + " has been submitted sucessfully.";
                }
                catch (Exception ex)
                {
                    TempData["Error"] = "This is error while creating order." + ex.Message;
                }
                return RedirectToAction("Index");
            }
            campaignVm.ChannelTypes = campaignVm.ChannelTypes ?? new List<ChannelType> {};

            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgency)), "Value",
                "Text", campaignVm.TestingUrgency);
            ViewBag.WhiteLabel = new SelectList(CustomersList, "Value", "Text", LoggedInUser?.WhiteLabel);
            return View(campaignVm);
        }

     
        // GET: Campaigns/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                throw new HttpException(400, "Bad Request");
            }
            Campaign campaign = Db.Campaigns.Find(id);
            if (campaign == null)
            {
                throw new HttpException(404, "Not found");
            }
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgency)), "Value",
                "Text", campaign.TestingUrgency);
            ViewBag.Status = new SelectList(EnumHelper.GetEnumTextValues(typeof(CampaignStatus)), "Value", "Text",
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
                Db.Entry(campaign).State = EntityState.Modified;
                Db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgency)), "Value",
                "Text", campaign.TestingUrgency);
            ViewBag.Status = new SelectList(EnumHelper.GetEnumTextValues(typeof(CampaignStatus)), "Value", "Text",
                campaign.Status);
            return View(campaign);
        }

        public ActionResult Clone(Guid? id)
        {
            Campaign campaign = Db.Campaigns.Find(id);
            if (campaign == null)
            {
                throw new HttpException(404, "Not found");
            }
            return View("Clone", campaign);
        }

        [HttpPost, ActionName("Clone")]
        [ValidateAntiForgeryToken]
        public ActionResult CloneConfirmed(Guid id)
        {
            var camps = Db.Campaigns.ToList();
            int newOrderNumber = camps.Count > 0 ? camps.Max(x => int.Parse(x.OrderNumber.TrimEnd("RDP".ToCharArray()))) + 1 : 2500;

            Campaign campaign = Db.Campaigns
                .Include(x => x.Assets)
                .Include(x => x.Segments)
                .Include(x => x.Testing)
                .Include(x => x.Approved)
                .FirstOrDefault(x => x.Id == id);

            var copyId = Guid.NewGuid();
            var copy = new Campaign();
            Db.Campaigns.Add(copy);
            Db.Entry(copy).CurrentValues.SetValues(Db.Entry(campaign).CurrentValues);
            copy.Id = copyId;
            copy.CreatedAt = DateTime.Now;
            copy.OrderNumber = newOrderNumber.ToString();
            copy.Status = (int)CampaignStatus.OrderRecevied;
            copy.TestingId = null;
            copy.ApprovedId = null;
            Db.SaveChanges();

            var copyAssets = new CampaignAsset();
            Db.CampaignAssets.Add(copyAssets);
            Db.Entry(copyAssets).CurrentValues.SetValues(Db.Entry(campaign.Assets).CurrentValues);
            copyAssets.Id = Guid.NewGuid();
            copyAssets.CampaignId = copyId;
            copyAssets.CreatedAt = DateTime.Now;
            Db.SaveChanges();
            copy.AssetsId = copyAssets.Id;
            Db.SaveChanges();

            foreach (var segment in campaign.Segments.ToList())
            {
                var copySegment = new CampaignSegment();
                Db.CampaignSegments.Add(copySegment);
                Db.Entry(copySegment).CurrentValues.SetValues(Db.Entry(segment).CurrentValues);
                copySegment.Id = Guid.NewGuid();
                copySegment.CampaignId = copyId;
                copySegment.OrderNumber = "" + newOrderNumber;
                copySegment.CreatedAt = DateTime.Now;
                Db.SaveChanges();
            }

            if (campaign.Testing != null)
            {
                var testingId = Guid.NewGuid();
                var testing = new CampaignTesting();
                Db.CampaignsTesting.Add(testing);
                Db.Entry(testing).CurrentValues.SetValues(Db.Entry(campaign.Testing).CurrentValues);
                testing.Id = testingId;
                testing.CreatedAt = DateTime.Now;
                testing.CampaignId = copy.Id;
                Db.SaveChanges();

                copy.TestingId = testingId;
                Db.SaveChanges();
            }

            if (campaign.Approved != null)
            {
                var approvedId = Guid.NewGuid();
                var approved = new CampaignApproved();
                Db.CampaignsApproved.Add(approved);
                Db.Entry(approved).CurrentValues.SetValues(Db.Entry(campaign.Approved).CurrentValues);
                approved.Id = approvedId;
                approved.CreatedAt = DateTime.Now;
                approved.CampaignId = copy.Id;
                Db.SaveChanges();

                copy.ApprovedId = approvedId;
                Db.SaveChanges();
            }
            ForceOrders = true;
            TempData["Success"] = "Order : " + campaign.OrderNumber + " has been cloned to Order: " + newOrderNumber + " sucessfully.";
            return RedirectToAction("Index", "Campaigns");
        }

        // GET: Campaigns/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                throw new HttpException(400, "Bad Request");
            }
            Campaign campaign = Db.Campaigns.Find(id);
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
            Campaign campaign = Db.Campaigns.Find(id);
            var proDatas = Db.ProDatas.Where(x => x.CampaignId == campaign.Id);
            foreach (var proData in proDatas)
            {
                Db.ProDatas.Remove(proData);
            }
            Db.SaveChanges();

            var segments = Db.CampaignSegments.Where(x => x.CampaignId == campaign.Id);
            foreach (var segment in segments)
            {
                Db.CampaignSegments.Remove(segment);
            }
            Db.SaveChanges();

            var assets = Db.CampaignAssets.FirstOrDefault(x => x.CampaignId == campaign.Id);
            if (assets != null)
                Db.CampaignAssets.Remove(assets);
            Db.SaveChanges();

            var testing = Db.CampaignsTesting.FirstOrDefault(x => x.CampaignId == campaign.Id);
            if(testing != null)
                Db.CampaignsTesting.Remove(testing);
            Db.SaveChanges();

            var approved = Db.CampaignsApproved.FirstOrDefault(x => x.CampaignId == campaign.Id);
            if (approved != null)
                Db.CampaignsApproved.Remove(approved);
            Db.SaveChanges();

            Db.Campaigns.Remove(campaign);
            Db.SaveChanges();
            ForceOrders = true;
            TempData["Success"] = "Order :" + campaign.OrderNumber + " has been DELETED succesfully.";
            return RedirectToAction("Index");
        }

        public ActionResult Cancel(Guid? id)
        {
            if (id == null)
            {
                throw new HttpException(400, "Bad Request");
            }
            Campaign campaign = Db.Campaigns.Find(id);
            if (campaign == null)
            {
                throw new HttpException(404, "Not found");
            }
            return View(campaign);
        }

        [HttpPost, ActionName("Cancel")]
        [ValidateAntiForgeryToken]
        public ActionResult CancelConfirmed(Guid id)
        {
            var campaign = Db.Campaigns.Find(id);
            campaign.Status = (int)CampaignStatus.Cancelled;
            Db.SaveChanges();
            TempData["Success"] = "Order :" + campaign.OrderNumber + " has been cancelled succesfully.";
            return RedirectToAction("Index", "Campaigns");
        }

        public ActionResult Complete(Guid? id)
        {
            if (id == null)
            {
                throw new HttpException(400, "Bad Request");
            }
            Campaign campaign = Db.Campaigns.Find(id);
            if (campaign == null)
            {
                throw new HttpException(404, "Not found");
            }
            return View(campaign);
        }

        [HttpPost, ActionName("Complete")]
        [ValidateAntiForgeryToken]
        public ActionResult CompleteConfirmed(Guid id)
        {
            var campaign = Db.Campaigns.Include(x => x.Testing).FirstOrDefault(x => x.Id == id);
            if (campaign.Testing == null)
            {
                TempData["Error"] = "Please pass through Testing first.";
                return RedirectToAction("Index", "Campaigns");
            }
            var notCompletedSegments = Db.CampaignSegments
                .Where(x => x.CampaignId == campaign.Id && x.SegmentStatus != (int)SegmentStatus.Complete);
            if (notCompletedSegments.Any())
            {
                string segments = string.Join(",", notCompletedSegments.Select(x => x.SegmentNumber));
                TempData["Error"] = "You have " + segments + " in progess and is not complete.";
                return RedirectToAction("Index", "Campaigns");
            }
            campaign.Status = (int)CampaignStatus.Completed;
            Db.SaveChanges();
            TempData["Success"] = "Campaign " + campaign.CampaignName + " has been completed sucessfully.";
            return RedirectToAction("Index", "Campaigns");
        }

        public ActionResult Rebroad(Guid? id)
        {
            if (id == null)
            {
                throw new HttpException(400, "Bad Request");
            }
            Campaign campaign = Db.Campaigns.Include(x => x.Segments).Include(x => x.Trackings)
                .FirstOrDefault(x => x.Id == id);
            if (campaign == null)
            {
                throw new HttpException(404, "Not found");
            }
            var proData = VendorsList.FirstOrDefault(x => x.Text.Contains("Pro"));
            ViewBag.Vendor = new SelectList(VendorsList, "Value", "Text", proData);

            var campaignTracking = campaign.Trackings.FirstOrDefault(x => x.SegmentNumber == string.Empty);

            long opennedFromOrignal = campaignTracking?.Opened ?? campaign.Quantity;
            campaign.ReBroadcastedQuantity = opennedFromOrignal;
            return View(campaign);
        }

        [HttpPost, ActionName("Rebroad")]
        [ValidateAntiForgeryToken]
        public ActionResult RebroadConfirmed(Guid?Id, DateTime? ReBroadcastedDate, long ReBroadcastedQuantity, Guid? Vendor, string[] SegmentsSelected)
        {
            if (ReBroadcastedDate == null || Vendor == null)
            {
                TempData["Error"] = $"ReBroadcastedDate and Vendor is required.";
                return RedirectToAction("Rebroad", "Campaigns", new { id  = Id});
            }
            Campaign campaign = Db.Campaigns.FirstOrDefault(x => x.Id == Id);
            if (campaign.ReBroadcasted)
            {
                TempData["Error"] = $"Already rebroadcasted.";
                return RedirectToAction("Rebroad", "Campaigns", new { id = Id });
            }
            campaign.ReBroadcasted = true;
            campaign.ReBroadcastedDate = ReBroadcastedDate;
            campaign.ReBroadcastedQuantity = ReBroadcastedQuantity;
            campaign.ReBroadcastedOrderNumber = campaign.OrderNumber + "RDP";
            Db.SaveChanges();

            // Send email to vendor
            BackgroundJob.Enqueue(() => CampaignProcessor.SendVendorEmail(Vendor, campaign.OrderNumber, SegmentsSelected));
            
            TempData["Success"] = "Order #:" + campaign.OrderNumber + ", Campaign " + campaign.CampaignName + " Rebroad has been sent to vendor sucessfully.";
            return RedirectToAction("Index", "Campaigns");
        }
    }
}
