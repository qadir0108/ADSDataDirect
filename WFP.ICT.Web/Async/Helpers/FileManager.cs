using System;
using System.IO;
using System.IO.Compression;
using System.Linq;
using HtmlAgilityPack;
using WFP.ICT.Enum;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Async
{
    public class FileManager
    {
        static string OptOut = @"<center><p style='text-align:center;'><br><br><span style='font-size:12px;'>[~Physical_Mailing_Address~]<br>[~Optout style = ""~]Opt Out[~EndOptout~]</span></p></center>";
        static string ViewInBrowser = @"<center>[~ViewInBrowser style=""~]If you cannot view this email  please click here.[~EndViewInBrowser~]</center>";
        static string _orderNumber;
        static bool _isAddOptout;
        static bool _isAddViewinBrowser;
        static string serverPrefix = string.Format("https://{0}.s3.amazonaws.com/", S3FileManager.bucket);

        public static HtmlProcessResult ProcessHtmlZip(string UploadPath, string zipFilePath, string orderNumber, bool isAddOptout, bool isAddViewinBrowser)
        {
            _orderNumber = orderNumber;
            _isAddOptout = isAddOptout;
            _isAddViewinBrowser = isAddViewinBrowser;

            // Unzip
            var directory = string.Format("{0}\\{1}", UploadPath, orderNumber);
            if (!Directory.Exists(directory))
            {
                Directory.CreateDirectory(directory);
            }
            ZipFile.ExtractToDirectory(zipFilePath, directory);

            // Change html
            var imagesLive = string.Format("{0}/{0}img", orderNumber);
            string htmlFileName = string.Format("{0}.htm", orderNumber);
            string htmlFileKey = string.Format("{0}/{0}.htm", orderNumber);
            string htmlFilePath = string.Format("{0}\\{1}", directory, htmlFileName);

            string htmlFile = Directory.EnumerateFiles(directory).FirstOrDefault(x => x.EndsWith("htm") || x.EndsWith("html"));
            if(string.IsNullOrEmpty(htmlFile))
                throw new Exception("Html not found");

            UploadFileStatusEnum status = ProcessHtml(htmlFile, htmlFilePath);

            // Create 2501 directory
            S3FileManager.CreateDirectory(orderNumber);

            // Upload html
            S3FileManager.Upload(htmlFileKey, htmlFilePath, true);
            string filePathLive = string.Format("{0}{1}", serverPrefix, htmlFileKey);

            // Create images directory
            S3FileManager.CreateDirectory(imagesLive);

            // Upload Images
            var images = Directory.EnumerateDirectories(directory).FirstOrDefault();
            if(images != null)
            foreach (var imgFile in Directory.EnumerateFiles(images))
            {
                var imageLive = string.Format("{0}/{1}", imagesLive, new FileInfo(imgFile).Name);
                S3FileManager.Upload(imageLive, imgFile, true);
            }

            // Delete tmp
            new DirectoryInfo(directory).Delete(true);

            return new HtmlProcessResult() {Status = status, filePathLive = filePathLive};
        }

        public static UploadFileStatusEnum ProcessHtml(string htmlFile, string outputFilePath)
        {
            string imagesPath = string.Format("{0}{1}/{1}img/", serverPrefix, _orderNumber);

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

            return alreadyHosted ? UploadFileStatusEnum.HostedWithOutImages :  UploadFileStatusEnum.HostedWithImages;
        }

        public static string GetFilePathLive(UploadFileTypeEnum uploadFileType, string orderNumber, string extension = "", string segmentNumber = "")
        {
            string fileName = "";
            switch (uploadFileType)
            {
                    case UploadFileTypeEnum.ZipFile:
                        fileName = string.Format("{0}{1}/{1}zip.csv", serverPrefix, orderNumber);
                        break;
                    case UploadFileTypeEnum.TestSeedFile:
                        fileName = string.Format("{0}{1}/{1}test.csv", serverPrefix, orderNumber);
                    break;
                    case UploadFileTypeEnum.LiveSeedFile:
                        fileName = string.Format("{0}{1}/{1}live.csv", serverPrefix, orderNumber);
                    break;
                    case UploadFileTypeEnum.SuppressionFile:
                        fileName = string.Format("{0}{1}/{1}supp.csv", serverPrefix, orderNumber);
                    break;
                    case UploadFileTypeEnum.BannersFile:
                            fileName = string.Format("{0}{1}/_banner{2}", serverPrefix, orderNumber, extension);
                        break;
                    case UploadFileTypeEnum.BannersLinksFile:
                            fileName = string.Format("{0}{1}/_bannerlinks{2}", serverPrefix, orderNumber, extension);
                        break;
                    case UploadFileTypeEnum.MiscFile:
                        fileName = string.Format("{0}{1}/_misc{2}", serverPrefix, orderNumber, extension);
                        break;
                    case UploadFileTypeEnum.DataFile:
                        fileName = string.Format("{0}{1}/{2}data.csv", serverPrefix, orderNumber, segmentNumber);
                        break;
            }
            return fileName;
        }
    }
}