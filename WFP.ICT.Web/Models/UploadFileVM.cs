using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace WFP.ICT.Web.Models
{
    public class UploadFileVm
    {
        public string FileName { get; set; }
        public string FileType { get; set; }
        public string OrderNumber { get; set; }
        public string SegmentNumber { get; set; }

        public bool IsValid(string filePath)
        {
            bool isValid = true;
            switch (FileType)
            {
                case "Assets_ZipCodeFile":
                    int n;
                    foreach (var line in File.ReadAllLines(filePath))
                    {
                        if (line.Trim().Length != 5 || !int.TryParse(line.Trim(), out n))
                        {
                            isValid = false;
                            break;
                        }
                    }
                    break;
            }
            return isValid;
        }

    }
}