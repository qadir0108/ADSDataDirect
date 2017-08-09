using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using ADSDataDirect.Enums;
using WFP.ICT.Data;
using WFP.ICT.Data.DB;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;
using WFP.ICT.Web.Helpers;

namespace WFP.ICT.Web.Async
{
    public class DataFileProcessor
    {
        public DataFileProcessor()
        {
            
        }
       
        public static async Task FetchSQLDataFile(string UploadPath, string OrderNumber, string ZipCodeFile, long DataQuantity)
        {
            string ZipFilePath = Path.Combine(UploadPath, ZipCodeFile);
            S3FileManager.Download(ZipCodeFile, ZipFilePath);
            var list = new List<string>();
            foreach (var line in File.ReadAllLines(ZipFilePath))
            {
                var trimmed = StringHelper.Trim(line);
                if (string.IsNullOrEmpty(trimmed)) continue;

                list.Add(trimmed);
            }

            var data = SegmentDataManager.FetchSegmentsData(new SegmentParameters()
            {
                DataQuantity = DataQuantity,
                CustomerCode = SegmentDataManager.CustomerCode,
                ZipCodes = list
            });

            string fileName = string.Format("{0}\\{0}data.csv", OrderNumber);
            var filePath = string.Format("{0}\\{1}", UploadPath, fileName);
            data.ToCsv(filePath, new CsvDefinition()
             {
                 EndOfLine = "\r\n",
                 FieldSeparator = ',',
                 TextQualifier = '"',
                 Columns = new List<string> { "SalesMasterId", "FirstName", "LastName", "Address", "City", "State", "Zip", "Zip4", "Apt", "Dealership_ID", "Index" }
             });

            string amazonFileKey = string.Format("{0}/{0}data.csv", OrderNumber);
            S3FileManager.Upload(amazonFileKey, filePath, true);
            
            using (var db = new WFPICTContext())
            {

                Campaign campaign = db.Campaigns.FirstOrDefault(x => x.OrderNumber == OrderNumber);

                var campaignTesting = db.CampaignsTesting.Include(x => x.Segments).FirstOrDefault(x => x.CampaignId == campaign.Id);
                campaignTesting.DataFileUrl = amazonFileKey;
                campaignTesting.DateFetched = DateTime.Now;
                db.SaveChanges();

                // Make Segments files
                foreach (var segment in campaignTesting.Segments.OrderBy(x => x.SegmentNumber))
                {
                    string fileName1 = string.Format("{0}\\{1}data.csv", campaign.OrderNumber, segment.SegmentNumber);
                    var filePath1 = string.Format("{0}\\{1}", UploadPath, fileName1);
                    var data1 = data.Where(x => x.Index >= segment.FirstRangeStart && x.Index <= segment.FirstRangeEnd).ToList();
                    var data2 = data.Where(x => x.Index >= segment.SecondRangeStart && x.Index <= segment.SecondRangeEnd).ToList();
                    var data3 = data.Where(x => x.Index >= segment.ThirdRangeStart && x.Index <= segment.ThirdRangeEnd).ToList();
                    data2.AddRange(data3);
                    data1.AddRange(data2);
                    data1.ToCsv(filePath1, new CsvDefinition()
                    {
                        EndOfLine = "\r\n",
                        FieldSeparator = ',',
                        TextQualifier = '"',
                        Columns = new List<string> { "SalesMasterId", "FirstName", "LastName", "Address", "City", "State", "Zip", "Zip4", "Apt", "Dealership_ID", "Index" }
                    });
                    string amazonFileKey1 = string.Format("{0}/{1}data.csv", campaign.OrderNumber, segment.SegmentNumber);
                    S3FileManager.Upload(amazonFileKey1, filePath, true);

                    segment.SegmentDataFileUrl = FileManager.GetFilePathLive(UploadFileTypeEnum.DataFile, campaign.OrderNumber, segment.SegmentNumber);
                    segment.DateFetched = DateTime.Now;
                    segment.UploadStatus = (int)UploadFileStatusEnum.Completed;
                    segment.SegmentStatus = (int) SegmentStatusEnum.Generated;
                    
                }
                db.SaveChanges();
            }
        }
    }
}