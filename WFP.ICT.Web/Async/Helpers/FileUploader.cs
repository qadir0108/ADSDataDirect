using System;
using System.Configuration;
using System.Net;
using WFP.ICT.Web.Helpers;

namespace WFP.ICT.Web.Async.Helpers
{
    public class FileUploader
    {
        private string _ftpUsername;
        private string _ftpPassword;
        private string _baseURL;
        private string serverPrefix = "http://www.digitaldynamixs.net/ep2/";

        public FileUploader()
        {
            if (ConfigurationManager.AppSettings["FTPServer"] == null)
                throw new AdsException("FTPServer not configured");
            if (ConfigurationManager.AppSettings["FTPUsername"] == null)
                throw new AdsException("FTPUsername not configured");
            if (ConfigurationManager.AppSettings["FTPPassword"] == null)
                throw new AdsException("FTPPassword not configured");

            var ftpServer = ConfigurationManager.AppSettings["FTPServer"];
            _ftpUsername = ConfigurationManager.AppSettings["FTPUsername"];
            _ftpPassword = ConfigurationManager.AppSettings["FTPPassword"];
            _baseURL = $"ftp://{ftpServer}/public_html/ep2/";
        }

        public bool DirectoryExists(string directoryPath)
        {
            bool directoryExists;
            var request = (FtpWebRequest)WebRequest.Create(directoryPath + "/");
            request.Method = WebRequestMethods.Ftp.ListDirectory;
            request.Credentials = new NetworkCredential(_ftpUsername, _ftpPassword);
            try
            {
                using (request.GetResponse())
                {
                    directoryExists = true;
                }
            }
            catch (WebException ex)
            {
                directoryExists = false;
            }
            return directoryExists;
        }

        public void CreateDirectory(string directoryName)
        {
            string directoryPath = _baseURL + directoryName;

            if(DirectoryExists(directoryPath)) return;

            WebRequest request = WebRequest.Create(directoryPath);
            request.Method = WebRequestMethods.Ftp.MakeDirectory;
            request.Credentials = new NetworkCredential(_ftpUsername, _ftpPassword);
            try
            {
                var resp = (FtpWebResponse) request.GetResponse();
            }
            catch (Exception ex)
            {
                //
            }
        }

        public string Upload(string directoryName, string fileName, string filePath)
        {
            using (WebClient client = new WebClient())
            {
                client.Credentials = new NetworkCredential(_ftpUsername, _ftpPassword);
                string filePathFtp = $"{_baseURL}{directoryName}/{fileName}";
                Uri address = new Uri(filePathFtp);
                client.UploadFile(address, filePath);
                string filePathLive = $"{serverPrefix}{directoryName}/{fileName}";
                return filePathLive;
            }
        }
    }
}
