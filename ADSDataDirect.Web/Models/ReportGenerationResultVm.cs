using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ADSDataDirect.Web.Models
{
    public class ReportGenerationResultVm
    {
        public string orderNumber { get; set; }
        public string contentType { get; set; }
        public string outputFileName { get; set; }
        public string outputFilePath { get; set; }
    }
}