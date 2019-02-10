using ADSDataDirect.Infrastructure.Common;
using ADSDataDirect.Infrastructure.S3;
using Newtonsoft.Json;
using System;
using System.Linq;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Text;
using System.Web.Mvc;
using System.Web;

namespace ADSDataDirect.Infrastructure.ClickMeter
{
    public static class ClickMeterManager
    {
        private static string apiKeyHeader = $"X-Clickmeter-Authkey";
        private static string apiKey = $"8EA0BB5B-3EC2-4987-8C4B-F18732E521D9";

        private static string urlBase = $"http://apiv2.clickmeter.com";

        /// https://support.clickmeter.com/hc/en-us/articles/211037146
        private static string urlCampaignsCreate = $"/groups";
        private static string urlCampaignsSearch = "/groups?textSearch={0}";
        private static string urlCampaignDelete = "/groups/{0}";
        private static string urlRotatorLinkCreate = "/groups/{0}/datapoints";

        /// https://support.clickmeter.com/hc/en-us/articles/211037246
        private static string urlDatapointHits = "/hits?datapoint={0}&timeframe=last180";

        /// https://support.clickmeter.com/hc/en-us/articles/211037226
        private static string urlDatapointReports = "/reports?datapoint={0}&type=destinations&timeframe=last180";

        private const int redirectType = 307;
        private const int domainIdHttpslink = 3697;
        private static readonly string domainBaseLink = $"https://httpslink.com/";
        private const int destinationModeWeighted = 9;

        public static List<SelectListItem> GetZipCodes(string uploadPath, string zipCodeFile)
        {
            string zipFilePath = Path.Combine(uploadPath, zipCodeFile);
            S3FileManager.Download(zipCodeFile, zipFilePath);
            var zipCodes = new List<SelectListItem>();
            foreach (var line in System.IO.File.ReadAllLines(zipFilePath))
            {
                var trimmed = StringHelper.Trim(line);
                if (string.IsNullOrEmpty(trimmed)) continue;
                zipCodes.Add(new SelectListItem() { Text = trimmed, Value = trimmed });
            }
            return zipCodes;
        }

        public static ClickMeterLink ProcessLinksFile(string uploadPath, string orderNumber, string campaignName, string ezLinksFile)
        {
            string linkName = $"{orderNumber}links";
            var linksWeights = new List<DestinationItem>();

            try
            {
                string ezLinksFilePath = Path.Combine(uploadPath, ezLinksFile);
                S3FileManager.Download(ezLinksFile, ezLinksFilePath);
                foreach (var line in System.IO.File.ReadAllLines(ezLinksFilePath))
                {
                    if (string.IsNullOrEmpty(line)) continue;
                    var links = line.Split(",".ToCharArray());
                    if (links.Length != 2) continue;
                    int w8 = 0;
                    int.TryParse(links[1], out w8);
                    var lw = new DestinationItem() { url = links[0], weight = w8 };
                    linksWeights.Add(lw);
                }
            }
            catch (Exception ex)
            {
                throw new AdsException("There is some issue in processing links file.");
            }

            int sum = linksWeights.Sum(x => x.weight);
            if (sum != 100) throw new AdsException("Click Meter Links wieght must sum upto 100. (" + sum + ")");

            return CreateCampaignWithRotatorLink(orderNumber, campaignName, linkName, linksWeights.ToArray());
        }

        public static ClickMeterLink CreateCampaignWithRotatorLink(string orderNumber, string campaignName, string linkName, DestinationItem[] linksWeights)
        {
            //string campaignName = "2500 Test Campaign";
            //string linkName = "2500TestCampaign";
            //var linksWeights = new DestinationItem[]
            //{
            //     new DestinationItem() { weight=50, url = $"https://lifeinthepinesco.com/?utm_content=header/?utm_source=Strategus&utm_medium=DigitalDirectMail&utm_campaign=AllBuilders_101818EB" },
            //     new DestinationItem() { weight=32, url = $"https://lifeinthepinesco.com/home-builders/?utm_content=calatlantic-logo/" },
            //     new DestinationItem() { weight=18, url = $"https://lifeinthepinesco.com/?utm_content=header/?utm_source=Strategus&utm_medium=DigitalDirectMail&utm_campaign=AllBuilders_101818EB" },
            //};

            // Step 1:
            var groupId = CreateCampaign(new ClickMeterCampaign() { name = $"{orderNumber} {campaignName}", notes = "Created through API" });

            // Step 2:
            try
            {
                var rotatorLink = CreateRotatorLink(groupId, new ClickMeterLink()
                {
                    name = linkName,
                    title = $"Rotator {linkName}",
                    groupId = groupId,
                    groupName = campaignName,
                    typeTL = new TypeTL()
                    {
                        redirectType = redirectType,
                        domainId = domainIdHttpslink,
                        destinationMode = destinationModeWeighted,
                        weightedDestinationItems = linksWeights
                    }
                });
                rotatorLink.groupId = groupId;
                return rotatorLink;
            }
            catch (AdsException adsx)
            {
                throw new AdsException(adsx.Message);
            }
            catch (Exception ex)
            {
                DeleteCampaign(groupId);
                return null;
            }
        }

