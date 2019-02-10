using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace ADSDataDirect.Infrastructure.Log
{
    public class ServerLogger
    {
        readonly string LogPath = HttpContext.Current.Server.MapPath($"~/logs/ExcelToPDF.txt");
        public void log(string message)
        {
            System.IO.File.AppendAllText(LogPath, 
                Environment.NewLine + 
                DateTime.Now.ToString() + 
                " " + 
                message);
        }
    }
}
