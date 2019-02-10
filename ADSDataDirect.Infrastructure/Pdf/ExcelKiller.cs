using ADSDataDirect.Infrastructure.Log;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADSDataDirect.Infrastructure.Pdf
{
    public class ExcelKiller
    {
        public static void Kill(ServerLogger logger)
        {
            try
            {
                Impersonate objImpersonate = new Impersonate(
                    ConfigurationManager.AppSettings["DomainName"],
                    ConfigurationManager.AppSettings["UserName"],
                    ConfigurationManager.AppSettings["Password"]);

                bool impersonateValid;
                if (ConfigurationManager.AppSettings["IsLive"] == "false") {
                    impersonateValid = true;
                } else
                {
                    impersonateValid = objImpersonate.impersonateValidUser();
                }
                if (impersonateValid)
                {
                    Process[] excelProcesses = Process.GetProcessesByName("excel");
                    logger.log("Processes: " + excelProcesses.Length);
                    foreach (Process p in excelProcesses)
                    {
                        p.Kill();
                        logger.log("Killed!");
                        if (string.IsNullOrEmpty(p.MainWindowTitle)) // use MainWindowTitle to distinguish this excel process with other excel processes 
                        {
                            //
                        }
                    }
                }
                else
                {
                    throw new AdsException("Error Impersonate");
                }
            }
            catch (Exception ex)
            {
                logger.log("Error Getting Process: " + 
                    Environment.NewLine +
                    ex.Message +
                    Environment.NewLine +
                    ex.StackTrace);
            }
        }
    }
}
