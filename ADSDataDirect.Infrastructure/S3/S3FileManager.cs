using ADSDataDirect.Enums;
using Amazon;
using Amazon.S3;
using Amazon.S3.IO;
using Amazon.S3.Model;
using System.Configuration;

namespace ADSDataDirect.Infrastructure.S3
{
    public class S3FileManager
    {
        readonly static string clientCode = ConfigurationManager.AppSettings["ClientCode"];

        private static string _serverPrefix = $"https://{Bucket}.s3.amazonaws.com/";
        protected static string UseS3 { get; } = ConfigurationManager.AppSettings["UseS3"];
        protected static bool IsUseS3 => UseS3.ToLowerInvariant() == "true";

        public static string Bucket {
            get
            {
                return (clientCode == Client.ADS.ToString()) ? "marketing249" : "marketing248";
            }
        }

        public static RegionEndpoint Region
        {
            get
            {
                return (clientCode == Client.ADS.ToString()) ? RegionEndpoint.USEast2 : RegionEndpoint.USWest2;
            }
        }

        public static string ServerPrefix
        {
            get
            {
                return _serverPrefix;
            }
        }

        public static void Upload(string fileKey, string localFilePath, bool ifMakePublic = true, bool overWrite = false)
        {
            if (!IsUseS3) return;

            if (overWrite) Delete(fileKey);

            using (IAmazonS3 client = new AmazonS3Client(Region))
            {
                PutObjectRequest request = new PutObjectRequest();
                request.BucketName = Bucket;
                request.Key = fileKey;
                request.FilePath = localFilePath;
                client.PutObject(request);
            }

            if(ifMakePublic)
                MakePublic(fileKey);
        }

        public static bool Exists(string fileKey)
        {
            if (!IsUseS3) return;

            using (IAmazonS3 client = new AmazonS3Client(Region))
            {
                S3FileInfo s3FileInfo = new S3FileInfo(client, Bucket, fileKey);
                return s3FileInfo.Exists;
            }
        }

        public static void Download(string fileKey, string localFilePath)
        {
            if (!IsUseS3) return;

            using (IAmazonS3 client = new AmazonS3Client(Region))
            {
                GetObjectRequest request = new GetObjectRequest();
                request.BucketName = Bucket;
                request.Key = fileKey;
                GetObjectResponse response = client.GetObject(request);
                response.WriteResponseStreamToFile(localFilePath);
            }
        }

        public static void Delete(string fileKey)
        {
            if (!IsUseS3) return;

            using (IAmazonS3 client = new AmazonS3Client(Region))
            {
                DeleteObjectRequest request = new DeleteObjectRequest();
                request.BucketName = Bucket;
                request.Key = fileKey;
                client.DeleteObject(request);
            }
        }

        public static void CreateDirectory(string folderName)
        {
            if (!IsUseS3) return;

            using (IAmazonS3 client = new AmazonS3Client(Region))
            {
                S3DirectoryInfo destination = new S3DirectoryInfo(client, Bucket, folderName);
                if (!destination.Exists) destination.Create();
            }
        }

        public static void Move(string oldFileKey,string newFileKey, string folderName, bool overWrite = false)
        {
            if (!IsUseS3) return;

            if (string.IsNullOrEmpty(oldFileKey)) return;

            if(overWrite) Delete(newFileKey);

            using (IAmazonS3 client = new AmazonS3Client(Region))
            {
                S3FileInfo currentObject = new S3FileInfo(client, Bucket, oldFileKey);
                S3DirectoryInfo destination = new S3DirectoryInfo(client, Bucket, folderName);
                if(!destination.Exists) destination.Create();
                S3FileInfo movedObject = currentObject.MoveTo(Bucket, newFileKey);
            }
            MakePublic(newFileKey);
        }

        public static void MakePublic(string fileKey)
        {
            if (!IsUseS3) return;

            using (IAmazonS3 client = new AmazonS3Client(Region))
            {
                PutACLRequest request = new PutACLRequest();
                request.BucketName = Bucket;
                request.Key = fileKey;
                request.CannedACL = S3CannedACL.PublicRead;
                client.PutACL(request);
            }
        }
    }
}
