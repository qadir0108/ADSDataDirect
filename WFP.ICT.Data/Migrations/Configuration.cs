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
                Status = (int)UserStatusEnum.Active
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
                Email = "test.user@gmail.com",
                Status = (int)UserStatusEnum.Active
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
                    
                    OrderNumber = "2500",
                    ReferenceNumber = 8662551
                }
            };
            foreach (var campaign in campaigns)
            {
                context.Campaigns.Add(campaign);
            }
            context.SaveChanges();

            var status = new CampaignStatus()
            {
                Id = Guid.NewGuid(),
                CreatedAt = DateTime.Now,
                CampaignId = compaignId,
                Status = (int)CampaignStatusEnum.OrderRecevied,
                //DeployDateTime = DateTime.Now.AddDays(1),
                //ReportSiteLink = "http://ameliorate-reporting.com/campclick/report/HAWCHEV1202",
                //IsTested = true,
                //SeedsAdded = 1000,
                //TestingStartTime = DateTime.Now.AddDays(2),
                //TestingEndTime = DateTime.Now.AddDays(2).AddHours(1),
                //Duration = 60*60*1,
                //TestingUser = "38.127.116.226",
                //TestingBrowser = "Firefox",
                //TestingOs = "Windows",
                //TestingReferrer = "https://fs12.formsite.com/enelson/form60/index.html"
            };
            context.CampaignStatuses.Add(status);
            context.SaveChanges();
        }
    }
}
