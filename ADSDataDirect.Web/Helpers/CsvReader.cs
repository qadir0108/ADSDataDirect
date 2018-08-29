using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace ADSDataDirect.Web.Helpers
{
    public class CsvReader
    {
        public static List<string> ReadCsv(string filePath)
        {
            List<string> single_line_data = new List<string>();
            foreach (var line in File.ReadAllLines(filePath))
            {
                if (string.IsNullOrEmpty(line)) continue;

                single_line_data.Add(line);
            }
            return single_line_data;
        }
    }
}