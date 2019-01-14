using System.ComponentModel.DataAnnotations;

namespace ADSDataDirect.Web.Models
{
    public class OpenModelInputVm
    {
        public string Id { get; set; }
        public string OrderNumber { get; set; }

        // Custom Reporting Model
        public string OpenModelLinksFile { get; set; }
        public string OpenModelImageFile { get; set; }
        public string SFDClientId { get; set; }
        public bool IsReportType { get; set; } // Static or Dataroma

    }
}