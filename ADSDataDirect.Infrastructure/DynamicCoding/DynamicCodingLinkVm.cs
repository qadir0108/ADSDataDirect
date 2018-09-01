using System;
using System.ComponentModel.DataAnnotations;
using ADSDataDirect.Core.Entities;

namespace ADSDataDirect.Infrastructure.DynamicCoding
{
    public class DynamicCodingLinkVm
    {
        public string OrderNumber { get; set; }
        public string SalesMasterId { get; set; }
        public string URLType { get; set; }
        public string VerumURL { get; set; }
        public string PartnerURL { get; set; }
        public string IfURLRedemed { get; set; }
        
        static string baseURL = "http://url.verumdm.com";

        public static DynamicCodingLinkVm FromLink(DynamicCodingLink x)
        {
            return new DynamicCodingLinkVm()
            {
                OrderNumber = x.OrderNumber,
                SalesMasterId = x.SalesMasterId.ToString(),
                URLType = x.URLType,
                VerumURL = $"{baseURL}/{x.VerumURL}",
                PartnerURL = $"{x.OrignalURL}",
                IfURLRedemed = x.IsURLRedemed ? "Yes" : "No",
            };
        }
    }
}