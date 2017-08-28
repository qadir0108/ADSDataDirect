using System;
using System.Data.Entity;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Results;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.API
{
    public class AdsController : ApiController
    {
        private readonly string AuthenticationParameterName = "X-ADS-Auth";
        private readonly int APIMaxDailyLimit = 30;

        private WfpictContext db = new WfpictContext();

        // GET: api/ads
        //[Authorize]
        public JsonResult<JsonResponse> Get()
        {
            try
            {
                if (!Request.Headers.Contains(AuthenticationParameterName))
                {
                    throw new ArgumentException("Authentication API Key is missing");
                }

                string token = Request.Headers.GetValues(AuthenticationParameterName).First();

                var user = db.Users.FirstOrDefault(x => x.ApiKey.Equals(token));
                var isValidUser = user != null;
                if (!isValidUser)
                {
                    throw new ArgumentException("Invalid Authentication API Key");
                }

                int todaysRequests =
                    db.ApiRequests.ToList().Count(x => x.APIKey == token && x.CreatedAt.Date == DateTime.Now.Date);
                if (todaysRequests > APIMaxDailyLimit)
                {
                    throw new ArgumentException("API Daily Max limit " + APIMaxDailyLimit +
                                        " reached. Please try again tomarrow.");
                }

                db.ApiRequests.Add(new ApiRequest()
                {
                    Id = Guid.NewGuid(),
                    CreatedAt = DateTime.Now,
                    APIKey = token
                });
                db.SaveChanges();

                var campaigns = db.Campaigns
                    .Include(x => x.ProDatas)
                    .Include(x => x.Testing)
                    .Include(x => x.Approved)
                    .Where(x => x.AssignedToCustomer == user.Id && x.Status == (int)CampaignStatus.Completed)
                    .ToList()
                    .Select(x => Campaign.FromCampaign(x));

                return Json(new JsonResponse() {IsSucess = true, Result = campaigns});
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() {IsSucess = false, ErrorMessage = ex.Message});
            }
        }

        // POST: api/ads
        public JsonResult<JsonResponse> Post([FromBody] Campaign campagin)
        {
            try
            {
                if (!Request.Headers.Contains(AuthenticationParameterName))
                {
                    throw new ArgumentException("Authentication API Key is missing");
                }
                if (string.IsNullOrEmpty(campagin.OrderNumber))
                {
                    throw new ArgumentException("OrderNumber is missing");
                }
                if (string.IsNullOrEmpty(campagin.IoNumber))
                {
                    throw new ArgumentException("IONumber is missing");
                }

                string token = Request.Headers.GetValues(AuthenticationParameterName).First();

                var user = db.Users.FirstOrDefault(x => x.ApiKey.Equals(token));
                var isValidUser = user != null;
                if (!isValidUser)
                {
                    throw new ArgumentException("Invalid Authentication API Key");
                }

                db.ApiRequests.Add(new ApiRequest()
                {
                    Id = Guid.NewGuid(),
                    CreatedAt = DateTime.Now,
                    APIKey = token
                });
                db.SaveChanges();

                var campaignTracking = db.CampaignTrackings
                                .FirstOrDefault(x => x.SegmentNumber == campagin.OrderNumber.Trim());

                if (campaignTracking == null)
                {
                    throw new ArgumentException("Campaign with Order Number " + campagin.OrderNumber + " does not exists");
                }

                campaignTracking.IoNumber = campagin.IoNumber.Trim();
                db.SaveChanges();

                string message = "Campaign with Order Number " + campagin.OrderNumber +
                                 " has been updated with IO Number " + campagin.IoNumber;

                return Json(new JsonResponse() { IsSucess = true, Result = message });
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message });
            }
        }
        
    }
}
