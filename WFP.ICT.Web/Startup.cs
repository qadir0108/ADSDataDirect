using System;
using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Owin;
using System.Globalization;
using Hangfire;
using Microsoft.AspNet.Identity.EntityFramework;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.Async;
using WFP.ICT.Web.Helpers;

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

            GlobalConfiguration.Configuration.UseSqlServerStorage("WFPICTContext");
            //app.UseHangfireDashboard();
            app.UseHangfireDashboard("/hangfire", new DashboardOptions
            {
                Authorization = new[] { new HangfireAuthorizationFilter() }
            });
            app.UseHangfireServer();

            // CheckForQCRules 
            //RecurringJob.AddOrUpdate("CheckForQCRules", () => NotificationsProcessor.CheckForQCRules(), Cron.Minutely);

            //RecurringJob.AddOrUpdate("SendNotificationEmails", () => NotificationsProcessor.SendNotificationEmails(), "0 8,12,17 * * *");
            //RecurringJob.AddOrUpdate("SendNotificationEmails", () => NotificationsProcessor.SendNotificationEmails(), Cron.Minutely);

        }

        private void SetupInitialSettings()
        {
            using (WFPICTContext ctx = new WFPICTContext())
            {
                var UserManager = new UserManager<Data.Entities.WFPUser>(new UserStore<Data.Entities.WFPUser>(ctx));
                var alreadyAdminUser = UserManager.FindByName("admin");
            }
        }
    }
}
