namespace WFP.ICT.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CampaginChanges : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Campaign", "IsAddViewInBrowser", c => c.Boolean(nullable: false));
            AddColumn("dbo.Campaign", "IsAddOptOut", c => c.Boolean(nullable: false));
            AddColumn("dbo.CampaignTesting", "HtmlImagesStatus", c => c.Int(nullable: false));
            AddColumn("dbo.CampaignTesting", "ZipURLStatus", c => c.Int(nullable: false));
            AddColumn("dbo.CampaignTesting", "TestSeedURL", c => c.String());
            AddColumn("dbo.CampaignTesting", "TestSeedStatus", c => c.Int(nullable: false));
            AddColumn("dbo.CampaignTesting", "LiveSeedURL", c => c.String());
            AddColumn("dbo.CampaignTesting", "LiveSeedStatus", c => c.Int(nullable: false));
            AddColumn("dbo.CampaignTesting", "SuppressionURL", c => c.String());
            AddColumn("dbo.CampaignTesting", "SuppressionStatus", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.CampaignTesting", "SuppressionStatus");
            DropColumn("dbo.CampaignTesting", "SuppressionURL");
            DropColumn("dbo.CampaignTesting", "LiveSeedStatus");
            DropColumn("dbo.CampaignTesting", "LiveSeedURL");
            DropColumn("dbo.CampaignTesting", "TestSeedStatus");
            DropColumn("dbo.CampaignTesting", "TestSeedURL");
            DropColumn("dbo.CampaignTesting", "ZipURLStatus");
            DropColumn("dbo.CampaignTesting", "HtmlImagesStatus");
            DropColumn("dbo.Campaign", "IsAddOptOut");
            DropColumn("dbo.Campaign", "IsAddViewInBrowser");
        }
    }
}
