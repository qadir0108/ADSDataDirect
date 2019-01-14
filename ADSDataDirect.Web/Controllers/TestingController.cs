using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.Helpers;
using ADSDataDirect.Web.Models;
using Hangfire;
using Nelibur.ObjectMapper;
using ADSDataDirect.Infrastructure.Campaigns;
using ADSDataDirect.Infrastructure.DataFiles;
using ADSDataDirect.Infrastructure.DynamicCoding;
using ADSDataDirect.Infrastructure.Db;
using ADSDataDirect.Core.Static;
using ADSDataDirect.Infrastructure.ClickMeter;
using ADSDataDirect.Infrastructure.Csv;
using ADSDataDirect.Infrastructure.S3;
using System.IO;

namespace ADSDataDirect.Web.Controllers
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

            if (campaign == null)
            {
                TempData["Error"] = "Campaign not found.";
                return RedirectToAction("Index", "Campaigns");
            }

            Session["id"] = id;
            Session["OrderNumber"] = campaign.OrderNumber;

            if (campaign.Testing == null)
            {
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
                       .Include(x => x.Testing)
                       .FirstOrDefault(x => x.Id == campaign.Id);
                }
                campaign.Assets.ZipCodeUrl = $"http://www.digitaldynamixs.net/ep2/{campaign.OrderNumber}/{campaign.OrderNumber}zip.csv";
                campaign.Assets.CreativeUrl =$"http://www.digitaldynamixs.net/ep2/{campaign.OrderNumber}/{campaign.OrderNumber}.html";

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
                    BannerUrl = campaign.BannerUrl,
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

            // Only update status when not in monitoring
            if(campaign.Status < (int)CampaignStatus.Monitoring)
            {
                campaign.Status = (int)CampaignStatus.Testing;
                Db.SaveChanges();
            }
            return RedirectToAction("EditTesting", "Testing", new { id = campaign.TestingId });
        }

        // GET: Copy/Edit/5
        static char _c1;
        public ActionResult EditTesting(Guid? id)
        {
            var campaignTesting = Db.CampaignsTesting.FirstOrDefault(c => c.Id == id);

            if (campaignTesting == null)
            {
                throw new HttpException(404, "Not found");
            }
            
            TinyMapper.Bind<CampaignTesting, CampaignTestingVm>(config =>
            {
                config.Ignore(x => x.ChannelTypes);
            });

            var campaignTestingVm = TinyMapper.Map<CampaignTestingVm>(campaignTesting);
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
            _c1 = 'A';
            foreach (var segment in campaign.Segments.OrderBy(x => x.SegmentNumber))
            {
                var segmentVm = TinyMapper.Map<CampaignSegmentVm>(segment);
                if (segmentVm.SegmentNumber.EndsWith("A")) // Multi-A, all same as of Main Order
                {
                    segmentVm.SubjectLine = campaignTestingVm.SubjectLine;
                    segmentVm.FromLine = campaignTestingVm.FromLine;
                    segmentVm.WhiteLabel = campaignTestingVm.WhiteLabel;
                    segmentVm.Quantity = campaignTestingVm.Quantity;
                    segmentVm.DeploymentDate = campaignTestingVm.DeployDate;
                    segmentVm.CreativeFiles = campaignTestingVm.Assets.CreativeFiles;
                }
                campaignTestingVm.Segments.Add(segmentVm);
                _c1 = segment.SegmentNumber.Replace(campaignTestingVm.OrderNumber, string.Empty).ToCharArray().Select(x => ++x).FirstOrDefault();
            }

            campaignTestingVm.OpenModelLinksFile = campaign.Assets.OpenModelLinksFile;
            campaignTestingVm.OpenModelImageFile = campaign.Assets.OpenModelImageFile;
            campaignTestingVm.SFDClientId = campaign.Assets.SFDClientId.ToString();
            campaignTestingVm.ChannelTypes = string.IsNullOrEmpty(campaignTesting.ChannelTypes) ? new List<ChannelType> { } :
                campaignTesting.ChannelTypes
                    .Split(",".ToCharArray())
                    .Select(x => (ChannelType)System.Enum.Parse(typeof(ChannelType),x)).ToList();

            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgency)), "Value",
                "Text", campaignTestingVm.TestingUrgency);
            ViewBag.WhiteLabel = new SelectList(CustomersWithWLList, "Value", "Text", campaignTestingVm.WhiteLabel);
            ViewBag.SfidClientCampaigns = new SelectList(SfidClientCampaigns, "Value", "Text", campaignTestingVm.SFDClientId);
            ViewBag.StateList = States;//new MultiSelectList(States, "Value", "Text", campaignTestingVm.EzStates);
            ViewBag.DmaList = new SelectList(DmaLookup.US.Select(
                             x => new SelectListItem()
                             {
                                 Text = x.code + " - " + x.area,
                                 Value = x.code
                             }).ToList(), "Value", "Text", campaignTestingVm.EzDMAs);

            string view = IsNxs ? "EditTestingNXS" : "EditTesting";
            return View(view, campaignTestingVm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButton(Name = "action", Argument = "EditTesting")]
        public ActionResult EditTesting([Bind(Include =
                     "Assets,Segments,Id,CampaignId,OrderNumber,CampaignName,WhiteLabel,ReBroadCast,ReBroadcastDate,FromLine,SubjectLine,HtmlImageFiles,CreativeURL,TestSeedList,FinalSeedList,IsTested,TestingTime,TestingUrgency,DeployDate,ZipCodeFile,ZipURL,GeoDetails,Demographics,Quantity,SpecialInstructions,CreatedAt,CreatedBy,IsOpenPixel,OpenPixelUrl,BannerUrl,OpenGoals,ClickGoals,DataFileQuantity,DataFileUrl,DateFetched,IsOmniOrder,OmniDeployDate,Impressions,ChannelTypes,PaceDays,IsDynamicCoding,DynamicCodingFile,OpenModelLinksFile,OpenModelLinksCount,OpenModelImageFile,SFDClientId,ClickMeterGroupId,ClickMeterRotatorLinkId,ClickMeterRotatorLink,EzStates,EzDMAs,EzLinksFile"
             )]CampaignTestingVm campaignTestingVm)
        {
            if (ModelState.IsValid)
            {
                // Updatin Testing
                TinyMapper.Bind<CampaignTestingVm, CampaignTesting>(config =>
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
                campaignAssets.OpenModelLinksFile = campaignTestingVm.OpenModelLinksFile;
                campaignAssets.OpenModelImageFile = campaignTestingVm.OpenModelImageFile;
                if(!string.IsNullOrEmpty(campaignTestingVm.SFDClientId))
                {
                    campaignAssets.SFDClientId = int.Parse(campaignTestingVm.SFDClientId);
                }
                if (!string.IsNullOrEmpty(campaignAssets.OpenModelLinksFile) && campaignAssets.OpenModelLinksCount == 0)
                {
                    string filePath = Path.Combine(UploadPath, campaignAssets.OpenModelLinksFile);
                    S3FileManager.Download(campaignAssets.OpenModelLinksFile, filePath);
                    List<string> links = CsvReader.ReadCsv(filePath);
                    campaignAssets.OpenModelLinksCount = links.Count;
                }
                Db.Entry(campaignAssets).State = EntityState.Modified;
                Db.SaveChanges();

                // Updating Segments
                if (campaignTestingVm.Segments != null)
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
                return RedirectToAction("EditTesting", "Testing", new { id = campaignTestingVm.Id });
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
            ViewBag.WhiteLabel = new SelectList(CustomersWithWLList, "Value", "Text", campaignTestingVm.WhiteLabel);
            ViewBag.SfidClientCampaigns = new SelectList(SfidClientCampaigns, "Value", "Text", campaignTestingVm.SFDClientId);
            ViewBag.StateList = new SelectList(States, "Value", "Text", campaignTestingVm.EzStates);
            ViewBag.DmaList = new SelectList(DmaLookup.US.Select(
                             x => new SelectListItem()
                             {
                                 Text = x.code + " - " + x.area,
                                 Value = x.code
                             }).ToList(), "Value", "Text", campaignTestingVm.EzDMAs);

            string view = IsNxs ? "EditTestingNXS" : "EditTesting";
            return View(view, campaignTestingVm);
        }

        public ActionResult NewSegment(string orderNumber)
        {
            Campaign campaign = Db.Campaigns
                  .Include(x => x.Assets).Include(x => x.Testing)
                  .FirstOrDefault(x => x.OrderNumber == orderNumber);

            var segment = new CampaignSegment()
            {
                Id = Guid.NewGuid(),
                CreatedAt = DateTime.Now,
                SegmentNumber = orderNumber + _c1,
            };
            if (_c1 == 'A')
            {
                segment.SubjectLine = campaign.Testing.SubjectLine;
                segment.FromLine = campaign.Testing.FromLine;
                segment.WhiteLabel = campaign.Testing.WhiteLabel;
                segment.Quantity = campaign.Testing.Quantity;
                segment.DeploymentDate = campaign.Testing.DeployDate;
                segment.CreativeFiles = campaign.Assets.CreativeFiles;
            }
            _c1++;
            ViewBag.WhiteLabel = new SelectList(CustomersWithWLList, "Value", "Text", campaign.Testing.WhiteLabel);
            return PartialView("~/Views/Shared/Editors/_NewSegment.cshtml", segment);
        }

        public ActionResult DeleteSegment(Guid? id)
        {
            try
            {
                var segment = Db.CampaignSegments.FirstOrDefault(x => x.Id == id);
                Db.CampaignSegments.Remove(segment);
                Db.SaveChanges();
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult ApproveSegment(Guid? id)
        {
            try
            {
                var segment = Db.CampaignSegments.FirstOrDefault(x => x.Id == id);
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
        public ActionResult Approve(CampaignTestingVm campaignTestingVm)
        {
            if (ModelState.IsValid)
            {
                if (Session["id"] == null)
                    Session["id"] = campaignTestingVm.CampaignId;

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
        public ActionResult ProcessFiles([Bind(Include = "Id,CampaignId,OrderNumber")] CampaignTestingVm campaignTestingVm)
        {
            var campaign = Db.Campaigns.FirstOrDefault(x => x.Id == campaignTestingVm.CampaignId);
            BackgroundJob.Enqueue(() => FileProcessor.ProcessAssetUpdateUrls(UploadPath, campaign.OrderNumber));

            TempData["Success"] = "File Processing has been started succesfully.";
            return RedirectToAction("EditTesting", new { id = campaignTestingVm.Id });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButton(Name = "action", Argument = "FetchProcessDataFiles")]
        public ActionResult FetchProcessDataFiles([Bind(Include = "Id,CampaignId,OrderNumber")] CampaignTestingVm campaignTestingVm)
        {
            try
            {
                var campaign = Db.Campaigns
                    .Include(x => x.Assets)
                    .Include(x => x.Segments)
                    .Include(x => x.Testing)
                    .FirstOrDefault(x => x.Id == campaignTestingVm.CampaignId);

                if (string.IsNullOrEmpty(campaign.Assets.ZipCodeFile))
                    throw new AdsException("ZipCodeFile is not provided, Please upload one.");

                if (campaign.Segments.Count == 0)
                    throw new AdsException("There are no Multi data segments.");

                if (campaign.Testing.DataFileQuantity == 0)
                    throw new AdsException("DataFileQuantity is Zero.");

                BackgroundJob.Enqueue(() => DataFileProcessor.FetchSqlDataFile(UploadPath, IsNxs, campaign.Id, campaign.OrderNumber, campaign.Assets.ZipCodeFile, campaign.Testing.DataFileQuantity));

                TempData["Success"] = "SQL Data is being fetched and processed, please wait about 5m ...";
            }
            catch (Exception ex)
            {
                TempData["Error"] = ex.Message;
            }
            return RedirectToAction("EditTesting", new { id = campaignTestingVm.Id });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButton(Name = "action", Argument = "ProcessDynamicCoding")]
        public ActionResult ProcessDynamicCoding([Bind(Include = "Id,CampaignId,OrderNumber")] CampaignTestingVm campaignTestingVm)
        {
            var campaignTesting = Db.CampaignsTesting.FirstOrDefault(x => x.CampaignId == campaignTestingVm.CampaignId);

            try
            {
                if (string.IsNullOrEmpty(campaignTesting.DataFileUrl))
                    throw new Exception("Please process Data Files first.");

                DynamicCodingHelper.ProcessInput(Db, UploadPath, campaignTesting.DataFileUrl, campaignTesting.DynamicCodingFile, 
                                                campaignTesting.CampaignId, campaignTestingVm.OrderNumber);
                
                TempData["Success"] = "Dynamic Coding File has been processed succesfully.";
            }
            catch (Exception ex)
            {
                TempData["Error"] = ex.Message;
            }
            return RedirectToAction("EditTesting", new { id = campaignTestingVm.Id });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [MultipleButton(Name = "action", Argument = "ProcessClickMeterLinks")]
        public ActionResult ProcessClickMeterLinks([Bind(Include = "Id,CampaignId,OrderNumber,CampaignName,EzLinksFile")] CampaignTestingVm campaignTestingVm)
        {
            var campaignTesting = Db.CampaignsTesting.FirstOrDefault(c => c.Id == campaignTestingVm.Id);

            if (campaignTesting == null)
            {
                throw new HttpException(404, "Not found");
            }

            if (string.IsNullOrEmpty(campaignTestingVm.EzLinksFile))
            {
                TempData["Error"] = "Please upload EzLinksFile.";
                return RedirectToAction("EditTesting", new { id = campaignTestingVm.Id });
            }
            // Process LinksFile & Post links to Click Meter
            try
            {
                var result = ClickMeterManager.ProcessLinksFile(UploadPath, campaignTestingVm.OrderNumber, campaignTestingVm.CampaignName, campaignTestingVm.EzLinksFile);

                if (result == null || string.IsNullOrEmpty(result.trackingCode))
                {
                    throw new AdsException("Processing result is empty.");
                }

                campaignTesting.ClickMeterGroupId = result.groupId.ToString();
                campaignTesting.ClickMeterRotatorLinkId = result.id.ToString();
                campaignTesting.ClickMeterRotatorLink = result.trackingCode;
                Db.SaveChanges();
            }
            catch (Exception ex)
            {
                TempData["Error"] = "ClickMeter Issue : " + ex.Message;
                return RedirectToAction("EditTesting", new { id = campaignTestingVm.Id });
            }
            
            TempData["Success"] = "Click Meter Rotator Link has been generated successfully.";
            return RedirectToAction("EditTesting", new { id = campaignTestingVm.Id });
        }
    }
}