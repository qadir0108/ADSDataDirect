using ADSDataDirect.Core.Entities;
using OfficeOpenXml;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADSDataDirect.Infrastructure.DataReports
{
    public static class MetricReportsGenerator
    {
        public static void Generate(System.Web.HttpResponseBase Response, Campaign campaign, CampaignTracking campaignTracking)
        {
            var metric = CampaignTrackingMetricVm.FromCampaignTracking(campaign, campaignTracking);
            var urls = CampaignTrackingMetricDetailVm.FromCampaignTracking(campaign, campaignTracking);

            ExcelPackage excel = new ExcelPackage();
            var workSheet = excel.Workbook.Worksheets.Add("Strat Metrics");
            workSheet.Cells[1, 1].LoadFromCollection(metric, true);
            workSheet.Cells[2, 8].Style.Numberformat.Format = "0.00%";
            workSheet.Cells[2, 11].Style.Numberformat.Format = "0.00%";
            workSheet.Cells[2, 12].Style.Numberformat.Format = "0.00%";

            var workSheet2 = excel.Workbook.Worksheets.Add("Strat URLs");
            workSheet2.Cells[1, 1].LoadFromCollection(urls, true);

            using (var memoryStream = new MemoryStream())
            {
                string orderNumber = campaign.ReBroadcasted ? $"{campaign.ReBroadcastedOrderNumber}" : $"{campaign.OrderNumber}";
                string fileName = $"{orderNumber}report.xlsx";
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader($"content-disposition", $"attachment;  filename={fileName}");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }
    }
}
