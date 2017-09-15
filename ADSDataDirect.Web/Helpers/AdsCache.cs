using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ADSDataDirect.Web.Helpers
{
    public static class AdsCache
    {
        private static readonly string _keySent = "Sent";

        public static void CleanSent()
        {
            HttpRuntime.Cache.Remove(_keySent);
        }
      
        public static void AddSent(string id)
        {
            if (HttpRuntime.Cache[_keySent] == null)
            {
                HttpRuntime.Cache[_keySent] = id;
            }
            else
            {
                var idsList = GetSent();
                if(!idsList.Contains(id))
                    idsList.Add(id);
                HttpRuntime.Cache[_keySent] = string.Join(",",idsList);
            }
        }

        public static List<string> GetSent()
        {
            string ids = HttpRuntime.Cache[_keySent] as string;
            if (string.IsNullOrEmpty(ids)) return new List<string>();
            return ids.Split(",".ToCharArray()).ToList();
        }
    }
}