namespace ADSDataDirect.Infrastructure.ClickMeter
{
    public class ClickMeterLink
    {
        public long id { get; set; }
        
        // Test1234a
        public string name { get; set; }
        
        // Rotator zamf
        public string title { get; set; }

        // http://httpslink.com/Test1234a
        public string trackingCode { get; set; }

        // 5465227
        public long groupId { get; set; }

        // 1234 Test A
        public string groupName { get; set; }

        public TypeTL typeTL { get; set; }
        
    }

    public class TypeTL
    {
        public int redirectType { get; set; }
        public int domainId { get; set; }
        public int destinationMode { get; set; }
        public DestinationItem[] weightedDestinationItems {get; set;}
    }

    public class DestinationItem
    {
        public string url { get; set; }
        public int weight { get; set; }
    }

}
