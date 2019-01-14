namespace ADSDataDirect.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Ez : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.CampaignTesting", "ClickMeterGroupId", c => c.String());
            AddColumn("dbo.CampaignTesting", "ClickMeterRotatorLinkId", c => c.String());
            AddColumn("dbo.CampaignTesting", "ClickMeterRotatorLink", c => c.String());
            AddColumn("dbo.CampaignTesting", "EzStates", c => c.String());
            AddColumn("dbo.CampaignTesting", "EzDMAs", c => c.String());
            AddColumn("dbo.CampaignTesting", "EzLinksFile", c => c.String());
            AddColumn("dbo.CampaignTracking", "Day1Clicks", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTracking", "Day2Clicks", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTracking", "Day3Clicks", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTracking", "Day4Clicks", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTracking", "Day5Clicks", c => c.Long(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.CampaignTracking", "Day5Clicks");
            DropColumn("dbo.CampaignTracking", "Day4Clicks");
            DropColumn("dbo.CampaignTracking", "Day3Clicks");
            DropColumn("dbo.CampaignTracking", "Day2Clicks");
            DropColumn("dbo.CampaignTracking", "Day1Clicks");
            DropColumn("dbo.CampaignTesting", "EzLinksFile");
            DropColumn("dbo.CampaignTesting", "EzDMAs");
            DropColumn("dbo.CampaignTesting", "EzStates");
            DropColumn("dbo.CampaignTesting", "ClickMeterRotatorLink");
            DropColumn("dbo.CampaignTesting", "ClickMeterRotatorLinkId");
            DropColumn("dbo.CampaignTesting", "ClickMeterGroupId");
        }
    }
}
