using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;

namespace WFP.ICT.Web.Async
{
    public class CampaignProcessor
    {
        public static void ProcessNewOrder(string OrderNumber, WFPUser user)
        {
            using (var db = new WFPICTContext())
            {
                var campaign = db.Campaigns
                                 .FirstOrDefault(x => x.OrderNumber == OrderNumber);

                if (!string.IsNullOrEmpty(campaign.HtmlImageFiles))
                {
                    string oldFile = campaign.HtmlImageFiles;
                    string newFile = string.Format("{0}/{1}_html.zip", campaign.OrderNumber, campaign.OrderNumber);
                    campaign.HtmlImageFiles = newFile;
                    S3FileManager.Move(oldFile, newFile, campaign.OrderNumber);
                }

                if (!string.IsNullOrEmpty(campaign.ZipCodeFile))
                {
                    string oldFile = campaign.ZipCodeFile;
                    string newFile = string.Format("{0}/{1}zip.csv", campaign.OrderNumber, campaign.OrderNumber);
                    campaign.ZipCodeFile = newFile;
                    S3FileManager.Move(oldFile, newFile, campaign.OrderNumber);
                }

                if (!string.IsNullOrEmpty(campaign.TestSeedList))
                {
                    string oldFile = campaign.TestSeedList;
                    string newFile = string.Format("{0}/{1}test.csv", campaign.OrderNumber, campaign.OrderNumber);
                    campaign.TestSeedList = newFile;
                    S3FileManager.Move(oldFile, newFile, campaign.OrderNumber);
                }

                if (!string.IsNullOrEmpty(campaign.FinalSeedList))
                {
                    string oldFile = campaign.FinalSeedList;
                    string newFile = string.Format("{0}/{1}live.csv", campaign.OrderNumber, campaign.OrderNumber);
                    campaign.FinalSeedList = newFile;
                    S3FileManager.Move(oldFile, newFile, campaign.OrderNumber);
                }

                if (!string.IsNullOrEmpty(campaign.SuppressionFile))
                {
                    string oldFile = campaign.SuppressionFile;
                    string newFile = string.Format("{0}/{1}supp.csv", campaign.OrderNumber, campaign.OrderNumber);
                    campaign.SuppressionFile = newFile;
                    S3FileManager.Move(oldFile, newFile, campaign.OrderNumber);
                }

                db.SaveChanges();

                EmailHelper.SendOrderEmailToClient(user, campaign);
            }
        }

        public static void SendVendorEmail(string OrderNumber, Guid? vendorId)
        {
            using (var db = new WFPICTContext())
            {
                Campaign campaign = db.Campaigns
                    .Include(x => x.Approved)
                    .FirstOrDefault(x => x.OrderNumber == OrderNumber);

                var vendor = db.Vendors.FirstOrDefault(x => x.Id == vendorId);

                EmailHelper.SendApprovedToVendor(vendor, campaign);

                campaign.Status = (int)CampaignStatusEnum.Traffic;
                db.SaveChanges();
            }
        }

    }
}