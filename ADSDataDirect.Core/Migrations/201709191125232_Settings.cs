namespace ADSDataDirect.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Settings : DbMigration
    {
        public override void Up()
        {
            DropIndex("dbo.AspNetRoleClaims", new[] { "ClaimID" });
            DropIndex("dbo.AspNetRoleClaims", new[] { "RoleID" });
            CreateTable(
                "dbo.Settings",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Key = c.String(),
                        Value = c.String(),
                        Data = c.String(),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.Notification", "Message", c => c.String());
            AddColumn("dbo.CampaignTracking", "SentOrder", c => c.String());
            AddColumn("dbo.Customer", "WhiteLabel", c => c.String());
            AddColumn("dbo.Customer", "CompanyName", c => c.String());
            AddColumn("dbo.Customer", "CompanyLogo", c => c.String());
            AddColumn("dbo.Customer", "ReportTemplate", c => c.String());
            AddColumn("dbo.AspNetUsers", "CustomerId", c => c.Guid());
            CreateIndex("dbo.AspNetRoleClaims", "ClaimId");
            CreateIndex("dbo.AspNetRoleClaims", "RoleId");
            CreateIndex("dbo.AspNetUsers", "CustomerId");
            AddForeignKey("dbo.AspNetUsers", "CustomerId", "dbo.Customer", "Id");
            DropColumn("dbo.Customer", "Code");
            DropColumn("dbo.Customer", "Name");
            DropColumn("dbo.AspNetUsers", "CompanyName");
            DropColumn("dbo.AspNetUsers", "CompanyLogo");
            DropColumn("dbo.AspNetUsers", "WhiteLabel");
            DropColumn("dbo.AspNetUsers", "ReportTemplate");
        }
        
        public override void Down()
        {
            AddColumn("dbo.AspNetUsers", "ReportTemplate", c => c.String());
            AddColumn("dbo.AspNetUsers", "WhiteLabel", c => c.String());
            AddColumn("dbo.AspNetUsers", "CompanyLogo", c => c.String());
            AddColumn("dbo.AspNetUsers", "CompanyName", c => c.String());
            AddColumn("dbo.Customer", "Name", c => c.String());
            AddColumn("dbo.Customer", "Code", c => c.String());
            DropForeignKey("dbo.AspNetUsers", "CustomerId", "dbo.Customer");
            DropIndex("dbo.AspNetUsers", new[] { "CustomerId" });
            DropIndex("dbo.AspNetRoleClaims", new[] { "RoleId" });
            DropIndex("dbo.AspNetRoleClaims", new[] { "ClaimId" });
            DropColumn("dbo.AspNetUsers", "CustomerId");
            DropColumn("dbo.Customer", "ReportTemplate");
            DropColumn("dbo.Customer", "CompanyLogo");
            DropColumn("dbo.Customer", "CompanyName");
            DropColumn("dbo.Customer", "WhiteLabel");
            DropColumn("dbo.CampaignTracking", "SentOrder");
            DropColumn("dbo.Notification", "Message");
            DropTable("dbo.Settings");
            CreateIndex("dbo.AspNetRoleClaims", "RoleID");
            CreateIndex("dbo.AspNetRoleClaims", "ClaimID");
        }
    }
}
