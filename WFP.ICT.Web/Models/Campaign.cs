using System;
using System.Collections.Generic;
using System.Linq;

namespace ADS.API.Models
{
    public class Campaign
    {
        public static readonly SortedDictionary<int, KeyValuePair<int, int>> hoursPercentageDictionaryDynamic 
            = new SortedDictionary<int, KeyValuePair<int, int>>()
        {
            {1, new KeyValuePair<int, int>(100, 300) },
            {3, new KeyValuePair<int, int>(95, 150) },
            {5, new KeyValuePair<int, int>(75, 200) },
            {7, new KeyValuePair<int, int>(100, 200) },
            {9, new KeyValuePair<int, int>(100, 170) },
            {12, new KeyValuePair<int, int>(70, 150) },
            {18, new KeyValuePair<int, int>(50, 100) },
            {24, new KeyValuePair<int, int>(60, 120) },
            {30, new KeyValuePair<int, int>(50, 90) },
            {36, new KeyValuePair<int, int>(30, 70) },
            {42, new KeyValuePair<int, int>(20, 60) }
        };

        public static double GetPercentageDynamic(int hr)
        {
            var r = new Random();
            double finalPercentage = 0.0;
            if (hr >= 1)
                finalPercentage += r.Next(hoursPercentageDictionaryDynamic[1].Key, hoursPercentageDictionaryDynamic[1].Value) / 10000.0;
            if (hr >= 3)
                finalPercentage += r.Next(hoursPercentageDictionaryDynamic[3].Key, hoursPercentageDictionaryDynamic[3].Value) / 10000.0;
            if (hr >= 5)
                finalPercentage += r.Next(hoursPercentageDictionaryDynamic[5].Key, hoursPercentageDictionaryDynamic[5].Value) / 10000.0;
            if (hr >= 7)
                finalPercentage += r.Next(hoursPercentageDictionaryDynamic[7].Key, hoursPercentageDictionaryDynamic[7].Value) / 10000.0;
            if (hr >= 9)
                finalPercentage += r.Next(hoursPercentageDictionaryDynamic[9].Key, hoursPercentageDictionaryDynamic[9].Value) / 10000.0;
            if (hr >= 12)
                finalPercentage += r.Next(hoursPercentageDictionaryDynamic[12].Key, hoursPercentageDictionaryDynamic[12].Value) / 10000.0;
            if (hr >= 18)
                finalPercentage += r.Next(hoursPercentageDictionaryDynamic[18].Key, hoursPercentageDictionaryDynamic[18].Value) / 10000.0;
            if (hr >= 24)
                finalPercentage += r.Next(hoursPercentageDictionaryDynamic[24].Key, hoursPercentageDictionaryDynamic[24].Value) / 10000.0;
            if (hr >= 30)
                finalPercentage += r.Next(hoursPercentageDictionaryDynamic[30].Key, hoursPercentageDictionaryDynamic[30].Value) / 10000.0;
            if (hr >= 36)
                finalPercentage += r.Next(hoursPercentageDictionaryDynamic[36].Key, hoursPercentageDictionaryDynamic[36].Value) / 10000.0;
            if (hr >= 42)
                finalPercentage += r.Next(hoursPercentageDictionaryDynamic[42].Key, hoursPercentageDictionaryDynamic[42].Value) / 10000.0;
            return finalPercentage;
        }

        public static readonly SortedDictionary<int, double> hoursPercentageDictionary = new SortedDictionary<int, double>()
        {
            {1, 0.0179 }, {5, 0.0479}, {8, 0.0678}, {12, 0.0818}, {18, 0.0893}, {24, 0.1013}, {30, 0.1173}, {36, 0.1184}, {44, 0.1206}
        };

        // 4 = 1
        // 5 = 5
        // 6 = 5
        // >=44 = 44
        public static double GetPercentage(int hr)
        {
            if (hr >= 44) return hoursPercentageDictionary[44];

            int actualHr = -1;
            int[] hrs = hoursPercentageDictionary.Keys.ToArray();
            for (int i =0; i < hrs.Length;i++)
            {
                if (hr >= hrs[i] && hr < hrs[i + 1])
                {
                    actualHr = hrs[i];
                    break;
                }
            }
            return hoursPercentageDictionary[actualHr];
        }
        
        public static int GetOpens(long Quantity, DateTime startDateTime)
        {
            int hrsPassed = (int)Math.Round((DateTime.Now - startDateTime).TotalHours);
            return (int) Math.Round(Quantity * GetPercentageDynamic(hrsPassed));
        }

        public string CampaignName { get; set; }
        public string OrderNumber { get; set; }
        public string IONumber { get; set; }
        public string StartDate { get; set; }
        public string EmailsSent { get; set; }
        public string EmailsOpened { get; set; }
        public string EmailsClicked { get; set; }

        public List<LinkBreakout> LinkBreakout { get; set; }

        public static ADS.API.Models.Campaign FromCampaign(WFP.ICT.Data.Entities.Campaign campaign)
        {
            long clicked = 0, opened = 0;
            DateTime startDateTime = DateTime.MinValue;
            string IONumber = "NA";
            if (campaign.ProDatas.Count > 0)
            {
                clicked = campaign.ProDatas.Sum(x => x.ClickCount);
                startDateTime = DateTime.Parse(campaign.ProDatas.FirstOrDefault().CampaignStartDate);
                opened = GetOpens(campaign.Approved.Quantity, startDateTime);
            }
            var model = new ADS.API.Models.Campaign()
            {
                CampaignName = campaign.Approved.CampaignName,
                EmailsClicked = clicked == 0 ? "NA" : clicked.ToString(),
                EmailsOpened = opened == 0 ? "NA" : opened.ToString(),
                IONumber = campaign.ProDatas.FirstOrDefault().IO,
                StartDate = startDateTime == DateTime.MinValue ? "NA" : startDateTime.ToString(),
                EmailsSent = campaign.Quantity.ToString(),
            };
            model.LinkBreakout = new List<LinkBreakout>();
            foreach (var proData in campaign.ProDatas)
            {
                model.LinkBreakout.Add(new LinkBreakout()
                {
                    Link = proData.Destination_URL,
                    Quantity = proData.ClickCount.ToString()
                });
            }
            return model;
        }
    }

    public class LinkBreakout
    {
        public string Link { get; set; }
        public string Quantity { get; set; }
    }

    
}