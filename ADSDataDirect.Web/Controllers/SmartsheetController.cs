﻿using System;
using System.Web.Mvc;
using ADSDataDirect.Web.Models;
using System.Collections.Generic;
using ADSDataDirect.Infrastructure.Smartsheet;

namespace ADSDataDirect.Web.Controllers
{
    [Authorize]
    public class SmartsheetController : BaseController
    {
        public ActionResult Index()
        {
            var mgr = new SmartsheetManager(Db);
            List<string> data = mgr.GetSheetNames();
            return View(data);
        }

        public ActionResult Import(string sheetName)
        {
            var mgr = new SmartsheetManager(Db);
            int count = 0;
            try
            {
                mgr.LoadSheetMaps();
                var campaigns = mgr.Read(sheetName);
                foreach (var campaign in campaigns)
                {
                    try
                    {
                        Db.Campaigns.Add(campaign);
                        Db.SaveChanges();

                        // Create Testing Record
                        // Create Segment A Record
                        // Process and Upload Data Files
                        // Update Data File URL to Smartsheet
                        bool isUpdated = mgr.Update(sheetName, campaign.Price, campaign.OrderNumber);
                        if (isUpdated)
                            count++;
                    }
                    catch (Exception ex)
                    {
                        // Pi Ja
                    }
                }
                return Json(new JsonResponse() { IsSucess = true, Result = $"Smartsheet ({sheetName}) - {count} orders has been imported to NXS sucessfully." }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}