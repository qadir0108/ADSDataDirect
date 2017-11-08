namespace ADSDataDirect.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class TrackingChanges : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.CampaignTesting", "PaceDays", c => c.Int(nullable: false));
            AddColumn("dbo.CampaignTracking", "Deployed", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTracking", "DeliveryPercentage", c => c.Double(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.CampaignTracking", "DeliveryPercentage");
            DropColumn("dbo.CampaignTracking", "Deployed");
            DropColumn("dbo.CampaignTesting", "PaceDays");
        }
    }
}
