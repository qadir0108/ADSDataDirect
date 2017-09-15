using System;
using System.Data.Entity;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Results;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.Helpers;
using ADSDataDirect.Web.Models;

namespace ADSDataDirect.Web.API
{
    public class AdsController : ApiController
    {
        private readonly string _authenticationParameterName = "X-ADS-Auth";
        private readonly int _apiMaxDailyLimit = 30;

        private readonly WfpictContext _db = new WfpictContext();

        // GET: api/ads
        //[Authorize]
        public JsonResult<JsonResponse> Get()
        {
            try
            {
                if (!Request.Headers.Contains(_authenticationParameterName))
                {
                    throw new AdsException("Authentication API Key is missing");
                }

                string token = Request.Headers.GetValues(_authenticationParameterName).First();

                var user = _db.Users.FirstOrDefault(x => x.ApiKey.Equals(token));
                var isValidUser = user != null;
                if (!isValidUser)
                {
                    throw new AdsException("Invalid Authentication API Key");
                }

                int todaysRequests = _db.ApiRequests.Count(x => x.ApiKey == token && x.CreatedAt.Date == DateTime.Now.Date);
                if (todaysRequests > _apiMaxDailyLimit)
                {
                    throw new AdsException("API Daily Max limit " + _apiMaxDailyLimit +
                                        " reached. Please try again tomarrow.");
                }

                _db.ApiRequests.Add(new ApiRequest()
                {
                    Id = Guid.NewGuid(),
                    CreatedAt = DateTime.Now,
                    ApiKey = token
                });
                _db.SaveChanges();

                var campaigns = _db.Campaigns
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
                if (!Request.Headers.Contains(_authenticationParameterName))
                {
                    throw new AdsException("Authentication API Key is missing");
                }
                if (string.IsNullOrEmpty(campagin.OrderNumber))
                {
                    throw new AdsException("OrderNumber is missing");
                }
                if (string.IsNullOrEmpty(campagin.IoNumber))
                {
                    throw new AdsException("IONumber is missing");
                }

                string token = Request.Headers.GetValues(_authenticationParameterName).First();

                var user = _db.Users.FirstOrDefault(x => x.ApiKey.Equals(token));
                var isValidUser = user != null;
                if (!isValidUser)
                {
                    throw new AdsException("Invalid Authentication API Key");
                }

                _db.ApiRequests.Add(new ApiRequest()
                {
                    Id = Guid.NewGuid(),
                    CreatedAt = DateTime.Now,
                    ApiKey = token
                });
                _db.SaveChanges();

                var campaignTracking = _db.CampaignTrackings
                                .FirstOrDefault(x => x.SegmentNumber == campagin.OrderNumber.Trim());

                if (campaignTracking == null)
                {
                    throw new AdsException("Campaign with Order Number " + campagin.OrderNumber + " does not exists");
                }

                campaignTracking.IoNumber = campagin.IoNumber.Trim();
                _db.SaveChanges();

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
