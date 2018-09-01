using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.Helpers;
using ADSDataDirect.Web.Models;
using PagedList;
using ADSDataDirect.Infrastructure.DynamicCoding;
using ADSDataDirect.Infrastructure.Csv;

namespace ADSDataDirect.Web.Controllers
{
    [Authorize]
    public class DynamicCodingController : BaseController
    {
        public ActionResult DownloadVendor(Guid? id)
        {
            List<DynamicCodingLookupVm> links = Db.DynamicCodingLookups
                .Where(x => x.CampaignId == id).ToList()
                .Select(x => DynamicCodingLookupVm.FromLookup(x))
                .ToList();

            if (links.Count == 0) return null;

            string linksDataFileName = $"{links.FirstOrDefault().OrderNumber}links.csv";

            var filePath = $"{DownloadPath}\\{linksDataFileName}";
            links.ToCsv(filePath, new CsvDefinition()
            {
                EndOfLine = "\r\n",
                FieldSeparator = ',',
                TextQualifier = '"',
                Columns =
                    new List<string>
                    {
                        "URL",
                        "Quantity",
                    }
            });
            return File(filePath, "text/csv", linksDataFileName);
        }

        public ActionResult DownloadProgress(Guid? id)
        {
            List<DynamicCodingLinkVm> links = Db.DynamicCodingLinks
                .Where(x => x.CampaignId == id).ToList()
                .Select(x => DynamicCodingLinkVm.FromLink(x))
                .ToList();

            if (links.Count == 0) return null;

            string linksDataFileName = $"{links.FirstOrDefault().OrderNumber}links_progress.csv";

            var filePath = $"{DownloadPath}\\{linksDataFileName}";
            links.ToCsv(filePath, new CsvDefinition()
            {
                EndOfLine = "\r\n",
                FieldSeparator = ',',
                TextQualifier = '"',
                Columns =
                    new List<string>
                    {
                        "SalesMasterId",
                        "URLType",
                        "VerumURL",
                        "PartnerURL",
                        "IfURLRedemed"
                    }
            });
            return File(filePath, "text/csv", linksDataFileName);
        }

    }
}