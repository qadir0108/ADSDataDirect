using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using ADSDataDirect.Core;
using ADSDataDirect.Core.DB;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.Async.Helpers;
using ADSDataDirect.Web.Helpers;

namespace ADSDataDirect.Web.Async
{
    public static class DataFileProcessor
    {
        public static void FetchSqlDataFile(string uploadPath, string orderNumber, string zipCodeFile, long dataQuantity)
        {
            using (var db = new WfpictContext())
            {
                LogHelper.AddLog(db, LogType.DataProcessing, orderNumber, $"SQL Data files processing started at {DateTime.Now}");
                try
                {
                    // Zip file processing
                    string zipFilePath = Path.Combine(uploadPath, zipCodeFile);
                    S3FileManager.Download(zipCodeFile, zipFilePath);
                    var list = new List<string>();
                    foreach (var line in File.ReadAllLines(zipFilePath))
                    {
                        var trimmed = StringHelper.Trim(line);
                        if (string.IsNullOrEmpty(trimmed)) continue;
                        list.Add(trimmed);
                    }
                    LogHelper.AddLog(db, LogType.DataProcessing, orderNumber, zipCodeFile + " processed sucessfully.");

                    // SQL Data file
                    try
                    {
                        var data = SegmentDataManager.FetchSegmentsData(db, new SegmentParameters
                        {
                            DataQuantity = dataQuantity,
                            CustomerCode = SegmentDataManager.CustomerCode,
                            ZipCodes = list
                        });

                        LogHelper.AddLog(db, LogType.DataProcessing, orderNumber, $"{data.Count} records feteched sucessfully.");

                        // write to local data file
                        string amazonFileKey = $"{orderNumber}\\{orderNumber}data.csv";
                        var filePath = $"{uploadPath}\\{amazonFileKey}";
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
                            "Index"
                                }
                        });
                        S3FileManager.Upload(amazonFileKey, filePath, true);
                        LogHelper.AddLog(db, LogType.DataProcessing, orderNumber, $"{amazonFileKey} data file generated and uploaded to Amazon sucessfully.");

                        // Generating Segment data files
                        Campaign campaign =
                            db.Campaigns.Include(x => x.Segments).FirstOrDefault(x => x.OrderNumber == orderNumber);

                        var campaignTesting = db.CampaignsTesting.FirstOrDefault(x => x.CampaignId == campaign.Id);
                        campaignTesting.DataFileUrl = amazonFileKey;
                        campaignTesting.DateFetched = DateTime.Now;
                        db.SaveChanges();

                        foreach (var segment in campaign.Segments.OrderBy(x => x.SegmentNumber))
                        {
                            string amazonFileKey1 = $"{campaign.OrderNumber}\\{segment.SegmentNumber}data.csv";
                            var filePath1 = $"{uploadPath}\\{amazonFileKey1}";
                            var data1 =
                                data.Where(x => x.Index >= segment.FirstRangeStart && x.Index <= segment.FirstRangeEnd).ToList();
                            var data2 =
                                data.Where(x => x.Index >= segment.SecondRangeStart && x.Index <= segment.SecondRangeEnd)
                                    .ToList();
                            var data3 =
                                data.Where(x => x.Index >= segment.ThirdRangeStart && x.Index <= segment.ThirdRangeEnd).ToList();
                            data2.AddRange(data3);
                            data1.AddRange(data2);
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
                            S3FileManager.Upload(amazonFileKey1, filePath, true);

                            segment.SegmentDataFileUrl = FileManager.GetFilePathLive(UploadFileType.DataFile,
                                campaign.OrderNumber, string.Empty, segment.SegmentNumber);
                            segment.DateFetched = DateTime.Now;
                            segment.UploadStatus = (int)UploadFileStatus.Completed;
                            segment.SegmentStatus = (int)SegmentStatus.Generated;

                            LogHelper.AddLog(db, LogType.DataProcessing, orderNumber,
                                amazonFileKey1 + " data file generated and uploaded to Amazon sucessfully.");

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
    }
}