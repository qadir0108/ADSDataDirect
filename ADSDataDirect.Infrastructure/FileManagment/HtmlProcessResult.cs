using ADSDataDirect.Enums;

namespace ADSDataDirect.Infrastructure.FileManagment
{
    public class HtmlProcessResult
    {
        public string FilePathLive { get; set; }
        public UploadFileStatus Status { get; set; }
    }
}