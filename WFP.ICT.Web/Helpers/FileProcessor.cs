using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;
using WFP.ICT.S3;

namespace WFP.ICT.Web.Helpers
{
    public class FileProcessor
    {
        public FileProcessor()
        {
            
        }

        public static void ProcessFiles(EmailThreadParams threadParams)
        {
            var UploadPath = threadParams.UploadPath;
            using (var db = new WFPICTContext())
            {
                var campaign = db.Campaigns.FirstOrDefault(x => x.Id == threadParams.idFirst);
                var campaignTesting = db.CampaignsTesting.FirstOrDefault(x => x.CampaignId == threadParams.idFirst);

                var directory = string.Format("{0}\\{1}", UploadPath, campaign.OrderNumber);
                if (!Directory.Exists(directory)) Directory.CreateDirectory(directory);

                // HtmlImagesURL
                try
                {
                    if (!string.IsNullOrEmpty(campaignTesting.HtmlImageFiles))
                    {
                        string filePath = Path.Combine(UploadPath, campaignTesting.HtmlImageFiles);
                        S3FileManager.Download(campaignTesting.HtmlImageFiles, filePath);
                        var result = FileManager.ProcessHtmlZip(UploadPath, filePath, campaign.OrderNumber, campaign.IsAddOptOut, campaign.IsAddViewInBrowser);
                        campaignTesting.CreativeURL = result.filePathLive;
                        campaignTesting.HtmlImagesStatus = (int)result.Status;
                    }
                }
                catch (Exception ex)
                {
                    campaignTesting.HtmlImagesStatus = (int)UploadFileStatusEnum.Failed;
                }
                db.SaveChanges();

                // ZipCodeFile
                try
                {
                    if (!string.IsNullOrEmpty(campaignTesting.ZipCodeFile))
                    {
                        string filePath = Path.Combine(UploadPath, campaignTesting.ZipCodeFile);
                        S3FileManager.Download(campaignTesting.ZipCodeFile, filePath);
                        campaignTesting.ZipURL = FileManager.UploadFile(UploadFileTypeEnum.ZipFile, filePath,
                            campaign.OrderNumber);
                        campaignTesting.ZipURLStatus = (int) UploadFileStatusEnum.Completed;
                    }
                }
                catch (Exception ex)
                {
                    campaignTesting.ZipURLStatus = (int)UploadFileStatusEnum.Failed;
                }
                db.SaveChanges();

                // TestSeedList
                try
                {
                    if (!string.IsNullOrEmpty(campaignTesting.TestSeedList))
                    {
                        string filePath = Path.Combine(UploadPath, campaignTesting.TestSeedList);
                        S3FileManager.Download(campaignTesting.TestSeedList, filePath);
                        campaignTesting.TestSeedURL = FileManager.UploadFile(UploadFileTypeEnum.TestSeedFile, filePath, campaign.OrderNumber);
                        campaignTesting.TestSeedStatus = (int)UploadFileStatusEnum.Completed;
                    }
                }
                catch (Exception ex)
                {
                    campaignTesting.TestSeedStatus = (int)UploadFileStatusEnum.Failed;
                }
                db.SaveChanges();

                // Final SeedList
                try
                {
                    if (!string.IsNullOrEmpty(campaignTesting.FinalSeedList))
                    {
                        string filePath = Path.Combine(UploadPath, campaignTesting.FinalSeedList);
                        S3FileManager.Download(campaignTesting.FinalSeedList, filePath);
                        campaignTesting.LiveSeedURL = FileManager.UploadFile(UploadFileTypeEnum.LiveSeedFile, filePath,
                            campaign.OrderNumber);
                        campaignTesting.LiveSeedStatus = (int) UploadFileStatusEnum.Completed;
                    }
                }
                catch (Exception ex)
                {
                    campaignTesting.LiveSeedStatus = (int)UploadFileStatusEnum.Failed;
                }
                db.SaveChanges();

                // Suppression
                try
                {
                    if (!string.IsNullOrEmpty(campaign.SuppressionFile))
                    {
                        string filePath = Path.Combine(UploadPath, campaign.SuppressionFile);
                        S3FileManager.Download(campaign.SuppressionFile, filePath);
                        campaignTesting.SuppressionURL = FileManager.UploadFile(UploadFileTypeEnum.SuppressionFile,
                            filePath, campaign.OrderNumber);
                        campaignTesting.SuppressionStatus = (int) UploadFileStatusEnum.Completed;
                    }
                }
                catch (Exception ex)
                {
                    campaignTesting.SuppressionStatus = (int)UploadFileStatusEnum.Failed;
                }
                db.SaveChanges();
                
            }
        }
    }
}