﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Controllers
{
    public class adsController : ApiController
    {
        private readonly string AuthenticationParameterName = "X-ADS-Auth";
        private readonly int APIMaxDailyLimit = 30;

        private WFPICTContext db = new WFPICTContext();

        // GET: api/ads
        //[Authorize]
        public JsonResult<JsonResponse> Get()
        {
            try
            {
                if (!Request.Headers.Contains(AuthenticationParameterName))
                {
                    throw new Exception("Authentication API Key is missing");
                }

                string token = Request.Headers.GetValues(AuthenticationParameterName).First();

                var user = db.Users.FirstOrDefault(x => x.APIKey.Equals(token));
                var isValidUser = user != null;
                if (!isValidUser)
                {
                    throw new Exception("Invalid Authentication API Key");
                }

                int todaysRequests =
                    db.ApiRequests.ToList().Count(x => x.APIKey == token && x.CreatedAt.Date == DateTime.Now.Date);
                if (todaysRequests > APIMaxDailyLimit)
                {
                    throw new Exception("API Daily Max limit " + APIMaxDailyLimit +
                                        " reached. Please try again tomarrow.");
                }

                db.ApiRequests.Add(new APIRequest()
                {
                    Id = Guid.NewGuid(),
                    CreatedAt = DateTime.Now,
                    APIKey = token
                });
                db.SaveChanges();

                var campaigns = db.Campaigns.Include("ProDatas").Include("Copy")
                    .Where(x => x.AssignedToCustomer == user.Id)
                    .ToList()
                    .Select(x => ADS.API.Models.Campaign.FromCampaign(x));

                return Json(new JsonResponse() {IsSucess = true, Result = campaigns});
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() {IsSucess = false, ErrorMessage = ex.Message});
            }
        }

        // POST: api/ads
        public JsonResult<JsonResponse> Post([FromBody] ADS.API.Models.Campaign campagin)
        {
            try
            {
                if (!Request.Headers.Contains(AuthenticationParameterName))
                {
                    throw new Exception("Authentication API Key is missing");
                }
                if (string.IsNullOrEmpty(campagin.OrderNumber))
                {
                    throw new Exception("OrderNumber is missing");
                }
                if (string.IsNullOrEmpty(campagin.IONumber))
                {
                    throw new Exception("IONumber is missing");
                }

                string token = Request.Headers.GetValues(AuthenticationParameterName).First();

                var user = db.Users.FirstOrDefault(x => x.APIKey.Equals(token));
                var isValidUser = user != null;
                if (!isValidUser)
                {
                    throw new Exception("Invalid Authentication API Key");
                }

                db.ApiRequests.Add(new APIRequest()
                {
                    Id = Guid.NewGuid(),
                    CreatedAt = DateTime.Now,
                    APIKey = token
                });
                db.SaveChanges();

                var campaignInDatabase = db.Campaigns
                                .FirstOrDefault(x => x.OrderNumber == campagin.OrderNumber.Trim());

                if (campaignInDatabase == null)
                {
                    throw new Exception("Campaign with Order Number " + campagin.OrderNumber + " does not exists");
                }

                campaignInDatabase.IONumber = campagin.IONumber.Trim();
                db.SaveChanges();

                string message = "Campaign with Order Number " + campagin.OrderNumber +
                                 " has been updated with IO Number " + campagin.IONumber;

                return Json(new JsonResponse() { IsSucess = true, Result = message });
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message });
            }
        }
        
    }
}
