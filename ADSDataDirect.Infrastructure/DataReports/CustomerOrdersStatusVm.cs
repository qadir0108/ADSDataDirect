using System.Collections.Generic;
using System.Linq;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Core.Static;
using ADSDataDirect.Infrastructure.S3;

namespace ADSDataDirect.Infrastructure.DataReports
{
    public class CustomerOrdersStatusVm
    {
        public string Report_Sent { get; set; }
        public string Report_Needed { get; set; }
        public string Status { get; set; }
        public string Invoice_No { get; set; }
        public string Invoice_Date { get; set; }
        public string NXS_IO_Number { get; set; }
        public string Campaign_Type { get; set; }
        public string Campaign_Name { get; set; }
        public string Order_Date { get; set; }
        public string Broadcast_Date { get; set; }
        public string Deployment_Time_EST { get; set; }
        public string Broadcast_QTY { get; set; }
        public string Geography { get; set; }
        public string Demographics { get; set; }
        public string From_Line { get; set; }
        public string Subject_Line { get; set; }
        public string Special_Instructions { get; set; }
        public string Supression { get; set; }
        public string RTG_URL { get; set; }
        public string Design_Fee { get; set; }
        public string Report_Format { get; set; }

        static readonly System.Random Random = new System.Random();

        public static CustomerOrdersStatusVm FromCampaign(Campaign campaign)
        {
            string orderNumberRdp = campaign.ReBroadcasted ? campaign.ReBroadcastedOrderNumber : campaign.OrderNumber;
            string[] campaignTypes = { "Graphic Design", "E-Blast", "Redrop- Openers", "Retargeting-Openers" };
            int ct = Random.Next(0, 3);
            string[] reportFormats = { "Dataroma", "Static"};
            int ct2 = Random.Next(0, 1);
            string status = (campaign.Status == (int)CampaignStatus.Monitoring) ? "Order Scheduled/Live" :
                    (campaign.Status == (int)CampaignStatus.Invoiced) ? "Invoiced" : System.Enum.GetName(typeof(CampaignStatus), campaign.Status);

            var ordersStatus = new CustomerOrdersStatusVm
                {
                    Report_Sent = "Yes",
                    Report_Needed = "Yes",
                    Status = status,
                    Invoice_No = "1153",
                    Invoice_Date = System.DateTime.Now.ToString(StringConstants.DateFormatSlashes),
                    NXS_IO_Number = orderNumberRdp,
                    Campaign_Type = campaignTypes[ct],
                    Campaign_Name = campaign.Approved.CampaignName,
                    Order_Date = campaign.CreatedAt.ToString(StringConstants.DateFormatSlashes),
                    Broadcast_Date = campaign.Approved.DeployDate?.ToString(StringConstants.DateFormatSlashes),
                    Deployment_Time_EST = campaign.Approved.DeployDate?.ToString(StringConstants.TimeFormat),
                    Broadcast_QTY = campaign.Approved.Quantity.ToString(),
                    Geography = campaign.Approved.GeoDetails,
                    Demographics = campaign.Approved.Demographics,
                    From_Line = campaign.Approved.FromLine,
                    Subject_Line = campaign.Approved.SubjectLine,
                    Special_Instructions = campaign.Approved.SpecialInstructions,
                    Supression = string.IsNullOrEmpty(campaign.Assets.SuppressionFile) ? "Yes" : "No",
                    RTG_URL = campaign.Referrer, //campaign.ReBroadcastDate?.ToString(StringConstants.DateFormatDashes),
                    Design_Fee = "Yes",
                    Report_Format = reportFormats[ct2]
            };
            return ordersStatus;
        }
    }
}