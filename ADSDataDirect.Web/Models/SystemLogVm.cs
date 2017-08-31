namespace ADSDataDirect.Web.Models
{
    public class SystemLogVm
    {
        public string CreatedAt { get; set; }
        public string LogType { get; set; }
        public string OrderNumber { get; set; }
        public string Message { get; set; }

        public SystemLogVm()
        {
        }
    }
}
