using System;
using System.IO;
using System.Threading.Tasks;
using System.Web.Mvc;
using WFP.ICT.Web.Async;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Controllers
{
    public sealed class FileController : BaseController
    {
        [HttpPost]
        public JsonResult UploadFile(UploadFileVM fileVm)
        {
            try
            {
                string amazonFileKey = "";
                foreach (string selectedFile in Request.Files)
                {
                    var fileContent = Request.Files[selectedFile];
                    if (fileContent != null && fileContent.ContentLength > 0)
                    {
                        var stream = fileContent.InputStream;
                        string filePath = Path.Combine(UploadPath, fileContent.FileName);
                        using (var fileStream = System.IO.File.Create(filePath))
                        {
                            stream.CopyTo(fileStream);
                        }

                        // File Validations
                        if (!fileVm.IsValid(filePath))
                        {
                            if (System.IO.File.Exists(filePath))
                                System.IO.File.Delete(filePath);
                            throw new ArgumentNullException(fileVm.FileType + " is not valid. Please upload valid file.");
                        }

                        if (fileVm.FileType == "CompanyLogo")
                        {
                            string logoFileName = FileHelper.GetValidFileName(LoggedInUser?.Id + System.IO.Path.GetExtension(fileContent.FileName));
                            string logoFilePath = Path.Combine(ImagesPath, logoFileName);
                            System.IO.File.Copy(filePath, logoFilePath, true);
                            amazonFileKey = logoFileName;
                        }
                        else if (string.IsNullOrEmpty(fileVm.OrderNumber))
                        {
                            amazonFileKey = $"{DateTime.Now:yyyyMMddHHmmss}_{fileContent.FileName}";
                            S3FileManager.Upload(amazonFileKey, filePath);
                        }
                        else if (!string.IsNullOrEmpty(fileVm.SegmentNumber)) // Data files Upload only // HtmlImageFiles2500A, HtmlImageFiles2500B
                        {
                            amazonFileKey = $"{fileVm.OrderNumber}/{fileVm.SegmentNumber}_html.zip";
                            S3FileManager.Upload(amazonFileKey, filePath, true, true);
                        }
                        else
                        {
                            switch (fileVm.FileType)
                            {
                                case "Assets_CreativeFiles":
                                    amazonFileKey = string.Format("{0}/{0}_html.zip", fileVm.OrderNumber);
                                    break;
                                case "Assets_ZipCodeFile":
                                    amazonFileKey = string.Format("{0}/{0}zip.csv", fileVm.OrderNumber);
                                    break;
                                case "Assets_TestSeedFile":
                                    amazonFileKey = string.Format("{0}/{0}test.csv", fileVm.OrderNumber);
                                    break;
                                case "Assets_LiveSeedFile":
                                    amazonFileKey = string.Format("{0}/{0}live.csv", fileVm.OrderNumber);
                                    break;
                                case "Assets_BannersFile":
                                    amazonFileKey = string.Format("{0}/{0}_banner{1}", fileVm.OrderNumber, Path.GetExtension(filePath));
                                    break;
                                case "Assets_BannerLinksFile":
                                    amazonFileKey = string.Format("{0}/{0}_bannerlinks{1}", fileVm.OrderNumber, Path.GetExtension(filePath));
                                    break;
                                case "Assets_MiscFile":
                                    amazonFileKey = string.Format("{0}/{0}_misc{1}", fileVm.OrderNumber, Path.GetExtension(filePath));
                                    break;
                            }
                            S3FileManager.Upload(amazonFileKey, filePath, true, true);
                        }

                        // Delete local
                        if (System.IO.File.Exists(filePath))
                            System.IO.File.Delete(filePath);
                    }
                }

                return Json(new JsonResponse() { IsSucess = true, Result = amazonFileKey });
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = "Upload failed " + ex.Message });
            }
        }

        [HttpGet]
        public ActionResult DownloadFile(UploadFileVM fileVm)
        {
            string filePath = Path.Combine(UploadPath, fileVm.FileName);
            if (fileVm.FileType == "CompanyLogo")
            {
                filePath = Path.Combine(ImagesPath, fileVm.FileName);
            }
                else
            {
                S3FileManager.Download(fileVm.FileName, filePath);
            }
            return File(filePath, "text/csv", fileVm.FileName);
        }

        [HttpPost]
        public JsonResult DeleteFile(UploadFileVM fileVm)
        {
            try
            {
                if (fileVm.FileType == "CompanyLogo")
                {
                    string filePath = Path.Combine(ImagesPath, fileVm.FileName);
                    if (System.IO.File.Exists(filePath))
                        System.IO.File.Delete(filePath);
                }
                else
                {
                    S3FileManager.Delete(fileVm.FileName);
                }
                return Json(new JsonResponse() {IsSucess = true});
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() {IsSucess = false, ErrorMessage = "File Delete failed. " + ex.Message });
            }
        }
    }
}