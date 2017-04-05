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
            {10, 0.22181 }, {20, 0.40928}, {30, 0.55004}, {40, 0.67389}, {50, 0.78330}, {60, 0.87274}, {70, 0.93972}, {80, 0.99955}, {90, 1}
        };

        public string CampaignName { get; set; }
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
            if (campaign.ProDatas.Count > 0)
            {
                clicked = campaign.ProDatas.Sum(x => x.ClickCount);
                startDateTime = DateTime.Parse(campaign.ProDatas.FirstOrDefault().CampaignStartDate);
                int hrsPassed = ((int)Math.Round((DateTime.Now - startDateTime).TotalHours / 10.0)) * 10;
                double percentage = hrsPassed >= 90 ? 1 : hoursPercentageDictionary[hrsPassed];
                opened = ((int)Math.Round(campaign.ProDatas.Sum(x => x.ClickCount) * percentage));
            }
            var model = new ADS.API.Models.Campaign()
            {
                CampaignName = campaign.Copy.CampaignName,
                EmailsClicked = clicked == 0 ? "NA" : clicked.ToString(),
                EmailsOpened = opened == 0 ? "NA" : opened.ToString(),
                IONumber = !string.IsNullOrEmpty(campaign.Copy.IONumber) ? campaign.Copy.IONumber
                          : (campaign.ProDatas.Count > 0 ? campaign.ProDatas.FirstOrDefault().IO : "NA"),
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