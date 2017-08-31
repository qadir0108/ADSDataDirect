using System.Data.Entity.Migrations;

namespace ADSDataDirect.Core.Migrations
{
    public partial class DeletedSettings : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "IsUsesAPI", c => c.Boolean(nullable: false));
            AddColumn("dbo.AspNetUsers", "IsTestsCreatives", c => c.Boolean(nullable: false));
            AddColumn("dbo.AspNetUsers", "CompanyLogo", c => c.String());
            AddColumn("dbo.Vendor", "CCEmails", c => c.String());
            DropColumn("dbo.Vendor", "IsUsesAPI");
            DropTable("dbo.Settings");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.Settings",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Key = c.String(),
                        Value = c.String(),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.Vendor", "IsUsesAPI", c => c.Boolean(nullable: false));
            DropColumn("dbo.Vendor", "CCEmails");
            DropColumn("dbo.AspNetUsers", "CompanyLogo");
            DropColumn("dbo.AspNetUsers", "IsTestsCreatives");
            DropColumn("dbo.AspNetUsers", "IsUsesAPI");
        }
    }
}
