using ADSDataDirect.Enums;

namespace WFP.ICT.Data.Migrations
{
    using Entities;
    using Enum;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using System;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<WFPICTContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
            
        }

        protected override void Seed(WFPICTContext context)
        {
            // Look for any students.
            if (context.Users.Any())
            {
                return;   // DB has been seeded
            }

            var UserManager = new UserManager<Data.Entities.WFPUser>(new UserStore<Data.Entities.WFPUser>(context));

            var appUser = new WFPUser
            {
                Id = Guid.NewGuid().ToString(),
                CreatedAt = DateTime.Now,
                UserName = "josh.silver",
                Email = "josh.silver@adsdatadirect.com",
                Status = (int)UserStatusEnum.Active,
                UserType = (int)UserTypeEnum.Admin
            };
            var result = UserManager.CreateAsync(appUser, "P@kistan1");
            if (result.Result == IdentityResult.Success)
            {
            }

            appUser = new WFPUser
            {
                Id = Guid.NewGuid().ToString(),
                CreatedAt = DateTime.Now,
                UserName = "test.user",
                Email = "qadir0108@gmail.com",
                Status = (int)UserStatusEnum.Active,
                UserType = (int)UserTypeEnum.User
            };
            result = UserManager.CreateAsync(appUser, "P@kistan1");
            if (result.Result == IdentityResult.Success)
            {
            }

            var compaignId = Guid.NewGuid();
            var campaigns = new Campaign[]
            {
                new Campaign
                {
                    Id = compaignId,
                    CreatedAt = DateTime.Now,
                    CreatedBy = "josh.silver",

                    Status = (int)CampaignStatusEnum.OrderRecevied,

                    CampaignName = "Car Dealership 123",
                    BroadcastDate = DateTime.Now.AddDays(5),
                    RepresentativeName = "Josh Silver",
                    RepresentativeEmail = "josh.silver@adsdatadirect.com",
                    ReBroadCast = true,
                    ReBroadcastDate = DateTime.Now.AddMonths(1),
                    Price = 10000,
                    TestingUrgency = (int)TestingUrgencyEnum.One_Three_Hour,

                    ZipCodeFile = "zipcodes_1.csv",
                    GeoDetails = "1 km around 5432",
                    Demographics = "NY",
                    Quantity = 5000000,

                    FromLine = "Testing",
                    SubjectLine = "This is testing",
                    HtmlImageFiles = "test.html",
                    TestSeedList = "testSeed.csv",
                    FinalSeedList = "finalSeed.csv",

                    SuppressionFile = "suppression.csv",
                    IsPersonalization = true,
                    IsMatchback = false,
                    IsSuppression = true,
                    WhiteLabel = "MM",
                    OptOut = "MM",
                    SpecialInstructions = "Hello, this is special instructions, please do it quickly",
                    
                    OrderNumber = "2500"
                }
            };
            foreach (var campaign in campaigns)
            {
                context.Campaigns.Add(campaign);
            }
            context.SaveChanges();

            var vendor = new WFP.ICT.Data.Entities.Vendor()
            {
                Id = Guid.NewGuid(),
                CreatedAt = DateTime.Now,
                Email = "qadir0108@gmail.com",
                CCEmails = @"jkorkin@prodata.media,josh.silver@adsdatdirect.com,jkorkin@safedatatech.onmicrosoft.com,eric@adsdatadirect.com,john.benuck@amelioratedata.com",
                Name = "Vendor",
                CompanyName = "Vendor Company"
            };
            context.Vendors.Add(vendor);
            context.SaveChanges();
            
        }
    }
}
