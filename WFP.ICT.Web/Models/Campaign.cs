using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ADS.API.Models
{
    public class Campaign
    {

        public static SortedDictionary<int, double> hoursPercentageDictionary = new SortedDictionary<int, double>()
        {
            {1, 0.0139 }, {5, 0.0395}, {8, 0.0613}, {12, 0.0823}, {18, 0.0934}, {24, 0.1023}, {30, 0.1082}, {36, 0.1094}, {44, 1127}
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
            return (int) Math.Round(Quantity * GetPercentage(hrsPassed));
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
                opened = GetOpens(campaign.Copy.Quantity, startDateTime);
            }
            var model = new ADS.API.Models.Campaign()
            {
                CampaignName = campaign.Copy.CampaignName,
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