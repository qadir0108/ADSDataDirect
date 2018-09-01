using System;
using System.Collections.Generic;

using System.Globalization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace ADSDataDirect.Infrastructure.HasOffers.Publishers
{
    public partial class GetPublishersListResponse
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

        [JsonProperty("email")]
        public string Email { get; set; }

        [JsonProperty("phone")]
        public string Phone { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("cc_email", NullValueHandling = NullValueHandling.Ignore)]
        public string CcEmail { get; set; }
    }

    public partial class GetPublishersListResponse
    {
        public static GetPublishersListResponse FromJson(string json) => JsonConvert.DeserializeObject<GetPublishersListResponse>(json, Converter.Settings);
    }

    public static class Serialize
    {
        public static string ToJson(this GetPublishersListResponse self) => JsonConvert.SerializeObject(self, Converter.Settings);
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