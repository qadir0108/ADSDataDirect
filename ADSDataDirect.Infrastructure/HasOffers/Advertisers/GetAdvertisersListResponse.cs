using System;
using System.Collections.Generic;

using System.Globalization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace ADSDataDirect.Infrastructure.HasOffers.Advertisers
{
    public partial class GetAdvertisersListResponse
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

        [JsonProperty("company")]
        public string Company { get; set; }

        [JsonProperty("zipcode")]
        public string Zipcode { get; set; }

        [JsonProperty("status")]
        public string Status { get; set; }

        [JsonProperty("email", NullValueHandling = NullValueHandling.Ignore)]
        public string Email { get; set; }

        [JsonProperty("phone", NullValueHandling = NullValueHandling.Ignore)]
        public string Phone { get; set; }

        [JsonProperty("white_label", NullValueHandling = NullValueHandling.Ignore)]
        public string WhiteLabel { get; set; }

        [JsonProperty("domain", NullValueHandling = NullValueHandling.Ignore)]
        public string Domain { get; set; }

        [JsonProperty("report_template", NullValueHandling = NullValueHandling.Ignore)]
        public string ReportTemplate { get; set; }
    }

    public partial class GetAdvertisersListResponse
    {
        public static GetAdvertisersListResponse FromJson(string json) => JsonConvert.DeserializeObject<GetAdvertisersListResponse>(json, Converter.Settings);
    }

    public static class Serialize
    {
        public static string ToJson(this GetAdvertisersListResponse self) => JsonConvert.SerializeObject(self, Converter.Settings);
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