using System.Collections.Generic;
using System.Text;

namespace ADSDataDirect.Infrastructure.ProData
{
    public class ProDataResponse
    {
        public string status { get; set; }
        public Reports reports { get; set; }
        public string timestamp { get; set; }
        public string message { get; set; }
        public List<string> error_fields { get; set; }
        public long queued_pending_campaign_id { get; set; }

        public string ResponseStatus { get; set; }
        public string ResponseMessage { get; set; }
        public string RequestMessage { get; set; }
        public string ErrorMessage
        {
            get
            {
                StringBuilder errorMessage = new StringBuilder(message);
                foreach (var field in error_fields)
                {
                    errorMessage.Append($"<br/>{field}");
                }
                return errorMessage.ToString();
            }
        }
    }

    public class Reports
    {
        public Report[] report { get; set; }
    }

    public class Report
    {
        public string IO { get; set; }
        public string Reportsite_URL { get; set; }
        public string Destination_URL { get; set; }
        public string CampaignStartDate { get; set; }
        public string ClickCount { get; set; }
        public string CampaignName { get; set; }
        public long UniqueCnt { get; set; }
        public long MobileCnt { get; set; }
        public long ImpressionCnt { get; set; }
    }

}