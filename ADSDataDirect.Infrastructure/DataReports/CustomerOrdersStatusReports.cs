using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADSDataDirect.Infrastructure.DataReports
{
    public static class CustomerOrdersStatusReports
    {
        public static void Generate(System.Web.HttpResponseBase Response, string whiteLabel, List<Campaign> campaigns)
        {
            ExcelPackage excel = new ExcelPackage();
            var workSheet = excel.Workbook.Worksheets.Add(whiteLabel);

            List<CustomerOrdersStatusVm> customerOrders = new List<CustomerOrdersStatusVm>();
            foreach (var campaign in campaigns)
            {
                customerOrders.Add(CustomerOrdersStatusVm.FromCampaign(campaign));
            }

            workSheet.Cells[1, 1].LoadFromCollection(customerOrders, true);

            var headerRowComplete = workSheet.Row(1);
            headerRowComplete.Style.Font.Size = 13;
            headerRowComplete.Style.Font.Bold = true;

            int Row = 2;
            foreach (var campaign in campaigns)
            {
                var rowComplete = workSheet.Row(Row);
                rowComplete.Style.Fill.PatternType = ExcelFillStyle.Solid;

                if (campaign.Status == (int)CampaignStatus.Monitoring)
                    rowComplete.Style.Fill.BackgroundColor.SetColor(Color.DarkOrange);
                else
                    rowComplete.Style.Fill.BackgroundColor.SetColor(Color.MediumPurple);
                Row++;
            }
            
            using (var memoryStream = new MemoryStream())
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;  filename="+ whiteLabel +"OrdersReport.xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }
    }
}
