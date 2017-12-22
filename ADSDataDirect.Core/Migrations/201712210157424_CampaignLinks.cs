namespace ADSDataDirect.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CampaignLinks : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CampaignLink",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        OrderNumber = c.String(),
                        CampaignId = c.Guid(),
                        SalesMasterId = c.Int(nullable: false),
                        URL = c.String(),
                        IsURLRedemed = c.Boolean(nullable: false),
                        OpenURL = c.String(),
                        IsOpenURLRedemed = c.Boolean(nullable: false),
                        BannerURL = c.String(),
                        IsBannerURLRedemed = c.Boolean(nullable: false),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.CampaignLink");
        }
    }
}
