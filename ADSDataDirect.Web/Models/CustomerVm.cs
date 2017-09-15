using System.ComponentModel.DataAnnotations;

namespace ADSDataDirect.Web.Models
{
    public class CustomerVm
    {
        public string Id { get; set; }
        
        [Required]
        public string WhiteLabel { get; set; } // MM
        public string CompanyName { get; set; }

        [Required]
        public string CompanyLogo { get; set; }

        [Required]
        public string ReportTemplate { get; set; }

        [Required]
        public string WebDomain { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string DateCreated { get; set; }

        public string CompanyLogoImage => $"../images/{CompanyLogo}";
        public string ReportTemplateImage => $"../images/{System.IO.Path.GetFileNameWithoutExtension(ReportTemplate)?.ToLowerInvariant()}.png";
    }
}