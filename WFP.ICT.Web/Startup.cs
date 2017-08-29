using System;
using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Owin;
using System.Globalization;
using Hangfire;
using Hangfire.Dashboard;
using Microsoft.AspNet.Identity.EntityFramework;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.Async;
using WFP.ICT.Web.Hangfire;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Hubs;
using WFP.ICT.Web.ProData;

[assembly: OwinStartup(typeof(WFP.ICT.Web.Startup))]
namespace WFP.ICT.Web
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

            WFPICTUpdater.Instance.StartUpdatingClients();

            // CheckForQCRules 
            RecurringJob.AddOrUpdate("FetchAndCheckForQCRules", () => NotificationsProcessor.FetchAndCheckForQcRules(), Cron.HourInterval(3));

            RecurringJob.AddOrUpdate("SendNotificationEmails", () => NotificationsProcessor.SendNotificationEmails(), "0 8,12,17 * * *");
            // RecurringJob.AddOrUpdate("SendNotificationEmails", () => NotificationsProcessor.SendNotificationEmails(), Cron.Minutely);

        }

        private void SetupInitialSettings()
        {
            using (WfpictContext ctx = new WfpictContext())
            {
                var userManager = new UserManager<Data.Entities.WfpUser>(new UserStore<Data.Entities.WfpUser>(ctx));
                userManager.FindByName("admin");
            }
        }
    }
}
