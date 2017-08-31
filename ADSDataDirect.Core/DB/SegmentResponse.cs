namespace ADSDataDirect.Core.DB
{
    public class SegmentResponse
    {
        public long Index { get; set; }
        public int SalesMasterId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Apt { get; set; }
        public short Zip4 { get; set; }
        public string Dealership_ID { get; set; }
    }
}
