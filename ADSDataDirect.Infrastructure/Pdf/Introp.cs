using Microsoft.Office.Interop.Excel;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace ADSDataDirect.Infrastructure.Pdf
{
    public class Introp
    {
        public static void Generate(string source, string destination)
        {
            Application xlApp = new Application();
            xlApp.Visible = false;
            xlApp.UserControl = false;

            Workbooks xlWorkbooks = xlApp.Workbooks;
            Workbook xlWorkbook = xlWorkbooks.Open(source);

            xlWorkbook.ExportAsFixedFormat(XlFixedFormatType.xlTypePDF, destination);

            xlWorkbook.Close(false);
            xlWorkbooks.Close();

            xlApp.Quit();  //MainWindowTitle will become empty afer being close
            Marshal.FinalReleaseComObject(xlWorkbook);
            Marshal.FinalReleaseComObject(xlWorkbooks);
            Marshal.FinalReleaseComObject(xlApp);

            GC.Collect();
            GC.WaitForPendingFinalizers();

            ExcelKiller.Kill(new Log.ServerLogger());
        }
    }
}