        public static ClickMeterLink CreateRotatorLink(long campaignId, ClickMeterLink link)
        {
            string url = string.Format(urlBase + urlRotatorLinkCreate, campaignId);
            string data = link.ToJson();
            string responseContent = Post(url, data);
            var response = JsonConvert.DeserializeObject<ClickMeterLink>(responseContent);
            response.trackingCode = domainBaseLink + link.name;
            return response;
        }

        public static long CreateCampaign(ClickMeterCampaign campaign)
        {
            long id = SearchCampaign(campaign.name);
            if (id != -1)
            {
                throw new AdsException(campaign.name + " with id = " + id + " already created");
            }

            string url = urlBase + urlCampaignsCreate;
            string data = campaign.ToJson();
            string responseContent = Post(url, data);
            var response = JsonConvert.DeserializeObject<ClickMeterCampaign>(responseContent);
            return response.id;
        }

        public static bool DeleteCampaign(long campaignId)
        {
            string url = string.Format(urlBase + urlCampaignDelete, campaignId);
            return Delete(url);
        }

        public static long SearchCampaign(string campaignName)
        {
            long id = -1;
            string url = string.Format(urlBase + urlCampaignsSearch, HttpUtility.UrlPathEncode(campaignName));
            string responseContent = Get(url);
            var response = JsonConvert.DeserializeObject<ClickMeterCampaignSearch>(responseContent);

            if (response.entities != null && response.entities.Count > 0)
                return response.entities.OrderBy(x => x.id).FirstOrDefault().id;

            return id;
        }

        // Destination URL wise clicks
        // http://apiv2.clickmeter.com:80/reports?type=destinations&timeframe=last180&datapoint=358427750
        /*
          "id": "https%3A%2F%2Fwww.ehrlichtoyota.com%2Fnew-cars-for-sale",
          "totalHits": 10,
          "uniqueHits": 10,
          "lastHitDate": "20181130171153"
        */
        public static ClickMeterReport GetDatapointReport(string campaignId)
        {
            string url = string.Format(urlBase + urlDatapointReports, campaignId);
            try
            {
                string responseContent = Get(url);
                var response = ClickMeterReport.FromJson(responseContent);
                return response;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static List<Hit> GetDatapointsHits(string campaignId)
        {
            List<Hit> hits = new List<Hit>();
            string url = string.Format(urlBase + urlDatapointHits, campaignId);
            try
            {
                string lastKey = "temp";
                do
                {
                    string responseContent = Get(url);
                    var response = ClickMeterHitResponse.FromJson(responseContent);
                    hits.AddRange(response.Hits);
                    lastKey = response.LastKey;
                    if(!string.IsNullOrEmpty(lastKey))
                    {
                        url = string.Format(urlBase + urlDatapointHits + "&offset=" + lastKey, campaignId);
                    }
                }
                while (!string.IsNullOrEmpty(lastKey));
            }
            catch (Exception ex)
            {
                return hits;
            }
            return hits;
        }

        private static string Get(string url)
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

        private static bool Delete(string url)
        {
            using (HttpClient client = new HttpClient())
            {
                client.Timeout = TimeSpan.FromMinutes(1);
                client.DefaultRequestHeaders.Add(apiKeyHeader, apiKey);
                using (HttpResponseMessage response = client.DeleteAsync(url).Result)
                {
                    return response.StatusCode == System.Net.HttpStatusCode.OK;
                }
            }
        }
    }
}
