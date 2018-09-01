using System;
using System.Globalization;
using System.Text.RegularExpressions;
using Newtonsoft.Json;

namespace ADSDataDirect
{
    public static class Extensions
    {
        public static string ToJson(this object value)
        {
            return JsonConvert.SerializeObject(value, Formatting.Indented);
        }

        public static string ToCapitalized(this string value)
        {
            return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(value.Replace(".", ""));
        }

        public static bool Contains(this string source, string search
            , StringComparison compare)
        {
            return source.IndexOf(search, compare) >= 0;
        }

        static Regex _r = new Regex(@"
                (?<=[A-Z])(?=[A-Z][a-z]) |
                 (?<=[^A-Z])(?=[A-Z]) |
                 (?<=[A-Za-z])(?=[^A-Za-z])", RegexOptions.IgnorePatternWhitespace);

        public static string ToCapitalLetterString(this string s)
        {
            return _r.Replace(s, " ");
        }

        public static string ToSafeString(this Guid? value)
        {
            return value?.ToString() ?? string.Empty;
        }

        public static string ToSafeString(this DateTime? value, string format)
        {
            return value?.ToString(format) ?? string.Empty;
        }

        public static string ToSafeString(this object s)
        {
            if (s == null) return string.Empty;
            return (string)s;
        }

        public static DateTime ToSafeDateTime(this object s)
        {
            if (s == null) return DateTime.MinValue;

            DateTime dt;
            DateTime.TryParse((string)s, out dt);
            return dt;
        }

        public static int ToSafeInt(this object s)
        {
            if (s == null) return -1;

            string output = Regex.Match((string)s, @"\d+").Value;

            int n;
            Int32.TryParse(output, out n);
            return n;
        }

        public static bool ToSafeBoolean(this object s)
        {
            if (s == null) return false;
            return (bool)s;
        }

        public static long ToSafeLong(this object s)
        {
            if (s == null) return -1;
            long n;
            Int64.TryParse((string)s, out n);
            return n;
        }
    }
}