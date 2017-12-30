using ADSDataDirect.Web.Async.Helpers;
using ADSDataDirect.Web.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using ADSDataDirect.Core.Entities;

namespace ADSDataDirect.Web.Helpers
{
    public static class DynamicCodingHelper
    {
        public static void ProcessInput(WfpictContext db, string uploadPath, string dataFileUrl, string dynamicCodingFile, Guid? campaignId, string orderNumber)
        {
            List<DynamicCodingInput> inputs;
            try
            {
                inputs = LoadLookupInput(uploadPath, dynamicCodingFile);
            }
            catch (Exception ex)
            {
                throw new Exception("There is something wrong with Dynamic Coding File. Please upload correct one." + ex.Message);
            }

            int TotalQuantityRequired = inputs.Sum(x => x.Qunatity);

            // Process Data file
            string dataFilePath = Path.Combine(uploadPath, dataFileUrl);
            S3FileManager.Download(dataFileUrl, dataFilePath);
            List<string> salesIds = GetRandomSalesIds(dataFilePath, TotalQuantityRequired);

            if (salesIds.Count < TotalQuantityRequired)
                throw new Exception("Sales Ids are less than required in the Dynamic links file. Please increase data file Quntity.");

            // Add Lookups
            db.DynamicCodingLookups.RemoveRange(db.DynamicCodingLookups.Where(x => x.CampaignId == campaignId));
            db.SaveChanges();
            int Index = 1;
            foreach (var input in inputs)
            {
                db.DynamicCodingLookups.Add(new DynamicCodingLookup()
                {
                    Id = Guid.NewGuid(),
                    CreatedAt = DateTime.Now,
                    CampaignId = campaignId,
                    OrderNumber = orderNumber,
                    OrignalURL = input.OrignalURL,
                    URLType = input.URLType,
                    Qunatity = input.Qunatity,
                    VerumURL = $"{orderNumber}/{input.URLType}/{Index}"
                });
                Index++;
            }
            db.SaveChanges();

            // Add Links
            db.DynamicCodingLinks.RemoveRange(db.DynamicCodingLinks.Where(x => x.CampaignId == campaignId));
            db.SaveChanges();
            int Index2 = 0;
            foreach (var lookUp in db.DynamicCodingLookups.Where(x => x.CampaignId == campaignId))
            {
                for (int quantity = 0; quantity < lookUp.Qunatity; quantity++)
                {
                    int salesId = Int32.Parse(salesIds[Index2]);
                    db.DynamicCodingLinks.Add(new DynamicCodingLink()
                    {
                        Id = Guid.NewGuid(),
                        CreatedAt = DateTime.Now,
                        CampaignId = campaignId,
                        OrderNumber = orderNumber,
                        SalesMasterId = salesId,
                        URLType = lookUp.URLType,
                        OrignalURL = lookUp.OrignalURL.Replace("{{unique}}", salesId.ToString()),
                        VerumURL = lookUp.VerumURL,
                        IsURLRedemed = false
                    });
                    Index2++;
                }
            }
            db.SaveChanges();
        }

        public static List<DynamicCodingInput> LoadLookupInput(string uploadPath, string dynamicCodingFile)
        {
            List<DynamicCodingInput> inputs = new List<DynamicCodingInput>();
            string dyanmicFilePath = System.IO.Path.Combine(uploadPath, dynamicCodingFile);
            S3FileManager.Download(dynamicCodingFile, dyanmicFilePath);

            try
            {
                bool isFirstHeader = true;
                foreach (var line in System.IO.File.ReadAllLines(dyanmicFilePath))
                {
                    if (isFirstHeader) { isFirstHeader = false; continue; }

                    if (string.IsNullOrEmpty(line)) continue;

                    string[] trimmedCells = line.Split(",".ToCharArray());
                    if (trimmedCells.Length != 3 || NumberHelper.Parse(trimmedCells[2]) == -1) continue;

                    inputs.Add(new DynamicCodingInput()
                    {
                        OrignalURL = trimmedCells[0],
                        URLType = trimmedCells[1],
                        Qunatity = Int32.Parse(trimmedCells[2])
                    });
                }
                return inputs;
            }
            catch (Exception ex)
            {
                throw new Exception("There is something wrong with Dynamic Coding File. Please upload correct one." + ex.Message);
            }
        }

        public static List<string> GetRandomSalesIds(string filePath, int TotalQuantity)
        {
            return StringListRandomizer.RandomArrayEntries(LoadSalesIds(filePath, true), TotalQuantity);
        }

        public static List<string> LoadSalesIds(string filePath, bool isFirstRowHeader)
        {
            List<string> salesIds = new List<string>();
            foreach (var line in File.ReadAllLines(filePath))
            {
                if(isFirstRowHeader) { isFirstRowHeader = false; continue; }
                var splitted = line.Split(",".ToCharArray());
                if (splitted.Length > 0)
                    salesIds.Add(splitted[0]);
            }
            return salesIds;
        }
        
    }
}