using System;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;
using WFP.ICT.Web.Async.Helpers;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Async
{
    public static class FileProcessor
    {
        public static void ProcessNewOrder(string orderNumber, string userName)
        {
            using (var db = new WfpictContext())
            {
                var campaign = db.Campaigns.Include(x => x.Assets).Include(x => x.Segments)
                                 .FirstOrDefault(x => x.OrderNumber == orderNumber);

                var user = db.Users.FirstOrDefault(x => x.UserName == userName);

                var ads = db.Vendors.FirstOrDefault(x => x.Name.Contains("ADS"));

                if (!string.IsNullOrEmpty(campaign.Assets.CreativeFiles))
                {
                    string amazonFileKey = string.Format("{0}/{0}_html.zip", campaign.OrderNumber);
                    S3FileManager.Move(campaign.Assets.CreativeFiles, amazonFileKey, campaign.OrderNumber, true);
                    campaign.Assets.CreativeFiles = amazonFileKey;
                    LogHelper.AddLog(db, LogType.FileProcessing, orderNumber, "CreativeFiles moved to " + amazonFileKey);
                }
                if (!string.IsNullOrEmpty(campaign.Assets.ZipCodeFile))
                {
                    string amazonFileKey = string.Format("{0}/{0}zip.csv", campaign.OrderNumber);
                    S3FileManager.Move(campaign.Assets.ZipCodeFile, amazonFileKey, campaign.OrderNumber, true);
                    campaign.Assets.ZipCodeFile = amazonFileKey;
                    LogHelper.AddLog(db, LogType.FileProcessing, orderNumber, "ZipCodeFile moved to " + amazonFileKey);
                }
                if (!string.IsNullOrEmpty(campaign.Assets.TestSeedFile))
                {
                    string amazonFileKey = string.Format("{0}/{0}test.csv", campaign.OrderNumber);
                    S3FileManager.Move(campaign.Assets.TestSeedFile, amazonFileKey, campaign.OrderNumber, true);
                    campaign.Assets.TestSeedFile = amazonFileKey;
                    LogHelper.AddLog(db, LogType.FileProcessing, orderNumber, "TestSeedFile moved to " + amazonFileKey);
                }
                if (!string.IsNullOrEmpty(campaign.Assets.LiveSeedFile))
                {
                    string amazonFileKey = string.Format("{0}/{0}live.csv", campaign.OrderNumber);
                    S3FileManager.Move(campaign.Assets.LiveSeedFile, amazonFileKey, campaign.OrderNumber, true);
                    campaign.Assets.LiveSeedFile = amazonFileKey;
                    LogHelper.AddLog(db, LogType.FileProcessing, orderNumber, "LiveSeedFile moved to " + amazonFileKey);
                }
                if (!string.IsNullOrEmpty(campaign.Assets.SuppressionFile))
                {
                    string amazonFileKey = string.Format("{0}/{0}supp.csv", campaign.OrderNumber);
                    S3FileManager.Move(campaign.Assets.SuppressionFile, amazonFileKey, campaign.OrderNumber, true);
                    campaign.Assets.SuppressionFile = amazonFileKey;
                    LogHelper.AddLog(db, LogType.FileProcessing, orderNumber, "SuppressionFile moved to " + amazonFileKey);
                }
                if (!string.IsNullOrEmpty(campaign.Assets.BannersFile))
                {
                    string amazonFileKey = string.Format("{0}/{0}_banner{1}", campaign.OrderNumber, Path.GetExtension(campaign.Assets.BannersFile));
                    S3FileManager.Move(campaign.Assets.BannersFile, amazonFileKey, campaign.OrderNumber, true);
                    campaign.Assets.BannersFile = amazonFileKey;
                    LogHelper.AddLog(db, LogType.FileProcessing, orderNumber, "BannersFile moved to " + amazonFileKey);
                }
                if (!string.IsNullOrEmpty(campaign.Assets.BannerLinksFile))
                {
                    string amazonFileKey = string.Format("{0}/{0}_bannerlinks{1}", campaign.OrderNumber, Path.GetExtension(campaign.Assets.BannerLinksFile));
                    S3FileManager.Move(campaign.Assets.BannerLinksFile, amazonFileKey, campaign.OrderNumber, true);
                    campaign.Assets.BannerLinksFile = amazonFileKey;
                    LogHelper.AddLog(db, LogType.FileProcessing, orderNumber, "BannerLinksFile moved to " + amazonFileKey);
                }
                if (!string.IsNullOrEmpty(campaign.Assets.MiscFile))
                {
                    string amazonFileKey = string.Format("{0}/{0}_misc{1}", campaign.OrderNumber, Path.GetExtension(campaign.Assets.MiscFile));
                    S3FileManager.Move(campaign.Assets.MiscFile, amazonFileKey, campaign.OrderNumber, true);
                    campaign.Assets.MiscFile = amazonFileKey;
                    LogHelper.AddLog(db, LogType.FileProcessing, orderNumber, "MiscFile moved to " + amazonFileKey);
                }

                foreach (var segment in campaign.Segments)
                {
                    string amazonFileKey = string.Format("{0}/{1}_html.zip", campaign.OrderNumber, segment.SegmentNumber);
                    S3FileManager.Move(segment.CreativeFiles, amazonFileKey, campaign.OrderNumber, true);
                    segment.CreativeFiles = amazonFileKey;
                    LogHelper.AddLog(db, LogType.FileProcessing, orderNumber, "Segment  " + segment.SegmentNumber + " CreativeFiles moved to " + amazonFileKey);
                }

                db.SaveChanges();

                EmailHelper.SendOrderEmailToClient(campaign, user, ads?.CcEmails);

                LogHelper.AddLog(db, LogType.Orders, campaign.OrderNumber, "New Order " + campaign.CampaignName + " has been entered into system successfully by " + campaign.RepresentativeName);
            }
        }

        public static void ProcessAssetUpdateUrls(string uploadPath, string orderNumber)
        {
            using (var db = new WfpictContext())
            {
                var campaign = db.Campaigns.Include(x => x.Assets).FirstOrDefault(x => x.OrderNumber == orderNumber);
                
                var directory = string.Format("{0}\\{1}", uploadPath, campaign.OrderNumber);
                if (!Directory.Exists(directory)) Directory.CreateDirectory(directory);

                // HtmlImagesURL
                try
                {
                    if (!string.IsNullOrEmpty(campaign.Assets.CreativeFiles))
                    {
                        string filePath = Path.Combine(uploadPath, campaign.Assets.CreativeFiles);
                        S3FileManager.Download(campaign.Assets.CreativeFiles, filePath);
                        var result = FileManager.ProcessHtmlZip(uploadPath, filePath, campaign.OrderNumber, campaign.IsAddOptOut, campaign.IsAddViewInBrowser);
                        campaign.Assets.CreativeUrl = result.filePathLive;
                        campaign.Assets.CreativeStatus = (int)result.Status;
                        LogHelper.AddLog(db, LogType.FileProcessing, orderNumber, "CreativeFiles processed: " + campaign.Assets.CreativeUrl + ", Status: " + System.Enum.GetName(typeof(UploadFileStatus), campaign.Assets.CreativeStatus));
                    }
                }
                catch (Exception ex)
                {
                    campaign.Assets.CreativeStatus = (int)UploadFileStatus.Failed;
                    LogHelper.AddError(db, LogType.FileProcessing, orderNumber, "CreativeFiles processing failed, " + ex.Message + ", Status: " + System.Enum.GetName(typeof(UploadFileStatus), campaign.Assets.CreativeStatus));
                }
                db.SaveChanges();

                if (!string.IsNullOrEmpty(campaign.Assets.ZipCodeFile))
                {

                    campaign.Assets.ZipCodeUrl = FileManager.GetFilePathLive(UploadFileType.ZipFile,
                        campaign.OrderNumber);
                    campaign.Assets.ZipCodeStatus = (int) UploadFileStatus.Completed;
                    LogHelper.AddLog(db, LogType.FileProcessing, orderNumber,
                        "ZipCodeFile processed: " + campaign.Assets.ZipCodeUrl + ", Status: " +
                        System.Enum.GetName(typeof(UploadFileStatus), campaign.Assets.ZipCodeStatus));
                }

                // TestSeedList
                if (!string.IsNullOrEmpty(campaign.Assets.TestSeedFile))
                {
                    campaign.Assets.TestSeedUrl = FileManager.GetFilePathLive(UploadFileType.TestSeedFile,
                        campaign.OrderNumber);
                    campaign.Assets.TestSeedStatus = (int) UploadFileStatus.Completed;
                    LogHelper.AddLog(db, LogType.FileProcessing, orderNumber,
                        "TestSeedFile processed: " + campaign.Assets.TestSeedUrl + ", Status: " +
                       System.Enum.GetName(typeof(UploadFileStatus), campaign.Assets.TestSeedStatus));
                }

                // Final SeedList
                if (!string.IsNullOrEmpty(campaign.Assets.LiveSeedFile))
                {
                    campaign.Assets.LiveSeedUrl = FileManager.GetFilePathLive(UploadFileType.LiveSeedFile,
                        campaign.OrderNumber);
                    campaign.Assets.LiveSeedStatus = (int) UploadFileStatus.Completed;
                    LogHelper.AddLog(db, LogType.FileProcessing, orderNumber,
                        "LiveSeedFile processed: " + campaign.Assets.LiveSeedUrl + ", Status: " +
                        System.Enum.GetName(typeof(UploadFileStatus), campaign.Assets.LiveSeedStatus));
                }

                // Suppression
                if (!string.IsNullOrEmpty(campaign.Assets.SuppressionFile))
                {
                    campaign.Assets.SuppressionUrl = FileManager.GetFilePathLive(UploadFileType.SuppressionFile,
                        campaign.OrderNumber);
                    campaign.Assets.SuppressionStatus = (int) UploadFileStatus.Completed;
                    LogHelper.AddLog(db, LogType.FileProcessing, orderNumber,
                        "SuppressionFile processed: " + campaign.Assets.SuppressionUrl + ", Status: " +
                        System.Enum.GetName(typeof(UploadFileStatus), campaign.Assets.SuppressionStatus));
                }
                db.SaveChanges();

                // Banner
                if (!string.IsNullOrEmpty(campaign.Assets.BannersFile))
                {
                    campaign.Assets.BannersUrl = FileManager.GetFilePathLive(UploadFileType.BannersFile,
                        campaign.OrderNumber, Path.GetExtension(campaign.Assets.BannersFile));
                    campaign.Assets.BannersStatus = (int)UploadFileStatus.Completed;
                    LogHelper.AddLog(db, LogType.FileProcessing, orderNumber,
                        "BannersFile processed: " + campaign.Assets.BannersUrl + ", Status: " +
                        System.Enum.GetName(typeof(UploadFileStatus), campaign.Assets.BannersStatus));
                }

                // Banner Links
                if (!string.IsNullOrEmpty(campaign.Assets.BannerLinksFile))
                {
                    campaign.Assets.BannerLinksUrl = FileManager.GetFilePathLive(UploadFileType.BannersLinksFile,
                       campaign.OrderNumber, Path.GetExtension(campaign.Assets.BannerLinksFile));
                    campaign.Assets.BannerLinksStatus = (int)UploadFileStatus.Completed;
                    LogHelper.AddLog(db, LogType.FileProcessing, orderNumber,
                        "BannerLinksFile processed: " + campaign.Assets.BannerLinksUrl + ", Status: " +
                        System.Enum.GetName(typeof(UploadFileStatus), campaign.Assets.BannerLinksStatus));
                }

                // Misc
                if (!string.IsNullOrEmpty(campaign.Assets.MiscFile))
                {
                    campaign.Assets.MiscUrl = FileManager.GetFilePathLive(UploadFileType.MiscFile,
                       campaign.OrderNumber, Path.GetExtension(campaign.Assets.MiscFile));
                    campaign.Assets.MiscStatus = (int)UploadFileStatus.Completed;
                    LogHelper.AddLog(db, LogType.FileProcessing, orderNumber,
                        "MiscFile processed: " + campaign.Assets.MiscUrl + ", Status: " +
                        System.Enum.GetName(typeof(UploadFileStatus), campaign.Assets.MiscStatus));
                }
            }
        }
    }
}