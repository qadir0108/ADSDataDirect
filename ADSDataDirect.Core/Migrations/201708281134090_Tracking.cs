using System.Data.Entity.Migrations;

namespace ADSDataDirect.Core.Migrations
{
    public partial class Tracking : DbMigration
    {
        public override void Up()
        {
            DropIndex("dbo.AspNetUsers", new[] { "CreatedByID" });
            CreateTable(
                "dbo.Customer",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Code = c.String(),
                        Name = c.String(),
                        WebDomain = c.String(),
                        Email = c.String(),
                        Phone = c.String(),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.Notification", "SegmentNumber", c => c.String());
            AddColumn("dbo.ProData", "OrderNumber", c => c.String());
            AddColumn("dbo.ProData", "SegmentNumber", c => c.String());
            AddColumn("dbo.CampaignSegment", "Quantity", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignSegment", "FromLine", c => c.String());
            AddColumn("dbo.CampaignSegment", "WhiteLabel", c => c.String());
            AddColumn("dbo.CampaignTracking", "OrderNumber", c => c.String());
            AddColumn("dbo.CampaignTracking", "Quantity", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTracking", "Unsub", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTracking", "Forwards", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTracking", "OpenedPercentage", c => c.Double(nullable: false));
            AddColumn("dbo.CampaignTracking", "ClickedPercentage", c => c.Double(nullable: false));
            AddColumn("dbo.CampaignTracking", "UnsubPercentage", c => c.Double(nullable: false));
            AddColumn("dbo.CampaignTracking", "ClickToOpenPercentage", c => c.Double(nullable: false));
            AddColumn("dbo.CampaignTracking", "UnsubToOpenPercentage", c => c.Double(nullable: false));
            AddColumn("dbo.CampaignTracking", "Bounce", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTracking", "Opt", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTracking", "Desktop", c => c.Long(nullable: false));
            AddColumn("dbo.CampaignTracking", "Mobile", c => c.Long(nullable: false));
            AddColumn("dbo.AspNetUsers", "CompanyName", c => c.String());
            AddColumn("dbo.AspNetUsers", "WhiteLabel", c => c.String());
            AddColumn("dbo.AspNetUsers", "ReportTemplate", c => c.String());
            AlterColumn("dbo.CampaignTracking", "StartDate", c => c.DateTime());
            CreateIndex("dbo.AspNetUsers", "CreatedById");
            DropColumn("dbo.CampaignSegment", "BroadcastDate");
            DropColumn("dbo.CampaignSegment", "DateSent");
            DropColumn("dbo.Vendor", "APIKey");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Vendor", "APIKey", c => c.String());
            AddColumn("dbo.CampaignSegment", "DateSent", c => c.DateTime());
            AddColumn("dbo.CampaignSegment", "BroadcastDate", c => c.DateTime());
            DropIndex("dbo.AspNetUsers", new[] { "CreatedById" });
            AlterColumn("dbo.CampaignTracking", "StartDate", c => c.String());
            DropColumn("dbo.AspNetUsers", "ReportTemplate");
            DropColumn("dbo.AspNetUsers", "WhiteLabel");
            DropColumn("dbo.AspNetUsers", "CompanyName");
            DropColumn("dbo.CampaignTracking", "Mobile");
            DropColumn("dbo.CampaignTracking", "Desktop");
            DropColumn("dbo.CampaignTracking", "Opt");
            DropColumn("dbo.CampaignTracking", "Bounce");
            DropColumn("dbo.CampaignTracking", "UnsubToOpenPercentage");
            DropColumn("dbo.CampaignTracking", "ClickToOpenPercentage");
            DropColumn("dbo.CampaignTracking", "UnsubPercentage");
            DropColumn("dbo.CampaignTracking", "ClickedPercentage");
            DropColumn("dbo.CampaignTracking", "OpenedPercentage");
            DropColumn("dbo.CampaignTracking", "Forwards");
            DropColumn("dbo.CampaignTracking", "Unsub");
            DropColumn("dbo.CampaignTracking", "Quantity");
            DropColumn("dbo.CampaignTracking", "OrderNumber");
            DropColumn("dbo.CampaignSegment", "WhiteLabel");
            DropColumn("dbo.CampaignSegment", "FromLine");
            DropColumn("dbo.CampaignSegment", "Quantity");
            DropColumn("dbo.ProData", "SegmentNumber");
            DropColumn("dbo.ProData", "OrderNumber");
            DropColumn("dbo.Notification", "SegmentNumber");
            DropTable("dbo.Customer");
            CreateIndex("dbo.AspNetUsers", "CreatedByID");
        }
    }
}
