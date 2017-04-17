namespace WFP.ICT.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial : DbMigration
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
            
            CreateTable(
                "dbo.Campaign",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Status = c.Int(nullable: false),
                        CampaignName = c.String(),
                        BroadcastDate = c.DateTime(nullable: false),
                        RepresentativeName = c.String(),
                        RepresentativeEmail = c.String(),
                        ReBroadCast = c.Boolean(nullable: false),
                        ReBroadcastDate = c.DateTime(),
                        Price = c.Long(nullable: false),
                        TestingUrgency = c.Int(nullable: false),
                        ZipCodeFile = c.String(),
                        GeoDetails = c.String(),
                        Demographics = c.String(),
                        Quantity = c.Long(nullable: false),
                        FromLine = c.String(),
                        SubjectLine = c.String(),
                        HtmlImageFiles = c.String(),
                        TestSeedList = c.String(),
                        FinalSeedList = c.String(),
                        SuppressionFile = c.String(),
                        IsPersonalization = c.Boolean(nullable: false),
                        IsMatchback = c.Boolean(nullable: false),
                        IsSuppression = c.Boolean(nullable: false),
                        WhiteLabel = c.String(),
                        OptOut = c.String(),
                        SpecialInstructions = c.String(),
                        ReferenceNumber = c.Long(nullable: false),
                        OrderNumber = c.String(),
                        AssignedToCustomer = c.String(),
                        IsTested = c.Boolean(nullable: false),
                        TestingTime = c.DateTime(),
                        CreativeURL = c.String(),
                        ZipURL = c.String(),
                        LinkBreakout = c.String(),
                        ReportSiteLink = c.String(),
                        IONumber = c.String(),
                        ParentId = c.Guid(),
                        ReBroadcastOrderNumber = c.String(),
                        ReBroadQuantity = c.Long(nullable: false),
                        IP = c.String(),
                        Browser = c.String(),
                        OS = c.String(),
                        Referrer = c.String(),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                        Copy_Id = c.Guid(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Campaign", t => t.Copy_Id)
                .Index(t => t.Copy_Id);
            
            CreateTable(
                "dbo.ProData",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        IO = c.String(),
                        CampaignName = c.String(),
                        Reportsite_URL = c.String(),
                        Destination_URL = c.String(),
                        CampaignStartDate = c.String(),
                        ClickCount = c.Long(nullable: false),
                        UniqueCnt = c.Long(nullable: false),
                        MobileCnt = c.Long(nullable: false),
                        ImpressionCnt = c.Long(nullable: false),
                        CampaignId = c.Guid(),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Campaign", t => t.CampaignId)
                .Index(t => t.CampaignId);
            
            CreateTable(
                "dbo.AspNetClaims",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        ClaimType = c.String(),
                        ClaimValue = c.String(),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.AspNetRoleClaims",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        ClaimID = c.Guid(nullable: false),
                        RoleID = c.String(maxLength: 128),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AspNetClaims", t => t.ClaimID, cascadeDelete: true)
                .ForeignKey("dbo.AspNetRoles", t => t.RoleID)
                .Index(t => t.ClaimID)
                .Index(t => t.RoleID);
            
            CreateTable(
                "dbo.AspNetRoles",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        Name = c.String(nullable: false, maxLength: 256),
                        Description = c.String(),
                        IsEditable = c.Boolean(),
                        IsDeletable = c.Boolean(),
                        Discriminator = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => t.Id)
                .Index(t => t.Name, unique: true, name: "RoleNameIndex");
            
            CreateTable(
                "dbo.AspNetUserRoles",
                c => new
                    {
                        UserId = c.String(nullable: false, maxLength: 128),
                        RoleId = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => new { t.UserId, t.RoleId })
                .ForeignKey("dbo.AspNetRoles", t => t.RoleId, cascadeDelete: true)
                .ForeignKey("dbo.AspNetUsers", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId)
                .Index(t => t.RoleId);
            
            CreateTable(
                "dbo.AspNetUsers",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        FirstName = c.String(),
                        LastName = c.String(),
                        APIKey = c.String(),
                        LastLogin = c.DateTime(),
                        Status = c.Int(nullable: false),
                        IsLocalUser = c.Boolean(nullable: false),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedByID = c.String(maxLength: 128),
                        Email = c.String(maxLength: 256),
                        EmailConfirmed = c.Boolean(nullable: false),
                        PasswordHash = c.String(),
                        SecurityStamp = c.String(),
                        PhoneNumber = c.String(),
                        PhoneNumberConfirmed = c.Boolean(nullable: false),
                        TwoFactorEnabled = c.Boolean(nullable: false),
                        LockoutEndDateUtc = c.DateTime(),
                        LockoutEnabled = c.Boolean(nullable: false),
                        AccessFailedCount = c.Int(nullable: false),
                        UserName = c.String(nullable: false, maxLength: 256),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AspNetUsers", t => t.CreatedByID)
                .Index(t => t.CreatedByID)
                .Index(t => t.UserName, unique: true, name: "UserNameIndex");
            
            CreateTable(
                "dbo.AspNetUserClaims",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserId = c.String(nullable: false, maxLength: 128),
                        ClaimType = c.String(),
                        ClaimValue = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AspNetUsers", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.AspNetUserLogins",
                c => new
                    {
                        LoginProvider = c.String(nullable: false, maxLength: 128),
                        ProviderKey = c.String(nullable: false, maxLength: 128),
                        UserId = c.String(nullable: false, maxLength: 128),
                    })
                .PrimaryKey(t => new { t.LoginProvider, t.ProviderKey, t.UserId })
                .ForeignKey("dbo.AspNetUsers", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.Vendor",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Name = c.String(),
                        CompanyName = c.String(),
                        Email = c.String(),
                        Phone = c.String(),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.AspNetUserRoles", "UserId", "dbo.AspNetUsers");
            DropForeignKey("dbo.AspNetUserLogins", "UserId", "dbo.AspNetUsers");
            DropForeignKey("dbo.AspNetUsers", "CreatedByID", "dbo.AspNetUsers");
            DropForeignKey("dbo.AspNetUserClaims", "UserId", "dbo.AspNetUsers");
            DropForeignKey("dbo.AspNetUserRoles", "RoleId", "dbo.AspNetRoles");
            DropForeignKey("dbo.AspNetRoleClaims", "RoleID", "dbo.AspNetRoles");
            DropForeignKey("dbo.AspNetRoleClaims", "ClaimID", "dbo.AspNetClaims");
            DropForeignKey("dbo.ProData", "CampaignId", "dbo.Campaign");
            DropForeignKey("dbo.Campaign", "Copy_Id", "dbo.Campaign");
            DropIndex("dbo.AspNetUserLogins", new[] { "UserId" });
            DropIndex("dbo.AspNetUserClaims", new[] { "UserId" });
            DropIndex("dbo.AspNetUsers", "UserNameIndex");
            DropIndex("dbo.AspNetUsers", new[] { "CreatedByID" });
            DropIndex("dbo.AspNetUserRoles", new[] { "RoleId" });
            DropIndex("dbo.AspNetUserRoles", new[] { "UserId" });
            DropIndex("dbo.AspNetRoles", "RoleNameIndex");
            DropIndex("dbo.AspNetRoleClaims", new[] { "RoleID" });
            DropIndex("dbo.AspNetRoleClaims", new[] { "ClaimID" });
            DropIndex("dbo.ProData", new[] { "CampaignId" });
            DropIndex("dbo.Campaign", new[] { "Copy_Id" });
            DropTable("dbo.Vendor");
            DropTable("dbo.AspNetUserLogins");
            DropTable("dbo.AspNetUserClaims");
            DropTable("dbo.AspNetUsers");
            DropTable("dbo.AspNetUserRoles");
            DropTable("dbo.AspNetRoles");
            DropTable("dbo.AspNetRoleClaims");
            DropTable("dbo.AspNetClaims");
            DropTable("dbo.ProData");
            DropTable("dbo.Campaign");
            DropTable("dbo.APIRequest");
        }
    }
}
