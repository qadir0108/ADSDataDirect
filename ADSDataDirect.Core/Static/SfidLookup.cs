using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADSDataDirect.Core.Static
{
    public static class SfidLookup
    {

        private static readonly SortedDictionary<int, string> ClientCampaigns
           = new SortedDictionary<int, string>()
           {
                {1, "Cardel - 2018" },              //
                {2, "CODA - 2018" },                // 
                {3, "Colliers Hill - 2018" },
                {4, "Crystal Valley - 2018" },
                {5, "Lokal Homes - 2018" },         //
                {6, "Backcountry - 2018" },
                {7, "Shea Corporate - 2018" },
                {8, "Southshore - 2018" },
                {9, "Stepping Stone - 2018" },
                {10, "The Farm - 2018" },           //
                {11, "Tribute Homes - 2018" },      //
                {12, "True Homes - 2018" },         //
                {13, "Vita at Littleton - 2018" },  //
           };

        public static SortedDictionary<int, string> GetCampaigns()
        {
            return ClientCampaigns;
        }

        public static string GetCampaignName(int id)
        {
            if (id < 1 || id > 13) return string.Empty;
            return ClientCampaigns[id];
        }
    }
}
