using System;
using System.Web;
using DocumentFormat.OpenXml.Spreadsheet;

namespace ADSDataDirect.Infrastructure.TemplateReports
{
    public class BaseTrackingReport : ITrackingReport
    {
        protected string CustomerName { get; set; }
        protected string ImagesPath { get; set; }
        protected string Template { get; set; }
        protected string TemplateFile { get; set; }
        protected int LogoWidth { get; set; }
        protected int LogoHeight { get; set; }
        protected string LogoFilePath { get; set; }
        protected string LogoResized { get; set; }
        protected string ScreenshotFilePath { get; set; }

        public BaseTrackingReport(string reportTemplate, string customerName, string companyLogo, string screenshotFilePath)
        {
            Template = reportTemplate;
            TemplateFile = HttpContext.Current.Server.MapPath($"~/Templates/{reportTemplate}.xlsx");
            CustomerName = customerName;
            ImagesPath = HttpContext.Current.Server.MapPath($"~/images");
            LogoFilePath = string.IsNullOrEmpty(CustomerName) || string.IsNullOrEmpty(companyLogo)
                        ? $"{ImagesPath}\\logo1.png" : $"{ImagesPath}\\{companyLogo}";
            LogoResized = $"{ImagesPath}\\logoResized.png";
            ScreenshotFilePath = screenshotFilePath;
        }

        public virtual void Generate(TemplateReportVm model, string outputFilePath)
        {
            throw new NotImplementedException();
        }

        public virtual void PopulateRowTemplate(Worksheet worksheet, TemplateReportDetailVm row, uint rowNumber)
        {
            throw new NotImplementedException();
        }
    }
}