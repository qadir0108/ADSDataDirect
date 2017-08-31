using System.Collections.Generic;
using System.IO;
using System.Linq;
using ADSDataDirect.Enums;

namespace ADSDataDirect.Web.Helpers
{
    public class CreativeHelper
    {
        public static List<SelectItemPair> ReadEmails(string filePath)
        {
            List<SelectItemPair> emails = new List<SelectItemPair>();
            foreach (var line in File.ReadAllLines(filePath))
            {
                var trimmed = StringHelper.Trim(line);
                if (string.IsNullOrEmpty(trimmed)) continue;
                if(!EmailChecker.IsValidEmail(trimmed)) continue;

                emails.Add(new SelectItemPair() { Selected = true, Text = trimmed, Value = trimmed });
            }
            return emails;
        }

        public void Add(string filePath, string email)
        {
            File.AppendAllLines(filePath, new string[] {email});
        }

        public void Remove(string filePath, string email)
        {
            File.WriteAllLines(filePath, File.ReadAllLines(filePath).Where(x => StringHelper.Trim(x) != email));
        }
    }
}