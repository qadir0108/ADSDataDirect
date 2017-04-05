namespace WFP.ICT.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Key : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.APIRequest",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        APIKey = c.String(),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.AspNetUsers", "APIKey", c => c.String());
            DropColumn("dbo.AspNetUsers", "Description");
        }
        
        public override void Down()
        {
            AddColumn("dbo.AspNetUsers", "Description", c => c.String());
            DropColumn("dbo.AspNetUsers", "APIKey");
            DropTable("dbo.APIRequest");
        }
    }
}
