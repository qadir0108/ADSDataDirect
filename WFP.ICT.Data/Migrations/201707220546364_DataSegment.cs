namespace WFP.ICT.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DataSegment : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CampaignSegment",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        CampaignId = c.Guid(),
                        CampaignTestingId = c.Guid(),
                        FirstRangeStart = c.Int(nullable: false),
                        FirstRangeEnd = c.Int(nullable: false),
                        SecondRangeStart = c.Int(nullable: false),
                        SecondRangeEnd = c.Int(nullable: false),
                        SegmentIoNumber = c.String(),
                        SegmentDataFileUrl = c.String(),
                        DateFetched = c.DateTime(),
                        DataFileStatus = c.Int(nullable: false),
                        DateSent = c.DateTime(),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.CampaignTesting", t => t.CampaignTestingId)
                .Index(t => t.CampaignTestingId);
            
            AddColumn("dbo.Campaign", "IsAccessCreativeManager", c => c.Boolean(nullable: false));
            AddColumn("dbo.Campaign", "IsOpenPixel", c => c.Boolean(nullable: false));
            AddColumn("dbo.Campaign", "OpenPixelUrl", c => c.String());
            AddColumn("dbo.Campaign", "OpenGoals", c => c.Long(nullable: false));
            AddColumn("dbo.Campaign", "ClickGoals", c => c.Long(nullable: false));
            AddColumn("dbo.Campaign", "BannersFile", c => c.String());
            AddColumn("dbo.Campaign", "BannersLinksFile", c => c.String());
            AddColumn("dbo.Campaign", "MiscFile", c => c.String());
            AddColumn("dbo.Campaign", "OrderType", c => c.Int(nullable: false));
            AddColumn("dbo.Campaign", "DataFileQuantity", c => c.Long(nullable: false));
            AddColumn("dbo.Campaign", "DataFileSegments", c => c.Int(nullable: false));
            AddColumn("dbo.CampaignApproved", "IsOpenPixel", c => c.Boolean(nullable: false));
            AddColumn("dbo.CampaignApproved", "OpenPixelUrl", c => c.String());
            AddColumn("dbo.CampaignApproved", "OpenGoals", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignApproved", "ClickGoals", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignApproved", "DataFileQuantity", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignApproved", "DataFileUrl", c => c.String());
            AddColumn("dbo.CampaignApproved", "DataFileSegments", c => c.Int(nullable: false));
            AddColumn("dbo.CampaignApproved", "IsUseApiDataForOpen", c => c.Boolean(nullable: false));
            AddColumn("dbo.CampaignTesting", "OpenGoals", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTesting", "ClickGoals", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTesting", "DataFileQuantity", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTesting", "DataFileSegments", c => c.Int(nullable: false));
            AddColumn("dbo.CampaignTesting", "DataFileUrl", c => c.String());
            AddColumn("dbo.CampaignTesting", "DateFetched", c => c.DateTime());
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.CampaignSegment", "CampaignTestingId", "dbo.CampaignTesting");
            DropIndex("dbo.CampaignSegment", new[] { "CampaignTestingId" });
            DropColumn("dbo.CampaignTesting", "DateFetched");
            DropColumn("dbo.CampaignTesting", "DataFileUrl");
            DropColumn("dbo.CampaignTesting", "DataFileSegments");
            DropColumn("dbo.CampaignTesting", "DataFileQuantity");
            DropColumn("dbo.CampaignTesting", "ClickGoals");
            DropColumn("dbo.CampaignTesting", "OpenGoals");
            DropColumn("dbo.CampaignApproved", "IsUseApiDataForOpen");
            DropColumn("dbo.CampaignApproved", "DataFileSegments");
            DropColumn("dbo.CampaignApproved", "DataFileUrl");
            DropColumn("dbo.CampaignApproved", "DataFileQuantity");
            DropColumn("dbo.CampaignApproved", "ClickGoals");
            DropColumn("dbo.CampaignApproved", "OpenGoals");
            DropColumn("dbo.CampaignApproved", "OpenPixelUrl");
            DropColumn("dbo.CampaignApproved", "IsOpenPixel");
            DropColumn("dbo.Campaign", "DataFileSegments");
            DropColumn("dbo.Campaign", "DataFileQuantity");
            DropColumn("dbo.Campaign", "OrderType");
            DropColumn("dbo.Campaign", "MiscFile");
            DropColumn("dbo.Campaign", "BannersLinksFile");
            DropColumn("dbo.Campaign", "BannersFile");
            DropColumn("dbo.Campaign", "ClickGoals");
            DropColumn("dbo.Campaign", "OpenGoals");
            DropColumn("dbo.Campaign", "OpenPixelUrl");
            DropColumn("dbo.Campaign", "IsOpenPixel");
            DropColumn("dbo.Campaign", "IsAccessCreativeManager");
            DropTable("dbo.CampaignSegment");
        }
    }
}
