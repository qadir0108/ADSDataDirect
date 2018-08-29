using System.ComponentModel.DataAnnotations;

namespace ADSDataDirect.Web.Models
{
    public class CustomerVm
    {
        public string Id { get; set; }
        public string DateCreated { get; set; }

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

        public bool IsUseOpenModel { get; set; }
        public long OpenInitial { get; set; }
        public long OpenEnd { get; set; }
        public long ClickInitial { get; set; }
        public long ClickEnd { get; set; }

        public string CompanyLogoImage => $"../images/{CompanyLogo}";
        public string ReportTemplateImage => $"../images/{System.IO.Path.GetFileNameWithoutExtension(ReportTemplate)?.ToLowerInvariant()}.png";
    }
}