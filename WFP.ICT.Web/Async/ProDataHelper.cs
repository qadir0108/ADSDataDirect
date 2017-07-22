using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WFP.ICT.Web.Async
{
    public class ProDataHelper
    {
        public static int GetIndex(string ReportSiteURL)
        {
            //ReportSiteURL = "http://report-site.com/c/ADS2684RDP/0";
            var parts = ReportSiteURL.Split('/');
            return int.Parse(parts[parts.Length - 1]);
        }
    }
}