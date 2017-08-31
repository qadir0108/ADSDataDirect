using System.Collections.Generic;
using System.Text;

namespace ADSDataDirect.Web.ProData
{
    public class ProDataResponse
    {
        public string Status { get; set; }
        public Reports Reports { get; set; }
        public string Timestamp { get; set; }
        public string Message { get; set; }
        public List<string> ErrorFields { get; set; }
        public long QueuedPendingCampaignId { get; set; }

        public string ResponseStatus { get; set; }
        public string ResponseMessage { get; set; }
        public string ErrorMessage
        {
            get
            {
                StringBuilder errorMessage = new StringBuilder(Message);
                foreach (var field in ErrorFields)
                {
                    errorMessage.Append($"<br/>{field}");
                }
                return errorMessage.ToString();
            }
        }
    }

    public class Reports
    {
        public Report[] Report { get; set; }
    }

    public class Report
    {
        public string Io { get; set; }
        public string ReportsiteUrl { get; set; }
        public string DestinationUrl { get; set; }
        public string CampaignStartDate { get; set; }
        public string ClickCount { get; set; }
        public string CampaignName { get; set; }
        public long UniqueCnt { get; set; }
        public long MobileCnt { get; set; }
        public long ImpressionCnt { get; set; }
    }

}