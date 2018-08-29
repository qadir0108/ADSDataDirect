using ADSDataDirect.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ADSDataDirect.Web.API
{
    public class Campaign
    {
        public string CampaignName { get; set; }
        public string OrderNumber { get; set; }
        public string IoNumber { get; set; }
        public string StartDate { get; set; }
        public string EmailsSent { get; set; }
        public string EmailsOpened { get; set; }
        public string EmailsClicked { get; set; }

        public List<LinkBreakout> LinkBreakout { get; set; }

        public static Campaign FromCampaign(Core.Entities.Campaign campaign)
        {
            long clicked = 0, opened = 0;
            DateTime startDateTime = DateTime.MinValue;
            string ioNumber = "NA";
            if (campaign.ProDatas.Count > 0)
            {
                clicked = campaign.ProDatas.Sum(x => x.ClickCount);
                startDateTime = DateTime.Parse(campaign.ProDatas.FirstOrDefault().CampaignStartDate);
                opened = OpenModelerProData.GetOpens(campaign.Approved.Quantity, startDateTime);
            }
            var model = new Campaign()
            {
                CampaignName = campaign.Approved.CampaignName,
                EmailsClicked = clicked == 0 ? "NA" : clicked.ToString(),
                EmailsOpened = opened == 0 ? "NA" : opened.ToString(),
                IoNumber = campaign.ProDatas.FirstOrDefault().IO,
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