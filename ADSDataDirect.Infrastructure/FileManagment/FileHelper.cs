using System.Text.RegularExpressions;
using System.Web;

namespace ADSDataDirect.Infrastructure.FileManagment
{
    public class FileHelper
    {
        public static string GetValidFileName(string fileName)
        {
            // remove any invalid character from the filename.
            string ret = Regex.Replace(fileName.Trim(), "[^A-Za-z0-9_. ]+", "");
            return ret.Replace(" ", string.Empty);
        }
    }
}