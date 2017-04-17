﻿using System;
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

namespace WFP.ICT.Web.Controllers
{
    [Authorize]
    public class CopyController : Controller
    {
        private WFPICTContext db = new WFPICTContext();
        int pageSize = 10;

        // GET: Campaigns
        public ActionResult Index(int? page, string searchString, Guid? id, string from)
        {
            var campagins = db.Campaigns
                .Where(x => x.ParentId != null)
                .OrderBy(x => x.CreatedAt)
                .ToList();

            Guid idLocal = Guid.Empty;
            if (!string.IsNullOrEmpty(searchString))
            {
                campagins = campagins.Where(x => x.OrderNumber == searchString).ToList();
            }
            else if (Session["id"] != null)
            {
                idLocal = Guid.Parse(Session["id"] as string);
            }
            else if (id.HasValue)
            {
                Session["id"] = id.Value.ToString();
                idLocal = id.Value;
            }

            if (idLocal != Guid.Empty)
                campagins = campagins.Where(x => x.Id == idLocal).ToList();

            // Paging
            int pageNumber = (page ?? 1);

            if(!string.IsNullOrEmpty(from))
                Session["from"] = from;

            switch (Session["from"] as string)
            {
                case "Testing":
                    return View("Testing", campagins.ToPagedList(pageNumber, pageSize));
                    break;
                case "Approved":
                    return View("Approved", campagins.ToPagedList(pageNumber, pageSize));
                    break;
                case "Tracking":
                    return View("Tracking", campagins.ToPagedList(pageNumber, pageSize));
                    break;
                case "ReBroadcast":
                    return View("ReBroadcast", campagins.ToPagedList(pageNumber, pageSize));
                    break;
            }
            return View("Error");
        }

        public ActionResult SendToVendor(Guid? Id)
        {
            try
            {
                Campaign campaign = db.Campaigns.FirstOrDefault(x => x.Id == Id);
                Campaign parentCampaign = db.Campaigns.FirstOrDefault(x => x.Id == campaign.ParentId);
                if (campaign == null)
                {
                    return HttpNotFound();
                }

                var vendor = db.Vendors.FirstOrDefault();
                new Thread(() =>
                {
                    EmailHelper.SendApprovedToVendor(vendor, campaign);
                }).Start();

                parentCampaign.Status = (int)CampaignStatusEnum.Tracking;
                campaign.Status = (int)CampaignStatusEnum.Tracking;
                campaign.ReportSiteLink = string.Format("http://report-site.com/c/ADS{0}", campaign.OrderNumber);
                db.SaveChanges();
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }

        }

        // GET: Copy/Edit/5
        public ActionResult Edit(Guid? id, string from)
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
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgencyEnum)), "Value", "Text", campaign.TestingUrgency);
            return View(campaign);
        }

        // POST: Copy/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,ParentId,Status,CampaignName,BroadcastDate,RepresentativeName,RepresentativeEmail,ReBroadCast,ReBroadcastDate,Price,TestingUrgency,ZipCodeFile,GeoDetails,Demographics,Quantity,FromLine,SubjectLine,HtmlImageFiles,TestSeedList,FinalSeedList,SuppressionFile,IsPersonalization,IsMatchback,IsSuppression,WhiteLabel,OptOut,SpecialInstructions,ReferenceNumber,OrderNumber,ParentOrderNumber,AssignedToCustomer,IsTested,TestingTime,DeployDateTime,CreativeURL,ZipURL,LinkBreakout,ReportSiteLink,IONumber,CreatedAt,CreatedBy,ReBroadcastOrderNumber,ReBroadQuantity")] Campaign campaign)
        {
            if (ModelState.IsValid)
            {
                db.Entry(campaign).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", new {id = campaign.Id});
            }
            ViewBag.TestingUrgency = new SelectList(EnumHelper.GetEnumTextValues(typeof(TestingUrgencyEnum)), "Value", "Text", campaign.TestingUrgency);
            return View(campaign);
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
