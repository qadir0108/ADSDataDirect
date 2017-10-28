using Amazon;
using Amazon.S3;
using Amazon.S3.IO;
using Amazon.S3.Model;

namespace ADSDataDirect.Web.Async.Helpers
{
    public class S3FileManager
    {
        public readonly static string Bucket = "marketing247";

        public static void Upload(string fileKey, string localFilePath, bool ifMakePublic = true, bool overWrite = false)
        {
            if (overWrite) Delete(fileKey);

            using (IAmazonS3 client = new AmazonS3Client(RegionEndpoint.USWest2))
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
            using (IAmazonS3 client = new AmazonS3Client(RegionEndpoint.USWest2))
            {
                S3FileInfo s3FileInfo = new S3FileInfo(client, Bucket, fileKey);
                return s3FileInfo.Exists;
            }
        }

        public static void Download(string fileKey, string localFilePath)
        {
            using (IAmazonS3 client = new AmazonS3Client(RegionEndpoint.USWest2))
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
            using (IAmazonS3 client = new AmazonS3Client(RegionEndpoint.USWest2))
            {
                DeleteObjectRequest request = new DeleteObjectRequest();
                request.BucketName = Bucket;
                request.Key = fileKey;
                client.DeleteObject(request);
            }
        }

        public static void CreateDirectory(string folderName)
        {
            using (IAmazonS3 client = new AmazonS3Client(RegionEndpoint.USWest2))
            {
                S3DirectoryInfo destination = new S3DirectoryInfo(client, Bucket, folderName);
                if (!destination.Exists) destination.Create();
            }
        }

        public static void Move(string oldFileKey,string newFileKey, string folderName, bool overWrite = false)
        {
            if(string.IsNullOrEmpty(oldFileKey)) return;

            if(overWrite) Delete(newFileKey);

            using (IAmazonS3 client = new AmazonS3Client(RegionEndpoint.USWest2))
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
            using (IAmazonS3 client = new AmazonS3Client(RegionEndpoint.USWest2))
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
