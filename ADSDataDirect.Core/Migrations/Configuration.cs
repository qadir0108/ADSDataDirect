using System;
using System.Data.Entity.Migrations;
using System.Linq;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace ADSDataDirect.Core.Migrations
{
    internal sealed class Configuration : DbMigrationsConfiguration<WfpictContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
            
        }

        protected override void Seed(WfpictContext context)
        {
            // Look for any students.
            if (context.Users.Any())
            {
                return;   // DB has been seeded
            }

            var userManager = new UserManager<WfpUser>(new UserStore<WfpUser>(context));

            var appUser = new WfpUser
            {
                Id = Guid.NewGuid().ToString(),
                CreatedAt = DateTime.Now,
                UserName = "josh.silver",
                Email = "josh.silver@adsdatadirect.com",
                Status = (int)UserStatus.Active,
                UserType = (int)UserType.Admin
            };
            var result = userManager.CreateAsync(appUser, "P@kistan1");
            if (result.Result == IdentityResult.Success)
            {
                //Success
            }

            appUser = new WfpUser
            {
                Id = Guid.NewGuid().ToString(),
                CreatedAt = DateTime.Now,
                UserName = "test.user",
                Email = "qadir0108@gmail.com",
                Status = (int)UserStatus.Active,
                UserType = (int)UserType.User
            };
            result = userManager.CreateAsync(appUser, "P@kistan1");
            if (result.Result == IdentityResult.Success)
            {
                //Success
            }

            var compaignId = Guid.NewGuid();
            var asset = new CampaignAsset()
            {
                Id = Guid.NewGuid(),
                CreatedAt = DateTime.Now,
                CampaignId = compaignId,
                ZipCodeFile = "2500/2500zip.csv",
                CreativeFiles = "2500/2500_html.zip",
                TestSeedFile = "2500/2500test.csv",
                LiveSeedFile = "2500/2500live.csv",
                SuppressionFile = "2500/2500supp.csv",
            };
            var campaigns = new Campaign[]
            {
                new Campaign
                {
                    Id = compaignId,
                    CreatedAt = DateTime.Now,
                    CreatedBy = "josh.silver",

                    Status = (int)CampaignStatus.OrderRecevied,
                    CampaignName = "Car Dealership 123",
                    BroadcastDate = DateTime.Now.AddDays(5),
                    RepresentativeName = "Josh Silver",
                    RepresentativeEmail = "josh.silver@adsdatadirect.com",
                    ReBroadCast = true,
                    ReBroadcastDate = DateTime.Now.AddMonths(1),
                    Price = 10000,
                    TestingUrgency = (int)TestingUrgency.One_Three_Hour,
                    GeoDetails = "1 km around 5432",
                    Demographics = "NY",
                    Quantity = 100000,
                    FromLine = "Testing",
                    SubjectLine = "This is testing",
                    IsPersonalization = true,
                    IsMatchback = false,
                    IsSuppression = true,
                    WhiteLabel = "reporting.consumermkts.com",
                    OptOut = "MM",
                    SpecialInstructions = "Hello, this is special instructions, please do it quickly",
                    OrderNumber = "2500",
                    IsOpenPixel = true,
                    OpenPixelUrl = "http://www.opened.com/pix101",
                    DataFileQuantity = 1800,
                    Assets = asset
                }
            };
            foreach (var campaign in campaigns)
            {
                context.Campaigns.Add(campaign);
            }
            context.SaveChanges();

            var vendor = new Vendor()
            {
                Id = Guid.NewGuid(),
                CreatedAt = DateTime.Now,
                Email = "qadir0108@gmail.com",
                CcEmails = @"jkorkin@prodata.media,josh.silver@adsdatdirect.com,jkorkin@safedatatech.onmicrosoft.com,eric@adsdatadirect.com,john.benuck@amelioratedata.com",
                Name = "Test Vendor",
                CompanyName = "Vendor Company"
            };
            context.Vendors.Add(vendor);
            context.SaveChanges();
            
        }
    }
}
