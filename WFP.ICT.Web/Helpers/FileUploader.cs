using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace WFP.ICT.Web.Helpers
{
    public class FileUploader
    {
        private bool _uploadCompleted;
        private bool _status;

        private string _ftpServer;
        private string _ftpUsername;
        private string _ftpPassword;
        private string _baseURL;
        private string serverPrefix = "http://www.digitaldynamixs.net/ep2/";

        public FileUploader()
        {
            if (ConfigurationManager.AppSettings["FTPServer"] == null)
                throw new Exception("FTPServer not configured");
            if (ConfigurationManager.AppSettings["FTPUsername"] == null)
                throw new Exception("FTPUsername not configured");
            if (ConfigurationManager.AppSettings["FTPPassword"] == null)
                throw new Exception("FTPPassword not configured");

            _ftpServer = ConfigurationManager.AppSettings["FTPServer"];
            _ftpUsername = ConfigurationManager.AppSettings["FTPUsername"];
            _ftpPassword = ConfigurationManager.AppSettings["FTPPassword"];
            _baseURL = String.Format("ftp://{0}/public_html/ep2/", _ftpServer);
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
            }
        }

        public string Upload(string directoryName, string fileName, string filePath)
        {
            using (WebClient _client = new WebClient())
            {
                _client.Credentials = new NetworkCredential(_ftpUsername, _ftpPassword);
                string filePathFTP = _baseURL + directoryName + "/" + fileName;
                Uri address = new Uri(filePathFTP);
                _client.UploadFile(address, filePath);
                string filePathLive = serverPrefix + directoryName + "/" + fileName;
                return filePathLive;
            }
        }
    }
}
