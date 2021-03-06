﻿// <auto-generated />
//
// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do:
//
//    using ADSDataDirect.Infrastructure.ClickMeter;
//
//    var ClickMeterResponse = ClickMeterResponse.FromJson(jsonString);

namespace ADSDataDirect.Infrastructure.ClickMeter
{
    using System;
    using System.Collections.Generic;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

    public partial class ClickMeterHitResponse
    {
        [JsonProperty("lastKey")]
        public string LastKey { get; set; }

        [JsonProperty("hits")]
        public Hit[] Hits { get; set; }
    }

    public partial class Hit
    {
        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("accessTime")]
        public string AccessTime { get; set; }

        [JsonProperty("entity")]
        public Entity Entity { get; set; }

        [JsonProperty("browser")]
        public Browser Browser { get; set; }

        [JsonProperty("os")]
        public Browser Os { get; set; }

        [JsonProperty("location")]
        public Location Location { get; set; }

        [JsonProperty("conversions")]
        public object[] Conversions { get; set; }

        [JsonProperty("clientLanguage")]
        public string ClientLanguage { get; set; }

        [JsonProperty("type")]
        [JsonConverter(typeof(ParseStringConverter))]
        public long Type { get; set; }

        [JsonProperty("ip")]
        public string Ip { get; set; }

        [JsonProperty("referer")]
        public string Referer { get; set; }

        [JsonProperty("realDestinationUrl")]
        public Uri RealDestinationUrl { get; set; }

        [JsonProperty("isSpider")]
        [JsonConverter(typeof(ParseStringConverter))]
        public long IsSpider { get; set; }

        [JsonProperty("isUnique")]
        [JsonConverter(typeof(ParseStringConverter))]
        public long IsUnique { get; set; }

        [JsonProperty("isProxy")]
        [JsonConverter(typeof(ParseStringConverter))]
        public long IsProxy { get; set; }

        [JsonProperty("trackedParameters")]
        public TrackedParameters TrackedParameters { get; set; }
    }

    public partial class Browser
    {
        [JsonProperty("id")]
        public long Id { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("familyId")]
        public long FamilyId { get; set; }

        [JsonProperty("familyName")]
        public string FamilyName { get; set; }

        [JsonProperty("familyIcon")]
        public string FamilyIcon { get; set; }

        [JsonProperty("browserType")]
        public string BrowserType { get; set; }

        [JsonProperty("icon")]
        public string Icon { get; set; }
    }

    public partial class Entity
    {
        [JsonProperty("datapointId")]
        public long DatapointId { get; set; }

        [JsonProperty("datapointName")]
        public string DatapointName { get; set; }

        [JsonProperty("datapointTitle")]
        public string DatapointTitle { get; set; }

        [JsonProperty("datapointType")]
        public string DatapointType { get; set; }

        [JsonProperty("groupId")]
        public long GroupId { get; set; }

        [JsonProperty("groupName")]
        public string GroupName { get; set; }

        [JsonProperty("notes")]
        public string Notes { get; set; }

        [JsonProperty("creationDate")]
        public string CreationDate { get; set; }

        [JsonProperty("destinationUrl")]
        public string DestinationUrl { get; set; }

        [JsonProperty("isABTest")]
        public bool IsAbTest { get; set; }

        [JsonProperty("trackingCode")]
        public string TrackingCode { get; set; }
    }

    public partial class Location
    {
        [JsonProperty("country")]
        public string Country { get; set; }

        [JsonProperty("areacode")]
        public string Areacode { get; set; }

        [JsonProperty("city")]
        public string City { get; set; }

        [JsonProperty("latitude")]
        public double Latitude { get; set; }

        [JsonProperty("longitude")]
        public double Longitude { get; set; }

        [JsonProperty("metrocode")]
        public string Metrocode { get; set; }

        [JsonProperty("postalcode")]
        public string Postalcode { get; set; }

        [JsonProperty("region")]
        public string Region { get; set; }

        [JsonProperty("organization")]
        public string Organization { get; set; }
    }

    public partial class TrackedParameters
    {
    }

    public partial class ClickMeterHitResponse
    {
        public static ClickMeterHitResponse FromJson(string json) => JsonConvert.DeserializeObject<ClickMeterHitResponse>(json, ADSDataDirect.Infrastructure.ClickMeter.Converter.Settings);
    }


    internal class ParseStringConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(long) || t == typeof(long?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            long l;
            if (Int64.TryParse(value, out l))
            {
                return l;
            }
            throw new Exception("Cannot unmarshal type long");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (long)untypedValue;
            serializer.Serialize(writer, value.ToString());
            return;
        }

        public static readonly ParseStringConverter Singleton = new ParseStringConverter();
    }
   
}
