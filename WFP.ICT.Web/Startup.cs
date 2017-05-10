using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Owin;
using System;
using System.Globalization;
using System.Linq;
using Hangfire;
using Microsoft.AspNet.Identity.EntityFramework;
using WFP.ICT.Data.Entities;
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

            GlobalConfiguration.Configuration.UseSqlServerStorage("WFPICTContext");
            //app.UseHangfireDashboard();
            app.UseHangfireDashboard("/hangfire", new DashboardOptions
            {
                Authorization = new[] { new HangfireAuthorizationFilter() }
            });
            app.UseHangfireServer();

            SetupInitialSettings();
        }

        private void SetupInitialSettings()
        {
            //using (WFPICTContext ctx = new WFPICTContext())
            //{
                
            //    var UserManager = new UserManager<Data.Entities.WFPUser>(new UserStore<Data.Entities.WFPUser>(ctx));
            //    var alreadyAdminUser = UserManager.FindByName(SecurityConstants.UserICTAdmin);
            //    if (alreadyAdminUser == null)
            //    {
            //        var adminUser = new Data.Entities.WFPUser()
            //        {
            //            Id = Guid.NewGuid().ToString(),
            //            UserName = SecurityConstants.UserICTAdmin,
            //            Email = SecurityConstants.UserICTAdmin + "@wfp.org",
            //            FirstName = "Admin",
            //            LastName = "User",
            //            OfficeID = office.ID,
            //            CreatedAt = DateTime.Now
            //        };
            //        var result = UserManager.CreateAsync(adminUser, SecurityConstants.UserICTAdminPassword);
            //        if (result.Result == IdentityResult.Success)
            //        {
            //            var result1 = UserManager.AddToRole(adminUser.Id, SecurityConstants.RoleICTAdmin);
            //        }
            //    }

            //    var alreadyGaurdUser = UserManager.FindByName(SecurityConstants.UserGaurds);
            //    if (alreadyGaurdUser == null)
            //    {
            //        var gaurdUser = new Data.Entities.WFPUser()
            //        {
            //            Id = Guid.NewGuid().ToString(),
            //            UserName = SecurityConstants.UserGaurds,
            //            Email = SecurityConstants.UserGaurds + "@wfp.org",
            //            FirstName = "Security",
            //            LastName = "Gaurds",
            //            CreatedAt = DateTime.Now
            //        };
            //        var result = UserManager.CreateAsync(gaurdUser, SecurityConstants.UserGaurdsPassword);
            //        if (result.Result == IdentityResult.Success)
            //        {
            //            var result1 = UserManager.AddToRole(gaurdUser.Id, SecurityConstants.RoleSecurityGaurds);
            //        }
            //    }

            //}
        }

        private void AddClaims(WFPICTContext ctx, ApplicationRoleManager RoleManager, string Role, string[] permissions)
        {
            var role = RoleManager.FindByName(Role);
            foreach (var permisson in permissions)
            {
                var claim = ctx.Claims.FirstOrDefault(x => x.ClaimValue == permisson);
                RoleManager.AddClaim(ctx, role.Id, claim.Id);
            }
        }
    }
}
