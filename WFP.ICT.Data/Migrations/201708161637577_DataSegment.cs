namespace WFP.ICT.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DataSegment : DbMigration
    {
        public override void Up()
        {
            RenameTable(name: "dbo.MailChimpAPILog", newName: "SystemLog");
            DropForeignKey("dbo.Campaign", "RebroadId", "dbo.Campaign");
            DropIndex("dbo.Campaign", new[] { "RebroadId" });
            CreateTable(
                "dbo.CampaignAsset",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        CampaignId = c.Guid(),
                        ZipCodeFile = c.String(),
                        ZipCodeUrl = c.String(),
                        ZipCodeStatus = c.Int(nullable: false),
                        TestSeedFile = c.String(),
                        TestSeedUrl = c.String(),
                        TestSeedStatus = c.Int(nullable: false),
                        LiveSeedFile = c.String(),
                        LiveSeedUrl = c.String(),
                        LiveSeedStatus = c.Int(nullable: false),
                        CreativeFiles = c.String(),
                        CreativeUrl = c.String(),
                        CreativeStatus = c.Int(nullable: false),
                        SuppressionFile = c.String(),
                        SuppressionUrl = c.String(),
                        SuppressionStatus = c.Int(nullable: false),
                        BannersFile = c.String(),
                        BannersUrl = c.String(),
                        BannersStatus = c.Int(nullable: false),
                        BannerLinksFile = c.String(),
                        BannerLinksUrl = c.String(),
                        BannerLinksStatus = c.Int(nullable: false),
                        MiscFile = c.String(),
                        MiscUrl = c.String(),
                        MiscStatus = c.Int(nullable: false),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Notification",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        CampaignId = c.Guid(),
                        OrderNumber = c.String(),
                        QCRule = c.Int(nullable: false),
                        CheckTime = c.DateTime(),
                        Status = c.Int(nullable: false),
                        FoundAt = c.DateTime(),
                        ResolvedAt = c.DateTime(),
                        ExpiredAt = c.DateTime(),
                        IsNotification1Sent = c.Boolean(nullable: false),
                        IsNotification2Sent = c.Boolean(nullable: false),
                        IsNotification3Sent = c.Boolean(nullable: false),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Campaign", t => t.CampaignId)
                .Index(t => t.CampaignId);
            
            CreateTable(
                "dbo.CampaignSegment",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        CampaignId = c.Guid(),
                        OrderNumber = c.String(),
                        BroadcastDate = c.DateTime(),
                        DeploymentDate = c.DateTime(),
                        SubjectLine = c.String(),
                        CreativeFiles = c.String(),
                        FirstRangeStart = c.Int(nullable: false),
                        FirstRangeEnd = c.Int(nullable: false),
                        SecondRangeStart = c.Int(nullable: false),
                        SecondRangeEnd = c.Int(nullable: false),
                        ThirdRangeStart = c.Int(nullable: false),
                        ThirdRangeEnd = c.Int(nullable: false),
                        SegmentNumber = c.String(),
                        SegmentDataFileUrl = c.String(),
                        DateFetched = c.DateTime(),
                        UploadStatus = c.Int(nullable: false),
                        SegmentStatus = c.Int(nullable: false),
                        DateApproved = c.DateTime(),
                        DateSent = c.DateTime(),
                        DateComplete = c.DateTime(),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Campaign", t => t.CampaignId)
                .Index(t => t.CampaignId);
            
            CreateTable(
                "dbo.CampaignTracking",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        CampaignId = c.Guid(),
                        SegmentNumber = c.String(),
                        DateSent = c.DateTime(),
                        StartDate = c.String(),
                        Clicked = c.Long(nullable: false),
                        Opened = c.Long(nullable: false),
                        IONumber = c.String(),
                        IsCreatedThroughApi = c.Boolean(nullable: false),
                        QueuedCampaignId = c.String(),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Campaign", t => t.CampaignId)
                .Index(t => t.CampaignId);
            
            AddColumn("dbo.Campaign", "DataFileQuantity", c => c.Long(nullable: false));
            AddColumn("dbo.Campaign", "IsOpenPixel", c => c.Boolean(nullable: false));
            AddColumn("dbo.Campaign", "OpenPixelUrl", c => c.String());
            AddColumn("dbo.Campaign", "IsOmniOrder", c => c.Boolean(nullable: false));
            AddColumn("dbo.Campaign", "OmniDeployDate", c => c.DateTime());
            AddColumn("dbo.Campaign", "Impressions", c => c.Long(nullable: false));
            AddColumn("dbo.Campaign", "ChannelTypes", c => c.String());
            AddColumn("dbo.Campaign", "ReBroadcasted", c => c.Boolean(nullable: false));
            AddColumn("dbo.Campaign", "ReBroadcastedDate", c => c.DateTime());
            AddColumn("dbo.Campaign", "ReBroadcastedQuantity", c => c.Long(nullable: false));
            AddColumn("dbo.Campaign", "ReBroadcastedOrderNumber", c => c.String());
            AddColumn("dbo.Campaign", "AssetsId", c => c.Guid());
            AddColumn("dbo.CampaignApproved", "OpenGoals", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignApproved", "ClickGoals", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignApproved", "DataFileQuantity", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignApproved", "DataFileUrl", c => c.String());
            AddColumn("dbo.CampaignApproved", "IsOpenPixel", c => c.Boolean(nullable: false));
            AddColumn("dbo.CampaignApproved", "OpenPixelUrl", c => c.String());
            AddColumn("dbo.CampaignApproved", "IsOmniOrder", c => c.Boolean(nullable: false));
            AddColumn("dbo.CampaignApproved", "OmniDeployDate", c => c.DateTime());
            AddColumn("dbo.CampaignApproved", "Impressions", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignApproved", "ChannelTypes", c => c.String());
            AddColumn("dbo.CampaignApproved", "IsUseApiDataForOpen", c => c.Boolean(nullable: false));
            AddColumn("dbo.CampaignTesting", "OpenGoals", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTesting", "ClickGoals", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTesting", "DataFileQuantity", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTesting", "DataFileUrl", c => c.String());
            AddColumn("dbo.CampaignTesting", "DateFetched", c => c.DateTime());
            AddColumn("dbo.CampaignTesting", "IsOpenPixel", c => c.Boolean(nullable: false));
            AddColumn("dbo.CampaignTesting", "OpenPixelUrl", c => c.String());
            AddColumn("dbo.CampaignTesting", "IsOmniOrder", c => c.Boolean(nullable: false));
            AddColumn("dbo.CampaignTesting", "OmniDeployDate", c => c.DateTime());
            AddColumn("dbo.CampaignTesting", "Impressions", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTesting", "ChannelTypes", c => c.String());
            AddColumn("dbo.SystemLog", "LogType", c => c.Int(nullable: false));
            AddColumn("dbo.SystemLog", "LogStatus", c => c.Int(nullable: false));
            AlterColumn("dbo.Campaign", "BroadcastDate", c => c.DateTime());
            CreateIndex("dbo.Campaign", "AssetsId");
            AddForeignKey("dbo.Campaign", "AssetsId", "dbo.CampaignAsset", "Id");
            DropColumn("dbo.CampaignCreative", "OrderNumber");
            DropColumn("dbo.Campaign", "ZipCodeFile");
            DropColumn("dbo.Campaign", "HtmlImageFiles");
            DropColumn("dbo.Campaign", "TestSeedList");
            DropColumn("dbo.Campaign", "FinalSeedList");
            DropColumn("dbo.Campaign", "SuppressionFile");
            DropColumn("dbo.Campaign", "IONumber");
            DropColumn("dbo.Campaign", "RebroadId");
            DropColumn("dbo.CampaignApproved", "OrderNumber");
            DropColumn("dbo.CampaignApproved", "HtmlImageFiles");
            DropColumn("dbo.CampaignApproved", "CreativeURL");
            DropColumn("dbo.CampaignApproved", "ZipURL");
            DropColumn("dbo.CampaignTesting", "OrderNumber");
            DropColumn("dbo.CampaignTesting", "HtmlImageFiles");
            DropColumn("dbo.CampaignTesting", "CreativeURL");
            DropColumn("dbo.CampaignTesting", "TestSeedList");
            DropColumn("dbo.CampaignTesting", "FinalSeedList");
            DropColumn("dbo.CampaignTesting", "ZipCodeFile");
            DropColumn("dbo.CampaignTesting", "ZipURL");
            DropColumn("dbo.CampaignTesting", "HtmlImagesStatus");
            DropColumn("dbo.CampaignTesting", "ZipURLStatus");
            DropColumn("dbo.CampaignTesting", "TestSeedURL");
            DropColumn("dbo.CampaignTesting", "TestSeedStatus");
            DropColumn("dbo.CampaignTesting", "LiveSeedURL");
            DropColumn("dbo.CampaignTesting", "LiveSeedStatus");
            DropColumn("dbo.CampaignTesting", "SuppressionURL");
            DropColumn("dbo.CampaignTesting", "SuppressionStatus");
            DropTable("dbo.ProDataAPILog");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.ProDataAPILog",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        OrderNumber = c.String(),
                        Message = c.String(),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.CampaignTesting", "SuppressionStatus", c => c.Int(nullable: false));
            AddColumn("dbo.CampaignTesting", "SuppressionURL", c => c.String());
            AddColumn("dbo.CampaignTesting", "LiveSeedStatus", c => c.Int(nullable: false));
            AddColumn("dbo.CampaignTesting", "LiveSeedURL", c => c.String());
            AddColumn("dbo.CampaignTesting", "TestSeedStatus", c => c.Int(nullable: false));
            AddColumn("dbo.CampaignTesting", "TestSeedURL", c => c.String());
            AddColumn("dbo.CampaignTesting", "ZipURLStatus", c => c.Int(nullable: false));
            AddColumn("dbo.CampaignTesting", "HtmlImagesStatus", c => c.Int(nullable: false));
            AddColumn("dbo.CampaignTesting", "ZipURL", c => c.String());
            AddColumn("dbo.CampaignTesting", "ZipCodeFile", c => c.String());
            AddColumn("dbo.CampaignTesting", "FinalSeedList", c => c.String());
            AddColumn("dbo.CampaignTesting", "TestSeedList", c => c.String());
            AddColumn("dbo.CampaignTesting", "CreativeURL", c => c.String());
            AddColumn("dbo.CampaignTesting", "HtmlImageFiles", c => c.String());
            AddColumn("dbo.CampaignTesting", "OrderNumber", c => c.String());
            AddColumn("dbo.CampaignApproved", "ZipURL", c => c.String());
            AddColumn("dbo.CampaignApproved", "CreativeURL", c => c.String());
            AddColumn("dbo.CampaignApproved", "HtmlImageFiles", c => c.String());
            AddColumn("dbo.CampaignApproved", "OrderNumber", c => c.String());
            AddColumn("dbo.Campaign", "RebroadId", c => c.Guid());
            AddColumn("dbo.Campaign", "IONumber", c => c.String());
            AddColumn("dbo.Campaign", "SuppressionFile", c => c.String());
            AddColumn("dbo.Campaign", "FinalSeedList", c => c.String());
            AddColumn("dbo.Campaign", "TestSeedList", c => c.String());
            AddColumn("dbo.Campaign", "HtmlImageFiles", c => c.String());
            AddColumn("dbo.Campaign", "ZipCodeFile", c => c.String());
            AddColumn("dbo.CampaignCreative", "OrderNumber", c => c.String());
            DropForeignKey("dbo.CampaignTracking", "CampaignId", "dbo.Campaign");
            DropForeignKey("dbo.CampaignSegment", "CampaignId", "dbo.Campaign");
            DropForeignKey("dbo.Notification", "CampaignId", "dbo.Campaign");
            DropForeignKey("dbo.Campaign", "AssetsId", "dbo.CampaignAsset");
            DropIndex("dbo.CampaignTracking", new[] { "CampaignId" });
            DropIndex("dbo.CampaignSegment", new[] { "CampaignId" });
            DropIndex("dbo.Notification", new[] { "CampaignId" });
            DropIndex("dbo.Campaign", new[] { "AssetsId" });
            AlterColumn("dbo.Campaign", "BroadcastDate", c => c.DateTime(nullable: false));
            DropColumn("dbo.SystemLog", "LogStatus");
            DropColumn("dbo.SystemLog", "LogType");
            DropColumn("dbo.CampaignTesting", "ChannelTypes");
            DropColumn("dbo.CampaignTesting", "Impressions");
            DropColumn("dbo.CampaignTesting", "OmniDeployDate");
            DropColumn("dbo.CampaignTesting", "IsOmniOrder");
            DropColumn("dbo.CampaignTesting", "OpenPixelUrl");
            DropColumn("dbo.CampaignTesting", "IsOpenPixel");
            DropColumn("dbo.CampaignTesting", "DateFetched");
            DropColumn("dbo.CampaignTesting", "DataFileUrl");
            DropColumn("dbo.CampaignTesting", "DataFileQuantity");
            DropColumn("dbo.CampaignTesting", "ClickGoals");
            DropColumn("dbo.CampaignTesting", "OpenGoals");
            DropColumn("dbo.CampaignApproved", "IsUseApiDataForOpen");
            DropColumn("dbo.CampaignApproved", "ChannelTypes");
            DropColumn("dbo.CampaignApproved", "Impressions");
            DropColumn("dbo.CampaignApproved", "OmniDeployDate");
            DropColumn("dbo.CampaignApproved", "IsOmniOrder");
            DropColumn("dbo.CampaignApproved", "OpenPixelUrl");
            DropColumn("dbo.CampaignApproved", "IsOpenPixel");
            DropColumn("dbo.CampaignApproved", "DataFileUrl");
            DropColumn("dbo.CampaignApproved", "DataFileQuantity");
            DropColumn("dbo.CampaignApproved", "ClickGoals");
            DropColumn("dbo.CampaignApproved", "OpenGoals");
            DropColumn("dbo.Campaign", "AssetsId");
            DropColumn("dbo.Campaign", "ReBroadcastedOrderNumber");
            DropColumn("dbo.Campaign", "ReBroadcastedQuantity");
            DropColumn("dbo.Campaign", "ReBroadcastedDate");
            DropColumn("dbo.Campaign", "ReBroadcasted");
            DropColumn("dbo.Campaign", "ChannelTypes");
            DropColumn("dbo.Campaign", "Impressions");
            DropColumn("dbo.Campaign", "OmniDeployDate");
            DropColumn("dbo.Campaign", "IsOmniOrder");
            DropColumn("dbo.Campaign", "OpenPixelUrl");
            DropColumn("dbo.Campaign", "IsOpenPixel");
            DropColumn("dbo.Campaign", "DataFileQuantity");
            DropTable("dbo.CampaignTracking");
            DropTable("dbo.CampaignSegment");
            DropTable("dbo.Notification");
            DropTable("dbo.CampaignAsset");
            CreateIndex("dbo.Campaign", "RebroadId");
            AddForeignKey("dbo.Campaign", "RebroadId", "dbo.Campaign", "Id");
            RenameTable(name: "dbo.SystemLog", newName: "MailChimpAPILog");
        }
    }
}
