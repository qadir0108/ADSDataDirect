using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using ADSDataDirect.Core;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Infrastructure.Common;
using ADSDataDirect.Infrastructure.Csv;
using ADSDataDirect.Infrastructure.FileManagment;
using ADSDataDirect.Infrastructure.S3;

namespace ADSDataDirect.Infrastructure.DataFiles
{
    public static class DataFileProcessor
    {
        public static void FetchSqlDataFile(string uploadPath, bool isNxs, Guid campaignId, string orderNumber,
            string zipCodeFile, long dataQuantity)
        {
            using (var db = new WfpictContext())
            {
                LogHelper.AddLog(db, LogType.DataProcessing, orderNumber, $"SQL Data files processing started at {DateTime.Now}");
                try
                {
                    // Zip file processing
                    List<string> list = ProcessZipFile(db, uploadPath, zipCodeFile, orderNumber);

                    // SQL Data file
                    try
                    {
                        var data = SegmentDataManager.FetchSegmentsData(db, new SegmentParameters
                        {
                            OrderNumber = orderNumber,
                            DataQuantity = dataQuantity,
                            CustomerCode = SegmentDataManager.CustomerCode,
                            ZipCodes = list
                        });

                        LogHelper.AddLog(db, LogType.DataProcessing, orderNumber, $"{data.Count} records feteched sucessfully.");

                        // write data file
                        WriteAndUploadDataFile(data, db, uploadPath, orderNumber, campaignId);

                        if (isNxs)
                        {
                            // write opener data file
                            WriteAndUploadDataFileOpener(data, db, uploadPath, orderNumber, campaignId);
                        }

                        // Generating Segment data files
                        Campaign campaign =
                            db.Campaigns.Include(x => x.Segments).FirstOrDefault(x => x.OrderNumber == orderNumber);

                        foreach (var segment in campaign.Segments.OrderBy(x => x.SegmentNumber))
                        {
                            WriteAndUploadSegmentDataFile(data, db, segment, uploadPath, orderNumber, campaignId);
                        }
                        db.SaveChanges();

                        LogHelper.AddLog(db, LogType.DataProcessing, orderNumber, $"SQL Data files generated sucessfully at {DateTime.Now}");
                    }
                    catch (Exception ex)
                    {
                        LogHelper.AddError(db, LogType.DataProcessing, orderNumber, "Error fetching data from SQL Server " + ex.Message);
                    }

                }
                catch (Exception ex)
                {
                    LogHelper.AddError(db, LogType.DataProcessing, orderNumber, "Error processing " + zipCodeFile + " " + ex.Message);
                }
            }
        }

        private static void WriteAndUploadDataFileOpener(List<SegmentResponse> data, WfpictContext db, string uploadPath, string orderNumber, Guid campaignId)
        {
            string fileName = $"{orderNumber}\\{orderNumber}opener.csv";
            var filePath = $"{uploadPath}\\{fileName}";
            data.ToCsv(filePath, new CsvDefinition()
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
                                        "Apt"
                    }
            });
            string amazonFileKey = $"{orderNumber}/{orderNumber}opener.csv";
            S3FileManager.Upload(amazonFileKey, filePath, true);

            var campaignTesting = db.CampaignsTesting.FirstOrDefault(x => x.CampaignId == campaignId);
            if (campaignTesting != null)
            {
                campaignTesting.DataFileUrlOpener = FileManager.GetFilePathLive(UploadFileType.DataFileOpener,
                    orderNumber, string.Empty, string.Empty);
            }
            db.SaveChanges();

            LogHelper.AddLog(db, LogType.DataProcessing, orderNumber,
                fileName + " data file opener generated and uploaded to Amazon sucessfully.");

        }

        private static void WriteAndUploadSegmentDataFile(List<SegmentResponse> data, WfpictContext db, CampaignSegment segment, string uploadPath, string orderNumber, Guid campaignId)
        {
            string fileName1 = $"{orderNumber}\\{segment.SegmentNumber}data.csv";
            var filePath1 = $"{uploadPath}\\{fileName1}";
            var data1 =
                data.Where(x => x.Index >= segment.FirstRangeStart && x.Index <= segment.FirstRangeEnd).ToList();
            var data2 =
                data.Where(x => x.Index >= segment.SecondRangeStart && x.Index <= segment.SecondRangeEnd)
                    .ToList();
            var data3 =
                data.Where(x => x.Index >= segment.ThirdRangeStart && x.Index <= segment.ThirdRangeEnd).ToList();
            data2.AddRange(data3);
            data1.AddRange(data2);
            data1 = data1.OrderBy(x => x.Index).ToList();
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
                                        "Index",
                    }
            });
            string amazonFileKey1 = $"{orderNumber}/{segment.SegmentNumber}data.csv";
            S3FileManager.Upload(amazonFileKey1, filePath1, true);

            segment.SegmentDataFileUrl = FileManager.GetFilePathLive(UploadFileType.DataFile,
                orderNumber, string.Empty, segment.SegmentNumber);
            segment.DateFetched = DateTime.Now;
            segment.UploadStatus = (int)UploadFileStatus.Completed;
            segment.SegmentStatus = (int)SegmentStatus.Generated;

            LogHelper.AddLog(db, LogType.DataProcessing, orderNumber,
                fileName1 + " data file generated and uploaded to Amazon sucessfully.");

        }

        private static void WriteAndUploadDataFile(List<SegmentResponse> data, WfpictContext db, string uploadPath,
            string orderNumber, Guid campaignId)
        {
            string fileName = $"{orderNumber}\\{orderNumber}data.csv";
            var filePath = $"{uploadPath}\\{fileName}";
            data.Sort((x, y) => x.Index.CompareTo(y.Index));
            data.ToCsv(filePath, new CsvDefinition()
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
                        "Index",
                    }
            });
            string amazonFileKey = $"{orderNumber}/{orderNumber}data.csv";
            S3FileManager.Upload(amazonFileKey, filePath, true);
            LogHelper.AddLog(db, LogType.DataProcessing, orderNumber, $"{fileName} data file generated and uploaded to Amazon sucessfully.");

            var campaignTesting = db.CampaignsTesting.FirstOrDefault(x => x.CampaignId == campaignId);
            if (campaignTesting != null)
            {
                campaignTesting.DataFileUrl = amazonFileKey;
                campaignTesting.DateFetched = DateTime.Now;
            }
            db.SaveChanges();
        }

        private static List<string> ProcessZipFile(WfpictContext db, string uploadPath, string zipCodeFile, string orderNumber)
        {
            string zipFilePath = Path.Combine(uploadPath, zipCodeFile);
            S3FileManager.Download(zipCodeFile, zipFilePath);
            var list = new List<string>();
            foreach (var line in File.ReadAllLines(zipFilePath))
            {
                var trimmed = StringHelper.Trim(line);
                if (string.IsNullOrEmpty(trimmed)) continue;
                list.Add(trimmed);
            }
            LogHelper.AddLog(db, LogType.DataProcessing, orderNumber, $"ZipCodeFile {zipCodeFile} processed sucessfully.");
            return list;
        }
    }
}