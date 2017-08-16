using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;

namespace WFP.ICT.Web.Controllers
{
    [Authorize]
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
                .Include(c => c.Segments)
                .FirstOrDefault(c => c.Id == id);

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
                            //DataFileUrl = string.Format("http://www.digitaldynamixs.net/ep2/{0}/{0}data.csv", campaign.OrderNumber),

                            IsOmniOrder = campaign.IsOmniOrder,
                            OmniDeployDate = campaign.OmniDeployDate,
                            Impressions = campaign.Impressions,
                            ChannelTypes = campaign.ChannelTypes,

                        };

                        //char c1 = 'A';
                        //for (int i=0;i<campaign.DataFileSegments;i++)
                        //{
                        //    testing.Segments.Add(new CampaignSegment()
                        //    {
                        //        Id = Guid.NewGuid(),
                        //        CreatedAt = DateTime.Now,
                        //        CampaignId = campaign.Id,
                        //        SegmentNumber = campaign.OrderNumber + c1,
                        //        FirstRangeStart = 1,
                        //        FirstRangeEnd = 600,
                        //        SecondRangeStart = 0,
                        //        SecondRangeEnd = 0,
                        //        ThirdRangeStart = 0,
                        //        ThirdRangeEnd = 0,
                        //        BroadcastDate = campaign.BroadcastDate,
                        //        SubjectLine = campaign.SubjectLine,
                        //        HtmlImageFiles = campaign.Assets.CreativeFiles
                        //    });
                        //    c1++;
                        //}

                        db.CampaignsTesting.Add(testing);
                        db.SaveChanges();

                        campaign.TestingId = testingId;
                        db.SaveChanges();
                    }
                    campaign.Status = (int) CampaignStatusEnum.Testing;
                    db.SaveChanges();
                    return RedirectToAction("EditTesting", "Testing", new {id = campaign.TestingId});
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
                            DataFileUrl = testing.DataFileUrl,

                            IsOmniOrder = testing.IsOmniOrder,
                            OmniDeployDate = testing.OmniDeployDate,
                            Impressions = testing.Impressions,
                            ChannelTypes = testing.ChannelTypes,
                        };
                        db.CampaignsApproved.Add(approved);
                        db.SaveChanges();
                        campaign.ApprovedId = approvedId;
                        db.SaveChanges();
                    }
                    campaign.Status = (int) CampaignStatusEnum.Approved;
                    db.SaveChanges();
                    return RedirectToAction("EditApproved", "Approved", new {id = campaign.ApprovedId});
                    break;
                case "Tracking":
                    return RedirectToAction("ViewReport", "Tracking", new {id = campaign.Id});
                case "Clone":
                    return RedirectToAction("Clone", "Campaigns", new { id = campaign.Id });
                case "Rebroad":
                    return RedirectToAction("Rebroad", "Campaigns", new { id = campaign.Id });
                case "Cancel":
                    return RedirectToAction("Cancel", "Campaigns", new { id = campaign.Id });
                case "Complete":
                    return RedirectToAction("Complete", "Campaigns", new { id = campaign.Id });
            }

            return null;
        }

    }
}

