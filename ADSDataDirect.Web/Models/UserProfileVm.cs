namespace ADSDataDirect.Web.Models
{
    public class UserProfileVm
    {
        public string Id { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string CcEmails { get; set; }
        public string Phone { get; set; }
        public int Status { get; set; }
        public int Type { get; set; }
        public string DateCreated { get; set; }

        public bool IsUsesApi { get; set; }
        public string ApiKey { get; set; }
        public bool IsTestsCreatives { get; set; }

        public string CustomerId { get; set; }
    }
}