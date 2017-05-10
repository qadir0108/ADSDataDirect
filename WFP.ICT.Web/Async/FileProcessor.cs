using System;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;

namespace WFP.ICT.Web.Async
{
    public class FileProcessor
    {
        public FileProcessor()
        {
            
        }
       
        public static async Task ProcessFiles(EmailThreadParams threadParams)
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
                campaignTesting.ZipURL = FileManager.GetFilePathLive(UploadFileTypeEnum.ZipFile, campaign.OrderNumber);
                campaignTesting.ZipURLStatus = (int)UploadFileStatusEnum.Completed;
                // TestSeedList
                campaignTesting.TestSeedURL = FileManager.GetFilePathLive(UploadFileTypeEnum.TestSeedFile, campaign.OrderNumber);
                campaignTesting.TestSeedStatus = (int)UploadFileStatusEnum.Completed;
                // Final SeedList
                campaignTesting.LiveSeedURL = FileManager.GetFilePathLive(UploadFileTypeEnum.LiveSeedFile, campaign.OrderNumber);
                campaignTesting.LiveSeedStatus = (int) UploadFileStatusEnum.Completed;
                // Suppression
                campaignTesting.SuppressionURL = FileManager.GetFilePathLive(UploadFileTypeEnum.SuppressionFile, campaign.OrderNumber);
                campaignTesting.SuppressionStatus = (int) UploadFileStatusEnum.Completed;
                db.SaveChanges();
            }
        }
    }
}