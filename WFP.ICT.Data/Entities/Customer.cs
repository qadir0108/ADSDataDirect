﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace WFP.ICT.Data.Entities
{
    public class Customer : BaseEntity, IBaseEntity
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid Id { get; set; }
        
        public string Code { get; set; }
        public string Name { get; set; }
        public string WebDomain { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        
        public Customer()
        {
        }
    }
}