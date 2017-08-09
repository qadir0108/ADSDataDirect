using System;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Async
{
    public class FileProcessor
    {
        public FileProcessor()
        {
            
        }

        public static void ProcessNewOrder(string OrderNumber, WFPUser user)
        {
            using (var db = new WFPICTContext())
            {
                var campaign = db.Campaigns.Include(x => x.Assets)
                                 .FirstOrDefault(x => x.OrderNumber == OrderNumber);

                if (!string.IsNullOrEmpty(campaign.Assets.CreativeFiles))
                {
                    string amazonFileKey = string.Format("{0}/{0}_html.zip", campaign.OrderNumber);
                    S3FileManager.Move(campaign.Assets.CreativeFiles, amazonFileKey, campaign.OrderNumber, true);
                    campaign.Assets.CreativeFiles = amazonFileKey;
                }
                if (!string.IsNullOrEmpty(campaign.Assets.ZipCodeFile))
                {
                    string amazonFileKey = string.Format("{0}/{0}zip.csv", campaign.OrderNumber);
                    S3FileManager.Move(campaign.Assets.ZipCodeFile, amazonFileKey, campaign.OrderNumber, true);
                    campaign.Assets.ZipCodeFile = amazonFileKey;
                }
                if (!string.IsNullOrEmpty(campaign.Assets.TestSeedFile))
                {
                    string amazonFileKey = string.Format("{0}/{0}test.csv", campaign.OrderNumber);
                    S3FileManager.Move(campaign.Assets.TestSeedFile, amazonFileKey, campaign.OrderNumber, true);
                    campaign.Assets.TestSeedFile = amazonFileKey;
                }
                if (!string.IsNullOrEmpty(campaign.Assets.LiveSeedFile))
                {
                    string amazonFileKey = string.Format("{0}/{0}live.csv", campaign.OrderNumber);
                    S3FileManager.Move(campaign.Assets.LiveSeedFile, amazonFileKey, campaign.OrderNumber, true);
                    campaign.Assets.LiveSeedFile = amazonFileKey;
                }
                if (!string.IsNullOrEmpty(campaign.Assets.SuppressionFile))
                {
                    string amazonFileKey = string.Format("{0}/{0}supp.csv", campaign.OrderNumber);
                    S3FileManager.Move(campaign.Assets.SuppressionFile, amazonFileKey, campaign.OrderNumber, true);
                    campaign.Assets.SuppressionFile = amazonFileKey;
                }
                if (!string.IsNullOrEmpty(campaign.Assets.BannersFile))
                {
                    string amazonFileKey = string.Format("{0}/{0}_banner{1}", campaign.OrderNumber, Path.GetExtension(campaign.Assets.BannersFile));
                    S3FileManager.Move(campaign.Assets.BannersFile, amazonFileKey, campaign.OrderNumber, true);
                    campaign.Assets.BannersFile = amazonFileKey;
                }
                if (!string.IsNullOrEmpty(campaign.Assets.BannerLinksFile))
                {
                    string amazonFileKey = string.Format("{0}/{0}_bannerlinks{1}", campaign.OrderNumber, Path.GetExtension(campaign.Assets.BannerLinksFile));
                    S3FileManager.Move(campaign.Assets.BannerLinksFile, amazonFileKey, campaign.OrderNumber, true);
                    campaign.Assets.BannerLinksFile = amazonFileKey;
                }
                if (!string.IsNullOrEmpty(campaign.Assets.MiscFile))
                {
                    string amazonFileKey = string.Format("{0}/{0}_misc{1}", campaign.OrderNumber, Path.GetExtension(campaign.Assets.MiscFile));
                    S3FileManager.Move(campaign.Assets.MiscFile, amazonFileKey, campaign.OrderNumber, true);
                    campaign.Assets.MiscFile = amazonFileKey;
                }
                db.SaveChanges();

                EmailHelper.SendOrderEmailToClient(user, campaign);
            }
        }

        public static string AdjustNewFile(UploadFileVM fileVm, string filePath)
        {
            string amazonFileKey = "";
            using (var db = new WFPICTContext())
            {
                var campaign = db.Campaigns.Include(x => x.Assets).FirstOrDefault(x => x.OrderNumber == fileVm.OrderNumber);
                
                switch (fileVm.FileType)
                {
                    case "HtmlImageFiles":
                        amazonFileKey = campaign.Assets.CreativeFiles;
                        string newFile1 = string.Format("{0}/{0}_html_1.zip", campaign.OrderNumber);
                        S3FileManager.Move(campaign.Assets.CreativeFiles, newFile1, campaign.OrderNumber, true);
                        S3FileManager.Upload(campaign.Assets.CreativeFiles, filePath);
                        campaign.Assets.CreativeFiles = newFile1;
                        break;
                    
                    case "ZipCodeFile":
                        if (string.IsNullOrEmpty(campaign.Assets.ZipCodeFile))
                        {
                            
                        }
                        amazonFileKey = campaign.Assets.ZipCodeFile;
                        string newFile2 = string.Format("{0}/{0}zip_1.csv", campaign.OrderNumber);
                        S3FileManager.Move(campaign.Assets.ZipCodeFile, newFile2, campaign.OrderNumber, true);
                        S3FileManager.Upload(campaign.Assets.ZipCodeFile, filePath);
                        campaign.Assets.ZipCodeFile = newFile2;
                        break;

                    case "TestSeedList":
                        amazonFileKey = campaign.Assets.TestSeedFile;
                        string newFile3 = string.Format("{0}/{0}test_1.csv", campaign.OrderNumber);
                        S3FileManager.Move(campaign.Assets.TestSeedFile, newFile3, campaign.OrderNumber, true);
                        S3FileManager.Upload(campaign.Assets.TestSeedFile, filePath);
                        campaign.Assets.TestSeedFile = newFile3;
                        break;

                    case "FinalSeedList":
                        amazonFileKey = campaign.Assets.LiveSeedFile;
                        string newFile4 = string.Format("{0}/{0}live_1.csv", campaign.OrderNumber);
                        S3FileManager.Move(campaign.Assets.LiveSeedFile, newFile4, campaign.OrderNumber, true);
                        S3FileManager.Upload(campaign.Assets.LiveSeedFile, filePath);
                        campaign.Assets.LiveSeedFile = newFile4;
                        break;
                }
                db.SaveChanges();
                return amazonFileKey;
            }
        }

        public static void ProcessFiles(string UploadPath, string OrderNumber)
        {
            using (var db = new WFPICTContext())
            {
                var campaign = db.Campaigns.Include(x => x.Assets).FirstOrDefault(x => x.OrderNumber == OrderNumber);
                
                var directory = string.Format("{0}\\{1}", UploadPath, campaign.OrderNumber);
                if (!Directory.Exists(directory)) Directory.CreateDirectory(directory);

                // HtmlImagesURL
                try
                {
                    if (!string.IsNullOrEmpty(campaign.Assets.CreativeFiles))
                    {
                        string filePath = Path.Combine(UploadPath, campaign.Assets.CreativeFiles);
                        S3FileManager.Download(campaign.Assets.CreativeFiles, filePath);
                        var result = FileManager.ProcessHtmlZip(UploadPath, filePath, campaign.OrderNumber, campaign.IsAddOptOut, campaign.IsAddViewInBrowser);
                        campaign.Assets.CreativeUrl = result.filePathLive;
                        campaign.Assets.CreativeStatus = (int)result.Status;
                    }
                }
                catch (Exception ex)
                {
                    campaign.Assets.CreativeStatus = (int)UploadFileStatusEnum.Failed;
                }
                db.SaveChanges();

                campaign.Assets.ZipCodeUrl = FileManager.GetFilePathLive(UploadFileTypeEnum.ZipFile, campaign.OrderNumber);
                campaign.Assets.ZipCodeStatus = (int)UploadFileStatusEnum.Completed;
                // TestSeedList
                campaign.Assets.TestSeedUrl = FileManager.GetFilePathLive(UploadFileTypeEnum.TestSeedFile, campaign.OrderNumber);
                campaign.Assets.TestSeedStatus = (int)UploadFileStatusEnum.Completed;
                // Final SeedList
                campaign.Assets.LiveSeedUrl = FileManager.GetFilePathLive(UploadFileTypeEnum.LiveSeedFile, campaign.OrderNumber);
                campaign.Assets.LiveSeedStatus = (int) UploadFileStatusEnum.Completed;
                // Suppression
                campaign.Assets.SuppressionUrl = FileManager.GetFilePathLive(UploadFileTypeEnum.SuppressionFile, campaign.OrderNumber);
                campaign.Assets.SuppressionStatus = (int) UploadFileStatusEnum.Completed;
                db.SaveChanges();
            }
        }
    }
}