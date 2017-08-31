namespace ADSDataDirect.Web.ProData
{
    public static class ProDataHelper
    {
        public static int GetIndex(string reportSiteUrl)
        {
            //ReportSiteURL = "http://report-site.com/c/ADS2684RDP/0";
            var parts = reportSiteUrl.Split('/');
            return int.Parse(parts[parts.Length - 1]);
        }
    }
}