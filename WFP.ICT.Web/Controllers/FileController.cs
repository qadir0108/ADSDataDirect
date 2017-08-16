using System;
using System.IO;
using System.Threading.Tasks;
using System.Web.Mvc;
using WFP.ICT.Web.Async;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Controllers
{
    public class FileController : BaseController
    {
        [HttpPost]
        public async Task<JsonResult> UploadFile(UploadFileVM fileVm)
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
                            throw new Exception(fileVm.FileType + " is not valid. Please upload valid file.");
                        }

                        if (string.IsNullOrEmpty(fileVm.OrderNumber))
                        {
                            amazonFileKey = string.Format("{0:yyyyMMddHHmmss}_{1}", DateTime.Now, fileContent.FileName);
                            S3FileManager.Upload(amazonFileKey, filePath);
                        }
                        else if (!string.IsNullOrEmpty(fileVm.SegmentNumber)) // Data files Upload only // HtmlImageFiles2500A, HtmlImageFiles2500B
                        {
                            amazonFileKey = string.Format("{0}/{1}_html.zip", fileVm.OrderNumber, fileVm.SegmentNumber);
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
                //Response.StatusCode = (int) HttpStatusCode.BadRequest;
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = "Upload failed " + ex.Message });
            }
        }

        [HttpGet]
        public virtual ActionResult DownloadFile(string file)
        {
            string filePath = Path.Combine(UploadPath, Server.UrlEncode(file));
            //if (!System.IO.File.Exists(filePath))
            // return null;

            S3FileManager.Download(file, filePath);

            return File(filePath, "text/csv", file);
        }

        [HttpPost]
        public virtual JsonResult DeleteFile(string file)
        {
            try
            {
                S3FileManager.Delete(file);

                //string fullPath = Path.Combine(UploadPath, Server.UrlEncode(file));
                //if (!System.IO.File.Exists(fullPath))
                //    throw new Exception("File does not exists.");
                //System.IO.File.Delete(fullPath);

                return Json(new JsonResponse() {IsSucess = true});
            }
            catch (Exception ex)
            {
                //Response.StatusCode = (int) HttpStatusCode.BadRequest;
                return Json(new JsonResponse() {IsSucess = false, ErrorMessage = "File Delete failed. " + ex.Message });
            }
        }
    }
}