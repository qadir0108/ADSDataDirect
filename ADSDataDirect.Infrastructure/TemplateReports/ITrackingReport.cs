using DocumentFormat.OpenXml.Spreadsheet;

namespace ADSDataDirect.Infrastructure.TemplateReports
{
    interface ITrackingReport
    {
        void Generate(TemplateReportVm model, string outputFilePath);
        void PopulateRowTemplate(Worksheet worksheet, TemplateReportDetailVm row, uint rowNumber);
    }
}
