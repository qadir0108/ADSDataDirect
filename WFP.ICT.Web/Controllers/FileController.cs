using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Controllers
{
    public class FileController : BaseController
    {

        [HttpPost]
        public async Task<JsonResult> UploadFile()
        {
            try
            {
                string fileName = "";
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
                        fileName = fileContent.FileName;
                    }
                }

                return Json(new JsonResponse() { IsSucess = true, Result = fileName });
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
            string fullPath = Path.Combine(UploadPath, Server.UrlEncode(file));
            if (!System.IO.File.Exists(fullPath))
                return null;

            return File(fullPath, "text/csv", file);
        }

        [HttpPost]
        public virtual JsonResult DeleteFile(string file)
        {
            try
            {
                string fullPath = Path.Combine(UploadPath, Server.UrlEncode(file));
                if (!System.IO.File.Exists(fullPath))
                    throw new Exception("File does not exists.");

                System.IO.File.Delete(fullPath);
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