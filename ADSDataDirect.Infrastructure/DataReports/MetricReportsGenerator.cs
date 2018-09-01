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

            var workSheet2 = excel.Workbook.Worksheets.Add("Strat URLs");
            workSheet2.Cells[1, 1].LoadFromCollection(urls, true);

            using (var memoryStream = new MemoryStream())
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;  filename=MetricsURLs.xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }
    }
}
