using System;
using System.IO;
using System.Web.Mvc;
using ADSDataDirect.Web.Models;
using ADSDataDirect.Infrastructure.S3;
using ADSDataDirect.Infrastructure.FileManagment;

namespace ADSDataDirect.Web.Controllers
{
    public sealed class FileController : BaseController
    {
        [HttpPost]
        public JsonResult UploadFile(UploadFileVm fileVm)
        {
            string amazonFileKey = "", filePath = "";
            try
            {
                if (Request.Files.Count == 0) throw new AdsException("File is not uploaded.");

                var fileContent = Request.Files[0];
                if (fileContent != null && fileContent.ContentLength > 0)
                {
                    var stream = fileContent.InputStream;
                    filePath = Path.Combine(UploadPath, fileContent.FileName);
                    using (var fileStream = System.IO.File.Create(filePath))
                    {
                        stream.CopyTo(fileStream);
                    }

                    // File Validations
                    if (!fileVm.IsValid(filePath))
                    {
                        throw new AdsException(fileVm.FileType + " is not valid. Please upload valid file.");
                    }

                    if (fileVm.FileType == "CompanyLogo")
                    {
                        string logoFileName =
                            FileHelper.GetValidFileName(LoggedInUser?.Id + Path.GetExtension(fileContent.FileName));
                        string logoFilePath = Path.Combine(ImagesPath, logoFileName);
                        System.IO.File.Copy(filePath, logoFilePath, true);
                        amazonFileKey = logoFileName;
                    }
                    else if (string.IsNullOrEmpty(fileVm.OrderNumber))
                    {
                        amazonFileKey = $"{DateTime.Now:yyyyMMddHHmmss}_{fileContent.FileName}";
                        S3FileManager.Upload(amazonFileKey, filePath);
                    }
                    else if (!string.IsNullOrEmpty(fileVm.SegmentNumber))
                        // Data files Upload only // HtmlImageFiles2500A, HtmlImageFiles2500B
                    {
                        amazonFileKey = $"{fileVm.OrderNumber}/{fileVm.SegmentNumber}_html.zip";
                        S3FileManager.Upload(amazonFileKey, filePath, true, true);
                    }
                    else
                    {
                        switch (fileVm.FileType)
                        {
                            case "OpenModelLinksFile":
                                amazonFileKey = string.Format("{0}/openmodel_links.csv", fileVm.OrderNumber);
                                break;
                            case "OpenModelImageFile":
                                amazonFileKey = string.Format("{0}/openmodel_image{1}", fileVm.OrderNumber, Path.GetExtension(filePath));
                                break;
                            case "DynamicCodingFile":
                                amazonFileKey = string.Format("{0}/dynamic_coding.csv", fileVm.OrderNumber);
                                break;
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
                                amazonFileKey = string.Format("{0}/{0}_banner{1}", fileVm.OrderNumber,
                                    Path.GetExtension(filePath));
                                break;
                            case "Assets_BannerLinksFile":
                                amazonFileKey = string.Format("{0}/{0}_bannerlinks{1}", fileVm.OrderNumber,
                                    Path.GetExtension(filePath));
                                break;
                            case "Assets_MiscFile":
                                amazonFileKey = string.Format("{0}/{0}_misc{1}", fileVm.OrderNumber,
                                    Path.GetExtension(filePath));
                                break;
                        }
                        S3FileManager.Upload(amazonFileKey, filePath, true, true);
                    }
                }

                return Json(new JsonResponse() {IsSucess = true, Result = amazonFileKey});
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() {IsSucess = false, ErrorMessage = "Upload failed " + ex.Message});
            }
            finally
            {
                // Delete local
                if (System.IO.File.Exists(filePath))
                    System.IO.File.Delete(filePath);
            }
        }

        [HttpGet]
        public ActionResult DownloadFile(UploadFileVm fileVm)
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
        public JsonResult DeleteFile(UploadFileVm fileVm)
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