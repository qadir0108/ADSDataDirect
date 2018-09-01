using System;
using System.Collections.Generic;

using System.Globalization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace ADSDataDirect.Infrastructure.HasOffers.Campaigns
{
        public partial class GetCampaignsListResponse
        {
            [JsonProperty("data")]
            public List<Datum> Data { get; set; }

            [JsonProperty("errors")]
            public object Errors { get; set; }

            [JsonProperty("success")]
            public bool Success { get; set; }
        }

        public partial class Datum
        {
            [JsonProperty("id")]
            public long Id { get; set; }

            [JsonProperty("advertiser_id")]
            public long AdvertiserId { get; set; }

            [JsonProperty("name")]
            public string Name { get; set; }

            [JsonProperty("end_date")]
            public DateTimeOffset EndDate { get; set; }

            [JsonProperty("payout_type")]
            public string PayoutType { get; set; }

            [JsonProperty("revenue_type")]
            public string RevenueType { get; set; }

            [JsonProperty("status")]
            public string Status { get; set; }

            [JsonProperty("country_region_targeting")]
            public CountryRegionTargeting CountryRegionTargeting { get; set; }

            [JsonProperty("advanced_targeting")]
            public List<object> AdvancedTargeting { get; set; }
        }

        public partial class CountryRegionTargeting
        {
            [JsonProperty("ru")]
            public List<string> Ru { get; set; }
        }

        public partial class GetCampaignsListResponse
        {
            public static GetCampaignsListResponse FromJson(string json) => JsonConvert.DeserializeObject<GetCampaignsListResponse>(json, Converter.Settings);
        }

        public static class Serialize
        {
            public static string ToJson(this GetCampaignsListResponse self) => JsonConvert.SerializeObject(self, Converter.Settings);
        }

        internal static class Converter
        {
            public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
            {
                MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
                DateParseHandling = DateParseHandling.None,
                Converters = {
                new IsoDateTimeConverter { DateTimeStyles = DateTimeStyles.AssumeUniversal }
            },
            };
        }
    }
