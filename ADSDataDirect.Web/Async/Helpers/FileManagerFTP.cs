using System.IO;
using System.IO.Compression;
using System.Linq;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.Helpers;
using ADSDataDirect.Web.Models;
using HtmlAgilityPack;

namespace ADSDataDirect.Web.Async.Helpers
{
    public class FileManagerFtp
    {
        static string _optOut = @"<center><p style='text-align:center;'><br><br><span style='font-size:12px;'>[~Physical_Mailing_Address~]<br>[~Optout style = ""~]Opt Out[~EndOptout~]</span></p></center>";
        static string _viewInBrowser = @"<center>[~ViewInBrowser style=""~]If you cannot view this email  please click here.[~EndViewInBrowser~]</center>";
        private static string _orderNumber;
        private static bool _isAddOptout;
        private static bool _isAddViewinBrowser;

        public static HtmlProcessResult ProcessHtmlZip(string uploadPath, string zipFilePath, string orderNumber, bool isAddOptout, bool isAddViewinBrowser)
        {
            _orderNumber = orderNumber;
            _isAddOptout = isAddOptout;
            _isAddViewinBrowser = isAddViewinBrowser;
            FileUploader uploader = new FileUploader();

            // Unzip
            var directory = $"{uploadPath}\\{orderNumber}temp";
            if (Directory.Exists(directory))
            {
                new DirectoryInfo(directory).Delete(true);
            }
            else
            {
                Directory.CreateDirectory(directory);
            }
            ZipFile.ExtractToDirectory(zipFilePath, directory);

            // Change html
            string htmlFileName = $"{orderNumber}.htm";
            string htmlFilePath = $"{directory}\\{htmlFileName}";

            string htmlFile = Directory.EnumerateFiles(directory).FirstOrDefault(x => x.EndsWith("htm") || x.EndsWith("html"));
            if(string.IsNullOrEmpty(htmlFile))
                throw new AdsException("Html not found");

            UploadFileStatus status = ProcessHtml(htmlFile, htmlFilePath);

            // Create 2501 directory
            uploader.CreateDirectory(orderNumber);

            // Upload html
            string filePathLive = uploader.Upload(orderNumber, htmlFileName, htmlFilePath);

            // Create images directory
            var imagesLive = $"{orderNumber}/{orderNumber}img";
            uploader.CreateDirectory(imagesLive);

            // Upload Images
            var images = Directory.EnumerateDirectories(directory).FirstOrDefault();
            if (images != null)
                foreach (var imgFile in Directory.EnumerateFiles(images))
                {
                    var file = new FileInfo(imgFile);
                    uploader.Upload(imagesLive, file.Name, imgFile);
                }

            // Delete tmp
            new DirectoryInfo(directory).Delete(true);

            return new HtmlProcessResult() {Status = status, FilePathLive = filePathLive};
        }

        public static UploadFileStatus ProcessHtml(string htmlFile, string outputFilePath)
        {
            string imagesPath = string.Format("http://www.digitaldynamixs.net/ep2/{0}/{0}img/", _orderNumber);

            HtmlDocument doc = new HtmlDocument();
            doc.Load(htmlFile);
            var allSrcs = doc.DocumentNode.SelectNodes("//img[@src]");
            bool alreadyHosted = false;
            foreach (HtmlNode node in allSrcs)
            {
                var src = node.Attributes["src"].Value;
                // Already hosted : look for http
                if (src.Contains("http://"))
                {
                    alreadyHosted = true;
                    break;;
                }
                else
                {
                    // imagesPath
                    // images/GregMayHonda4_13_r1_c1.jpg
                    var srcs = src.Split("/".ToCharArray());
                    string imgFileName = srcs.Length > 1 ? srcs[1] : string.Empty;
                    src = $"{imagesPath}{imgFileName}";
                }
                node.SetAttributeValue("src", src);
            }

            HtmlNode body = doc.DocumentNode.SelectSingleNode("//body");
            if (_isAddViewinBrowser)
            {
                HtmlNode newNode = HtmlNode.CreateNode(_viewInBrowser);
                body.PrependChild(newNode);
            }
            if (_isAddOptout)
            {
                HtmlNode newNode = HtmlNode.CreateNode(_optOut);
                body.AppendChild(newNode);
            }

            doc.Save(outputFilePath);

            return alreadyHosted ? UploadFileStatus.HostedWithOutImages :  UploadFileStatus.HostedWithImages;
        }

        public static string UploadFile(UploadFileType uploadFileType, string filePath, string orderNumber)
        {
            FileUploader uploader = new FileUploader();

            // Create 2501 directory
            uploader.CreateDirectory(orderNumber);

            string fileName = "";
            switch (uploadFileType)
            {
                    case UploadFileType.ZipFile:
                        fileName = $"{orderNumber}zip.csv";
                        break;
                    case UploadFileType.TestSeedFile:
                        fileName = $"{orderNumber}test.csv";
                    break;
                    case UploadFileType.LiveSeedFile:
                        fileName = $"{orderNumber}live.csv";
                    break;
                    case UploadFileType.SuppressionFile:
                        fileName = $"{orderNumber}supp.csv";
                    break;
            }
            return uploader.Upload(orderNumber, fileName, filePath);
        }
    }
}