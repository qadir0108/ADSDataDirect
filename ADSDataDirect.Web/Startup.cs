using System.Globalization;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Web;
using ADSDataDirect.Web.Hangfire;
using ADSDataDirect.Web.Hubs;
using ADSDataDirect.Web.ProData;
using Hangfire;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin;
using Owin;

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

            RecurringJob.AddOrUpdate("SendNotificationEmails", () => NotificationsProcessor.SendNotificationEmails(), "0 8,12,17 * * *");
            // RecurringJob.AddOrUpdate("SendNotificationEmails", () => NotificationsProcessor.SendNotificationEmails(), Cron.Minutely);

        }

        private void SetupInitialSettings()
        {
            using (WfpictContext ctx = new WfpictContext())
            {
                var userManager = new UserManager<WfpUser>(new UserStore<WfpUser>(ctx));
                userManager.FindByName("admin");
            }
        }
    }
}
