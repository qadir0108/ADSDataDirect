﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSDataDirect.Core.Entities
{
    public class Customer : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }

        public string WhiteLabel { get; set; } // MM
        public string CompanyName { get; set; }
        public string CompanyLogo { get; set; }
        public string ReportTemplate { get; set; }
        public string WebDomain { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }

        public bool IsUseOpenModel { get; set; }
        public long OpenInitial { get; set; }
        public long OpenEnd { get; set; }
        public long ClickInitial { get; set; }
        public long ClickEnd { get; set; }

        public Customer()
        {
        }
    }
}
