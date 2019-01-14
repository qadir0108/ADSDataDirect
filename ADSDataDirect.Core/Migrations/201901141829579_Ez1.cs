namespace ADSDataDirect.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Ez1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Campaign", "ReBroadcastedURL", c => c.String());
            AddColumn("dbo.CampaignTracking", "Day6Clicks", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTracking", "Day7Clicks", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTracking", "Day7PlusClicks", c => c.Long(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.CampaignTracking", "Day7PlusClicks");
            DropColumn("dbo.CampaignTracking", "Day7Clicks");
            DropColumn("dbo.CampaignTracking", "Day6Clicks");
            DropColumn("dbo.Campaign", "ReBroadcastedURL");
        }
    }
}
