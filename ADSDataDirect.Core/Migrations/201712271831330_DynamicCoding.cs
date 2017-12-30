namespace ADSDataDirect.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DynamicCoding : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.DynamicCodingLink",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        OrderNumber = c.String(),
                        CampaignId = c.Guid(),
                        SalesMasterId = c.Int(nullable: false),
                        OrignalURL = c.String(),
                        URLType = c.String(),
                        VerumURL = c.String(),
                        IsURLRedemed = c.Boolean(nullable: false),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.DynamicCodingLookup",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        OrderNumber = c.String(),
                        CampaignId = c.Guid(),
                        VerumURL = c.String(),
                        OrignalURL = c.String(),
                        URLType = c.String(),
                        Qunatity = c.Long(nullable: false),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.CampaignTesting", "IsDynamicCoding", c => c.Boolean(nullable: false));
            AddColumn("dbo.CampaignTesting", "DynamicCodingFile", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.CampaignTesting", "DynamicCodingFile");
            DropColumn("dbo.CampaignTesting", "IsDynamicCoding");
            DropTable("dbo.DynamicCodingLookup");
            DropTable("dbo.DynamicCodingLink");
        }
    }
}
