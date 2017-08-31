using System;
using System.Linq;
using System.Text.RegularExpressions;

namespace ADSDataDirect.Web.Helpers
{
    public class StringHelper
    {
        public static bool Contains(string source, string toCheck)
        {
            if (string.IsNullOrEmpty(source)) return false;
            return source.ToLowerInvariant().Contains(toCheck.ToLowerInvariant());
        }

        public static string UrlSubstring(string source)
        {
            var parts = source.Split("//".ToCharArray());
            return string.Join("/", parts.ToList().Skip(parts.Length - 3));
        }

        public static string Trim(string source)
        {
            var lineTrimmed = Regex.Replace(source, @"[^\w\.@-]", "",
                               RegexOptions.None, TimeSpan.FromSeconds(1.5));
            return lineTrimmed.Trim();
        }
    }
}