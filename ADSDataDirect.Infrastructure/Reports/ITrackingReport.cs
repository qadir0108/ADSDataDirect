using ADSDataDirect.Infrastructure.Db;
using DocumentFormat.OpenXml.Spreadsheet;

namespace ADSDataDirect.Infrastructure.Reports
{
    interface ITrackingReport
    {
        void Generate(CampaignTrackingVm model, string outputFilePath);
        void PopulateRowTemplate(Worksheet worksheet, CampaignTrackingDetailVm row, uint rowNumber);
    }
}
