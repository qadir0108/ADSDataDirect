using System.Globalization;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Web;
using ADSDataDirect.Web.Hangfire;
using ADSDataDirect.Web.Hubs;
using Hangfire;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin;
using Owin;
using System;
using ADSDataDirect.Enums;
using ADSDataDirect.Infrastructure.Notifications;

[assembly: OwinStartup(typeof(Startup))]
namespace ADSDataDirect.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            CultureInfo.DefaultThreadCurrentCulture = CultureInfo.GetCultureInfo("en-US");
            CultureInfo.DefaultThreadCurrentUICulture = CultureInfo.GetCultureInfo("en-US");

            ConfigureAuth(app);
            
            SetupInitialSettings();

            //GlobalConfiguration.Configuration.UseSqlServerStorage("WFPICTContext");
            app.UseHangfireDashboard($"/hangfire", new DashboardOptions
            {
                Authorization = new[]
                {
                    new HangfireAuthorizationFilter()
                    //new LocalRequestsOnlyAuthorizationFilter()
                }
            });
            app.UseHangfireServer();

            app.MapSignalR();

            WfpictUpdater.Instance.StartUpdatingClients();

            // CheckForQCRules 
            RecurringJob.AddOrUpdate("FetchAndCheckForQCRules", () => NotificationsProcessor.FetchAndCheckForQcRules(), Cron.HourInterval(3));

            // "0 8,12,17 * * *"
            // Cron.Minutely
            RecurringJob.AddOrUpdate("SendNotificationEmails", () => 
                        NotificationsProcessor.SendNotificationEmails(), 
                        "0 9,16 * * *",
                        TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time")
                );

        }

        private void SetupInitialSettings()
        {
            using (WfpictContext ctx = new WfpictContext())
            {
                var userManager = new UserManager<WfpUser>(new UserStore<WfpUser>(ctx));
                if(userManager.FindByName("kamran.qadir") != null)
                    return;

                var adminUser = new WfpUser
                {
                    Id = Guid.NewGuid().ToString(),
                    CreatedAt = DateTime.Now,
                    UserName = "kamran.qadir",
                    Email = "qadir0108@gmail.com",
                    Status = (int)UserStatus.Active,
                    UserType = (int)UserType.Admin
                };
                var result = userManager.CreateAsync(adminUser, "P@kistan1");
                if (result.Result == IdentityResult.Success)
                {
                    //Success
                }
                
            }
        }
    }
}
