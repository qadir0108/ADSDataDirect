using System;
using System.Collections.Generic;
using System.Web.Mvc;
using ADSDataDirect.Core.Entities;
using System.Data.Entity;
using System.IO;
using System.Linq;
using ADSDataDirect.Web.Helpers;
using ADSDataDirect.Core.DB;

namespace ADSDataDirect.Web.Controllers
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
                Db.Customers.Add(new Customer
                {
                    Id = Guid.NewGuid(),
                    CreatedAt = DateTime.Now,
                    WhiteLabel = dic.Key.Trim(),
                    CompanyName = dic.Key.Trim(),
                    CompanyLogo = "logo1.png",
                    ReportTemplate = "Tracking1",
                    WebDomain = dic.Value.Trim(),
                    Email = "josh.silver@adsdatadirect.com",
                    Phone = "(123)-1234-1234"
                });
            }
            Db.SaveChanges();
            return View("Success");
        }

        public ActionResult Split()
        {
           
            CsvFile.DefaultCsvDefinition = new CsvDefinition()
            {
                EndOfLine = "\r\n",
                FieldSeparator = ',',
                TextQualifier = '"',
                Columns =
                                new List<string>
                                {
                            "SalesMasterId",
                            "FirstName",
                            "LastName",
                            "Address",
                            "City",
                            "State",
                            "Zip",
                            "Zip4",
                            "Apt",
                            "Dealership_ID",
                            "Index"
                                }
            };
            List<SegmentResponse1> data = CsvFile.Read<SegmentResponse1>(@"D:\\3072data.csv").ToList();
            data.Sort((x, y) => x.Index.CompareTo(y.Index));

            Campaign campaign =
                           Db.Campaigns.Include(x => x.Segments).FirstOrDefault(x => x.OrderNumber == "3072");

            foreach (var segment in campaign.Segments.OrderBy(x => x.SegmentNumber))
            {
                string fileName1 = $"{campaign.OrderNumber}\\{segment.SegmentNumber}data.csv";
                var filePath1 = $"{UploadPath}\\{fileName1}";
                var data1 =
                    data.Where(x => x.Index >= segment.FirstRangeStart && x.Index <= segment.FirstRangeEnd).ToList();
                var data2 =
                    data.Where(x => x.Index >= segment.SecondRangeStart && x.Index <= segment.SecondRangeEnd)
                        .ToList();
                var data3 =
                    data.Where(x => x.Index >= segment.ThirdRangeStart && x.Index <= segment.ThirdRangeEnd).ToList();
                data2.AddRange(data3);
                data1.AddRange(data2);
                data1.Sort((x, y) => x.Index.CompareTo(y.Index));
                data1.ToCsv(filePath1, new CsvDefinition()
                {
                    EndOfLine = "\r\n",
                    FieldSeparator = ',',
                    TextQualifier = '"',
                    Columns =
                        new List<string>
                        {
                                "SalesMasterId",
                                "FirstName",
                                "LastName",
                                "Address",
                                "City",
                                "State",
                                "Zip",
                                "Zip4",
                                "Apt",
                                "Dealership_ID",
                                "Index"
                        }
                });
            }
            return View("Success");
        }
    }
}