namespace WFP.ICT.Web.Reports
{
    public class ReportModelVisit
    {
        public string GroupNumber { get; set; }
        public string ExpectedDate { get; set; }
        public string Requester { get; set; }
        public string RequesterUnit { get; set; }
        public string RequesterOffice { get; set; }
        public string Details { get; set; }
        public string CompanyName { get; set; }
        public string EntryGate { get; set; }
        public string VehicleNumber { get; set; }
        public string IssueDate { get; set; }
        public string Status { get; set; }

        public string VisitorName { get; set; }
        public string VisitorCompanyName { get; set; }
        public string VisitorCnicPassportNumber { get; set; }
        public string VisitorEntryGate { get; set; }
        public string VisitorVehicleNumber { get; set; }
    }
}