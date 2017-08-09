using System;
using System.IO;
using System.Threading.Tasks;
using System.Web.Mvc;
using WFP.ICT.Web.Async;
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

                        if (string.IsNullOrEmpty(fileVm.OrderNumber))
                        {
                            amazonFileKey = string.Format("{0:yyyyMMddHHmmss}_{1}", DateTime.Now, fileContent.FileName);
                            S3FileManager.Upload(amazonFileKey, filePath);
                        } else if (!string.IsNullOrEmpty(fileVm.SegmentNumber)) // Data files Upload only // HtmlImageFiles2500A, HtmlImageFiles2500B
                        {
                            amazonFileKey = string.Format("{0}/{1}_html.zip", fileVm.OrderNumber, fileVm.SegmentNumber);
                            S3FileManager.Upload(amazonFileKey, filePath, true, true);
                        }
                        else
                        {
                            amazonFileKey = FileProcessor.AdjustNewFile(fileVm, filePath);
                        }

                        // Delete local
                        string fullPath = Path.Combine(UploadPath, fileContent.FileName);
                        if (System.IO.File.Exists(fullPath))
                            System.IO.File.Delete(fullPath);
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