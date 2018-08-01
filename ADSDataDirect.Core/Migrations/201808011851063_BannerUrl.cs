namespace ADSDataDirect.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class BannerUrl : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Campaign", "BannerUrl", c => c.String());
            AddColumn("dbo.CampaignApproved", "BannerUrl", c => c.String());
            AddColumn("dbo.CampaignTesting", "BannerUrl", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.CampaignTesting", "BannerUrl");
            DropColumn("dbo.CampaignApproved", "BannerUrl");
            DropColumn("dbo.Campaign", "BannerUrl");
        }
    }
}
