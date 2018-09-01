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
    public static class CustomerOrdersStatusReports
    {
        public static void Generate(System.Web.HttpResponseBase Response, string whiteLabel, List<Campaign> campaigns)
        {
            ExcelPackage excel = new ExcelPackage();
            var workSheet = excel.Workbook.Worksheets.Add(whiteLabel);
            workSheet.Cells[1, 1].LoadFromCollection(campaigns, true);

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
