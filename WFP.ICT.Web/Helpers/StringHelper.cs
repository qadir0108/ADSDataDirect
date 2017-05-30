using System;
using System.Linq;
using System.Text.RegularExpressions;

namespace WFP.ICT.Web.Helpers
{
    public class StringHelper
    {
        public static bool Contains(string Source, string ToCheck)
        {
            if (string.IsNullOrEmpty(Source)) return false;
            return Source.ToLowerInvariant().Contains(ToCheck.ToLowerInvariant());
        }

        public static string URLSubstring(string Source)
        {
            var parts = Source.Split("//".ToCharArray());
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