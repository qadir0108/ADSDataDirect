namespace ADSDataDirect.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Opener : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.CampaignTesting", "DataFileUrlOpener", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.CampaignTesting", "DataFileUrlOpener");
        }
    }
}
