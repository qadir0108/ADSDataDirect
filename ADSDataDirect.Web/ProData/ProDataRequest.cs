namespace ADSDataDirect.Web.ProData
{
    public class ProDataRequest
    {
        public string Io { get; set; }
        public string CampaignName { get; set; }
        public string IsRebroadcast { get; set; }
        public string WhiteLabel { get; set; }
        public string CreativeUrl { get; set; }
        public long Quantity { get; set; }
        public string GeoType { get; set; } //"POSTALCODE"  COUNTRY, STATE, POSTALCODE, DMA
        public string GeoUrl { get; set; }
        public double CtrPercent { get; set; } // 0.023
        public string Subject { get; set; }
        public string FromName { get; set; }
        public string FromEmail { get; set; }
        public string DeployDate { get; set; } // "2017-07-10 14:30:00"

        public string IsOpenPixel { get; set; } // Y or N value.
        public double OpenPercent { get; set; } // 0.10
        public string OpenPixel { get; set; }

        public string IsDataFile { get; set; } // Y or N value.
        public string DataFileUrl { get; set; }
        public string DataFileReplacementParam { get; set; } // "replace_by"
        public string DataFileReplacementColumn { get; set; } // "10"
        public string DataFileUniqueIp { get; set; } //Y or N value.
    }
}