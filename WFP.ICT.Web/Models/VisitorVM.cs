using System;

namespace WFP.ICT.Web.Models
{
    public class VisitorVM
    {
        public Guid VistitorId { get; set; }
        public Guid VisitRequestId { get; set; }
        public int Code { get; set; }
        public string Name { get; set; }
        public string CompanyName { get; set; }
        public string CnicPassportNumber { get; set; }
        public string EntryGate { get; set; }
        public string VehicleNumber { get; set; }
    }
}