using System;
using System.IO;
using System.IO.Compression;
using System.Linq;
using HtmlAgilityPack;
using WFP.ICT.Enum;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Async
{
    public class FileManagerFTP
    {
        static string OptOut = @"<center><p style='text-align:center;'><br><br><span style='font-size:12px;'>[~Physical_Mailing_Address~]<br>[~Optout style = ""~]Opt Out[~EndOptout~]</span></p></center>";
        static string ViewInBrowser = @"<center>[~ViewInBrowser style=""~]If you cannot view this email  please click here.[~EndViewInBrowser~]</center>";
        private static string _orderNumber;
        private static bool _isAddOptout;
        private static bool _isAddViewinBrowser;

        public static HtmlProcessResult ProcessHtmlZip(string UploadPath, string zipFilePath, string orderNumber, bool isAddOptout, bool isAddViewinBrowser)
        {
            _orderNumber = orderNumber;
            _isAddOptout = isAddOptout;
            _isAddViewinBrowser = isAddViewinBrowser;
            FileUploader uploader = new FileUploader();

            // Unzip
            var directory = string.Format("{0}\\{1}temp", UploadPath, orderNumber);
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
            string htmlFileName = string.Format("{0}.htm", orderNumber);
            string htmlFilePath = string.Format("{0}\\{1}", directory, htmlFileName);

            string htmlFile = Directory.EnumerateFiles(directory).FirstOrDefault(x => x.EndsWith("htm") || x.EndsWith("html"));
            if(string.IsNullOrEmpty(htmlFile))
                throw new ArgumentException("Html not found");

            UploadFileStatus status = ProcessHtml(htmlFile, htmlFilePath);

            // Create 2501 directory
            uploader.CreateDirectory(orderNumber);

            // Upload html
            string filePathLive = uploader.Upload(orderNumber, htmlFileName, htmlFilePath);

            // Create images directory
            var imagesLive = string.Format("{0}/{0}img", orderNumber);
            uploader.CreateDirectory(imagesLive);

            // Upload Images
            var images = Directory.EnumerateDirectories(directory).FirstOrDefault();
            foreach (var imgFile in Directory.EnumerateFiles(images))
            {
                var file = new FileInfo(imgFile);
                uploader.Upload(imagesLive, file.Name, imgFile);
            }

            // Delete tmp
            new DirectoryInfo(directory).Delete(true);

            return new HtmlProcessResult() {Status = status, filePathLive = filePathLive};
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
                    src = string.Format("{0}{1}", imagesPath, imgFileName);
                }
                node.SetAttributeValue("src", src);
            }

            HtmlNode body = doc.DocumentNode.SelectSingleNode("//body");
            if (_isAddViewinBrowser)
            {
                HtmlNode newNode = HtmlNode.CreateNode(ViewInBrowser);
                body.PrependChild(newNode);
            }
            if (_isAddOptout)
            {
                HtmlNode newNode = HtmlNode.CreateNode(OptOut);
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
                        fileName = string.Format("{0}zip.csv", orderNumber);
                        break;
                    case UploadFileType.TestSeedFile:
                        fileName = string.Format("{0}test.csv", orderNumber);
                    break;
                    case UploadFileType.LiveSeedFile:
                        fileName = string.Format("{0}live.csv", orderNumber);
                    break;
                    case UploadFileType.SuppressionFile:
                        fileName = string.Format("{0}supp.csv", orderNumber);
                    break;
            }
            return uploader.Upload(orderNumber, fileName, filePath);
        }
    }
}