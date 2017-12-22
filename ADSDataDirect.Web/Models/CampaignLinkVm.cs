using System;
using System.ComponentModel.DataAnnotations;
using ADSDataDirect.Core.Entities;

namespace ADSDataDirect.Web.Models
{
    public class CampaignLinkVm
    {
        public string OrderNumber { get; set; }
        public string SalesMasterId { get; set; }
        public string URL { get; set; }
        public string URLRedemed { get; set; }
        public string OpenURL { get; set; }
        public string OpenURLRedemed { get; set; }
        public string BannerURL { get; set; }
        public string BannerURLRedemed { get; set; }
        
        static string baseURL = "http://url.verumdm.com";

        internal static CampaignLinkVm FromLink(CampaignLink x)
        {
            return new CampaignLinkVm()
            {
                OrderNumber = x.OrderNumber,
                SalesMasterId = x.SalesMasterId.ToString(),
                URL = $"{baseURL}/{x.URL}",
                URLRedemed = x.IsURLRedemed ? "Yes" : "No",
                OpenURL = $"{baseURL}/{x.OpenURL}",
                OpenURLRedemed = x.IsOpenURLRedemed ? "Yes" : "No",
                BannerURL = $"{baseURL}/{x.BannerURL}",
                BannerURLRedemed = x.IsBannerURLRedemed ? "Yes" : "No"
        };
        }
    }
}