using System.Text.RegularExpressions;
using System.Web;

namespace WFP.ICT.Web.Helpers
{
    public class FileHelper
    {
        public static readonly string UploadsSupplierListingPath = HttpContext.Current.Server.MapPath("~/Uploads/SuppliersListings");

        public static string GetImagePath(string fileName)
        {
            return UploadsSupplierListingPath+"\\"+fileName+".jpg";
        }

        public static string GetValidFileName(string fileName)
        {
            // remove any invalid character from the filename.
            string ret = Regex.Replace(fileName.Trim(), "[^A-Za-z0-9_. ]+", "");
            return ret.Replace(" ", string.Empty);
        }
    }
}