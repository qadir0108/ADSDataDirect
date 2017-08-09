namespace WFP.ICT.Web.Models
{
    public class ProDataRequest
    {
        public string io { get; set; }
        public string campaign_name { get; set; }
        public string is_rebroadcast { get; set; }
        public string white_label { get; set; }
        public string creative_url { get; set; }
        public long quantity { get; set; }
        public string geo_type { get; set; } //"POSTALCODE"  COUNTRY, STATE, POSTALCODE, DMA
        public string geo_url { get; set; }
        public double ctr_percent { get; set; } // 0.023
        public string subject { get; set; }
        public string from_name { get; set; }
        public string from_email { get; set; }
        public string deploy_date { get; set; } // "2017-07-10 14:30:00"

        public string is_open_pixel { get; set; } // Y or N value.
        public double open_percent { get; set; } // 0.10
        public string open_pixel { get; set; }

        public string is_data_file { get; set; } // Y or N value.
        public string data_file_url { get; set; }
        public string data_file_replacement_param { get; set; } // "replace_by"
        public string data_file_replacement_column { get; set; } // "10"
        public string data_file_unique_ip { get; set; } //Y or N value.
    }
}