namespace ADSDataDirect.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ClickOpenModel : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.OpenModelKeyword",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Keyword = c.String(),
                        RulePercentage = c.Single(nullable: false),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.CampaignAsset", "OpenModelLinksFile", c => c.String());
            AddColumn("dbo.CampaignAsset", "OpenModelLinksCount", c => c.Int(nullable: false));
            AddColumn("dbo.CampaignAsset", "OpenModelImageFile", c => c.String());
            AddColumn("dbo.CampaignAsset", "SFDClientId", c => c.Int(nullable: false));
            AddColumn("dbo.Campaign", "BannerUrl", c => c.String());
            AddColumn("dbo.CampaignApproved", "BannerUrl", c => c.String());
            AddColumn("dbo.CampaignTesting", "BannerUrl", c => c.String());
            AddColumn("dbo.CampaignTracking", "RetargetingImpressions", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTracking", "RetargetingClicks", c => c.Long(nullable: false));
            AddColumn("dbo.Customer", "IsUseOpenModel", c => c.Boolean(nullable: false));
            AddColumn("dbo.Customer", "OpenInitial", c => c.Long(nullable: false));
            AddColumn("dbo.Customer", "OpenEnd", c => c.Long(nullable: false));
            AddColumn("dbo.Customer", "ClickInitial", c => c.Long(nullable: false));
            AddColumn("dbo.Customer", "ClickEnd", c => c.Long(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Customer", "ClickEnd");
            DropColumn("dbo.Customer", "ClickInitial");
            DropColumn("dbo.Customer", "OpenEnd");
            DropColumn("dbo.Customer", "OpenInitial");
            DropColumn("dbo.Customer", "IsUseOpenModel");
            DropColumn("dbo.CampaignTracking", "RetargetingClicks");
            DropColumn("dbo.CampaignTracking", "RetargetingImpressions");
            DropColumn("dbo.CampaignTesting", "BannerUrl");
            DropColumn("dbo.CampaignApproved", "BannerUrl");
            DropColumn("dbo.Campaign", "BannerUrl");
            DropColumn("dbo.CampaignAsset", "SFDClientId");
            DropColumn("dbo.CampaignAsset", "OpenModelImageFile");
            DropColumn("dbo.CampaignAsset", "OpenModelLinksCount");
            DropColumn("dbo.CampaignAsset", "OpenModelLinksFile");
            DropTable("dbo.OpenModelKeyword");
        }
    }
}
