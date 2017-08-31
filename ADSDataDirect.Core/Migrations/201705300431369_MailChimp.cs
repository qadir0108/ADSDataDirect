using System.Data.Entity.Migrations;

namespace ADSDataDirect.Core.Migrations
{
    public partial class MailChimp : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CampaignCreative",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        CampaignId = c.Guid(),
                        OrderNumber = c.String(),
                        CreativeHtml = c.String(),
                        IsTested = c.Boolean(nullable: false),
                        TestDateTime = c.DateTime(),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.MailChimpAPILog",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        OrderNumber = c.String(),
                        Message = c.String(),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.Campaign", "CreativeId", c => c.Guid());
            CreateIndex("dbo.Campaign", "CreativeId");
            AddForeignKey("dbo.Campaign", "CreativeId", "dbo.CampaignCreative", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Campaign", "CreativeId", "dbo.CampaignCreative");
            DropIndex("dbo.Campaign", new[] { "CreativeId" });
            DropColumn("dbo.Campaign", "CreativeId");
            DropTable("dbo.MailChimpAPILog");
            DropTable("dbo.CampaignCreative");
        }
    }
}
