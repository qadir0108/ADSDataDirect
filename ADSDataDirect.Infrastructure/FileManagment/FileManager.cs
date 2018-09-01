using System.IO;
using System.IO.Compression;
using System.Linq;
using ADSDataDirect.Enums;
using HtmlAgilityPack;
using ADSDataDirect.Infrastructure.S3;

namespace ADSDataDirect.Infrastructure.FileManagment
{
    public static class FileManager
    {
        static string _optOut = @"<center><p style='text-align:center;'><br><br><span style='font-size:12px;'>[~Physical_Mailing_Address~]<br>[~Optout style = ""~]Opt Out[~EndOptout~]</span></p></center>";
        static string _viewInBrowser = @"<center>[~ViewInBrowser style=""~]If you cannot view this email  please click here.[~EndViewInBrowser~]</center>";
        static string _orderNumber;
        static bool _isAddOptout;
        static bool _isAddViewinBrowser;

        public static HtmlProcessResult ProcessHtmlZip(string uploadPath, string zipFilePath, string orderNumber, bool isAddOptout, bool isAddViewinBrowser)
        {
            _orderNumber = orderNumber;
            _isAddOptout = isAddOptout;
            _isAddViewinBrowser = isAddViewinBrowser;

            // Unzip
            var directory = $"{uploadPath}\\{orderNumber}";
            if (!Directory.Exists(directory))
            {
                Directory.CreateDirectory(directory);
            }
            ZipFile.ExtractToDirectory(zipFilePath, directory);

            // Change html
            var imagesLive = string.Format("{0}/{0}img", orderNumber);
            string htmlFileName = $"{orderNumber}.htm";
            string htmlFileKey = string.Format("{0}/{0}.htm", orderNumber);
            string htmlFilePath = $"{directory}\\{htmlFileName}";

            string htmlFile = Directory.EnumerateFiles(directory).FirstOrDefault(x => x.EndsWith("htm") || x.EndsWith("html"));
            if(string.IsNullOrEmpty(htmlFile))
                throw new AdsException("Html not found");

            UploadFileStatus status = ProcessHtml(htmlFile, htmlFilePath);

            // Create 2501 directory
            S3FileManager.CreateDirectory(orderNumber);

            // Upload html
            S3FileManager.Upload(htmlFileKey, htmlFilePath, true);
            string filePathLive = $"{S3FileManager.ServerPrefix}{htmlFileKey}";

            // Create images directory
            S3FileManager.CreateDirectory(imagesLive);

            // Upload Images
            var images = Directory.EnumerateDirectories(directory).FirstOrDefault();
            if(images != null)
            foreach (var imgFile in Directory.EnumerateFiles(images))
            {
                var imageLive = $"{imagesLive}/{new FileInfo(imgFile).Name}";
                S3FileManager.Upload(imageLive, imgFile, true);
            }

            // Delete tmp
            new DirectoryInfo(directory).Delete(true);

            return new HtmlProcessResult() {Status = status, FilePathLive = filePathLive};
        }

        public static UploadFileStatus ProcessHtml(string htmlFile, string outputFilePath)
        {
            string imagesPath = string.Format("{0}{1}/{1}img/", S3FileManager.ServerPrefix, _orderNumber);

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

        public static string GetFilePathLive(UploadFileType uploadFileType, string orderNumber, string extension = "", string segmentNumber = "")
        {
            string fileName = "";
            switch (uploadFileType)
            {
                    case UploadFileType.ZipFile:
                        fileName = string.Format("{0}{1}/{1}zip.csv", S3FileManager.ServerPrefix, orderNumber);
                        break;
                    case UploadFileType.TestSeedFile:
                        fileName = string.Format("{0}{1}/{1}test.csv", S3FileManager.ServerPrefix, orderNumber);
                    break;
                    case UploadFileType.LiveSeedFile:
                        fileName = string.Format("{0}{1}/{1}live.csv", S3FileManager.ServerPrefix, orderNumber);
                    break;
                    case UploadFileType.SuppressionFile:
                        fileName = string.Format("{0}{1}/{1}supp.csv", S3FileManager.ServerPrefix, orderNumber);
                    break;
                    case UploadFileType.BannersFile:
                            fileName = $"{S3FileManager.ServerPrefix}{orderNumber}/_banner{extension}";
                        break;
                    case UploadFileType.BannersLinksFile:
                            fileName = $"{S3FileManager.ServerPrefix}{orderNumber}/_bannerlinks{extension}";
                        break;
                    case UploadFileType.MiscFile:
                        fileName = $"{S3FileManager.ServerPrefix}{orderNumber}/_misc{extension}";
                        break;
                    case UploadFileType.DataFile:
                        fileName = $"{S3FileManager.ServerPrefix}{orderNumber}/{segmentNumber}data.csv";
                        break;
            }
            return fileName;
        }
    }
}