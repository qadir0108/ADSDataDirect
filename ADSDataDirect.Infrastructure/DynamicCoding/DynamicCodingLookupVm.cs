using ADSDataDirect.Core.Entities;

namespace ADSDataDirect.Infrastructure.DynamicCoding
{
    public class DynamicCodingLookupVm
    {
        public string OrderNumber { get; set; }
        public string URL { get; set; }
        public string Quantity { get; set; }
        
        static string baseURL = "http://url.verumdm.com";

        public static DynamicCodingLookupVm FromLookup(DynamicCodingLookup x)
        {
            return new DynamicCodingLookupVm()
            {
                OrderNumber = x.OrderNumber,
                URL = $"{baseURL}/{x.VerumURL}",
                Quantity = $"{x.Qunatity}",
            };
        }
    }
}