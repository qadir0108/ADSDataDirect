using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace ADSDataDirect.Infrastructure.EZanga
{
    public class EZangaManager
    {
        private static string urlBase = $"https://adpad-api.ezanga.com";
        private static string urlCampaignCreate = $"/groups";
        private static string urlLinkCreate = "/groups/{0}/datapoints";
        private static string apiKeyHeader = $"X-Clickmeter-Authkey";
        private static string userName = $"jsilver@nextstepdigitaladvertising.com";
        private static string apiKey = $"94006e26114d9479a9328c19f7c87f9c";

        public static long CreateCampaign(EZangaCampaign campaign)
        {
            string url = urlBase + urlCampaignCreate;
            string data = campaign.ToJson();
            try
            {
                string responseContent = Post(url, data);
                var response = JsonConvert.DeserializeObject<EZangaCampaign>(responseContent);
                return response.id;
            }
            catch (Exception ex)
            {
                return -1;
            }
        }

        private string Get(string url)
        {
            using (HttpClient client = new HttpClient())
            {
                client.Timeout = TimeSpan.FromMinutes(1);
                client.DefaultRequestHeaders.Add(apiKeyHeader, apiKey);
                using (HttpResponseMessage response = client.GetAsync(url).Result)
                using (HttpContent content = response.Content)
                {
                    string responseContent = content.ReadAsStringAsync().Result;
                    return responseContent;
                }
            }
        }

        private static string Post(string url, string data)
        {
            using (HttpClient client = new HttpClient())
            {
                client.Timeout = TimeSpan.FromMinutes(1);
                client.DefaultRequestHeaders.Add(apiKeyHeader, apiKey);
                var httpContent = new StringContent(data, Encoding.UTF8, "application/json");
                using (HttpResponseMessage response = client.PostAsync(url, httpContent).Result)
                using (HttpContent content = response.Content)
                {
                    string responseContent = content.ReadAsStringAsync().Result;
                    return responseContent;
                }
            }
        }
    }
}
