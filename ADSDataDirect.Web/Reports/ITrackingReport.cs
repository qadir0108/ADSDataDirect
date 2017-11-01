using ADSDataDirect.Web.Models;
using DocumentFormat.OpenXml.Spreadsheet;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADSDataDirect.Web.Reports
{
    interface ITrackingReport
    {
        void Generate(CampaignTrackingVm model, string outputFilePath);
        void PopulateRowTemplate(Worksheet worksheet, CampaignTrackingDetailVm row, uint rowNumber);
    }
}
