﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WFP.ICT.Data.Entities;

namespace WFP.ICT.Web.Controllers
{
    public class TestController : BaseController
    {
        public ActionResult AddCustomers()
        {
            Dictionary<string, string> whiteLabelDictionary = new Dictionary<string, string>()
            {
                {"ADS", "ameliorate-reporting.com"},
                {"EPM", "eprofitmarketing.net"},
                {"ACH", "email.ach-reporting.com"},
                {"Advantage", "reporting.advantagedealsv.com"},
                {"Strong", "reporting.advantagedealsv.com"},
                {"Strategus", "reporting.advantagedealsv.com"},
                {"List Solutions", "reporting.advantagedealsv.com"},
                {"Exact Data", "reporting.advantagedealsv.com"},
                {"D2D", "email.digital2dealer-reporting.com"},
                {"MM", "email.marketmasters-reporting.com"},
                {"NFM", "email.newfoundmedia-reporting.com"},
                {"CM", "reporting.consumermkts.com"},
                {"EW", "reporting.eworksemail.com"}
            };

            foreach (var dic in whiteLabelDictionary)
            {
                Db.Customers.Add(new Customer()
                {
                    Id = Guid.NewGuid(),
                    CreatedAt = DateTime.Now,
                    Code = dic.Key,
                    Name = dic.Key,
                    WebDomain = dic.Value
                });
            }
            Db.SaveChanges();
            return View("Success");
        }
    }
}