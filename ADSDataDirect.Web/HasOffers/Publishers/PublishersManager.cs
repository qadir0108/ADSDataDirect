using ADSDataDirect.Web.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Web;

namespace ADSDataDirect.Web.HasOffers.Publishers
{
    public class PublishersManager : HasOffersManager
    {
        public GetPublishersListResponse List()
        {
            using (HttpClient client = new HttpClient())
            {
                client.Timeout = TimeSpan.FromMinutes(1);
                string requestUri = $"{baseURL}/affiliate/list?token={token}&limit=10&offset=10";
                using (HttpResponseMessage response = client.GetAsync(requestUri).Result)
                using (HttpContent content = response.Content)
                {
                    string responseContent = content.ReadAsStringAsync().Result;
                    GetPublishersListResponse getAdvertisersListResponse;
                    try
                    {
                        getAdvertisersListResponse = GetPublishersListResponse.FromJson(responseContent);
                    }
                    catch (Exception ex)
                    {
                        throw new AdsException("There is error in parsing data from HasOffers. Problem in HasOffers API.");
                    }
                    return getAdvertisersListResponse;
                }
            }
        }

        public GetPublishersListResponse Create()
        {
            return null;
            //using (HttpClient client = new HttpClient())
            //{
            //    client.Timeout = TimeSpan.FromMinutes(1);
            //    //client.DefaultRequestHeaders.Add("X-ProDataFeed-Auth", _prodataAuth);
            //    var httpContent = new StringContent(request.ToJson(), Encoding.UTF8, "application/json");
            //    using (HttpResponseMessage response = client.PostAsync(_urlCreateOrder, httpContent).Result)
            //    using (HttpContent content = response.Content)
            //    {
            //        string responseContent = content.ReadAsStringAsync().Result;
            //        ProDataResponse proDataResponse;
            //        try
            //        {
            //            proDataResponse = JsonConvert.DeserializeObject<ProDataResponse>(responseContent);
            //            proDataResponse.RequestMessage = request.ToString();
            //        }
            //        catch (Exception ex)
            //        {
            //            throw new AdsException("There is error in parsing data from ProData. Problem in ProData API.");
            //        }
            //        return proDataResponse;
            //    }
            //}
        }
    }
}