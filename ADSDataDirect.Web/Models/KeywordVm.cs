using System.ComponentModel.DataAnnotations;

namespace ADSDataDirect.Web.Models
{
    public class KeywordVm
    {
        public string Id { get; set; }
        public string DateCreated { get; set; }

        public int Index { get; set; }

        [Required]
        public string Keyword { get; set; }

        [Required]
        public float RulePercentage { get; set; }
    }
}