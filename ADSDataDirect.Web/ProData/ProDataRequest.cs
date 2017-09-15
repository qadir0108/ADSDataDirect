namespace ADSDataDirect.Web.ProData
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

        public override string ToString()
        {
            return $@"<br/><p><b>Order Details</b></p><br/>
                    <table border=""2"">
                    <tr><th align=""left"">Order/IO #:</th><td>{io}</td></tr>
                    <tr><th align=""left"">Campaign Name:</th><td>{campaign_name}</td></tr>
                    <tr><th align=""left"">Rebroadcast:</th><td>{(is_rebroadcast)}</td></tr>    
                    <tr><th align=""left"">White Label:</th><td>{white_label}</td></tr>                                        
                    <tr><th align=""left"">Creative URL:</th><td>{creative_url}</td></tr>
                    <tr><th align=""left"">Quantity:</th><td>{quantity}</td></tr>
                    <tr><th align=""left"">Geo Type:</th><td>{geo_type}</td></tr>
                    <tr><tr><th align=""left"">Geo / Zip URL:</th><td>{geo_url}</td></tr>
                    <tr><tr><th align=""left"">CTR Percentage:</th><td>{ctr_percent}</td></tr>
                    <tr><th align=""left"">Subject Line:</th><td>{subject}</td></tr>
                    <tr><th align=""left"">From Line:</th><td>{from_name}</td></tr>
                    <tr><th align=""left"">From Email:</th><td>{from_email}</td></tr>
                    <tr><th align=""left"">Broadcast / Deploy Date:</th><td>{deploy_date}</td></tr>

                    <tr><th align=""left"">Has Open Pixel:</th><td>{(is_open_pixel)}</td></tr>
                    <tr><th align=""left"">Open Percent:</th><td>{open_percent}</td></tr>
                    <tr><th align=""left"">Open Pixel URL:</th><td>{open_pixel}</td></tr>

                    <tr><th align=""left"">Has Data File:</th><td>{is_data_file}</td></tr>
                    <tr><th align=""left"">Data File URL:</th><td>{data_file_url}</td></tr>
                    <tr><th align=""left"">Data File Replacement Param:</th><td>{data_file_replacement_param}</td></tr>
                    <tr><th align=""left"">Data File Replacement Column:</th><td>{data_file_replacement_column}</td></tr>
                    <tr><th align=""left"">Data File Unique IP:</th><td>{data_file_unique_ip}</td></tr>
                    </table></p>";
        }
    }
}