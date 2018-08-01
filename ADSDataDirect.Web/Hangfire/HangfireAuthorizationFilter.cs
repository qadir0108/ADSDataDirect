﻿using Hangfire.Dashboard;
using Microsoft.Owin;

namespace ADSDataDirect.Web.Hangfire
{
    public class HangfireAuthorizationFilter : IDashboardAuthorizationFilter
    {
        public bool Authorize(DashboardContext context)
        {
            // In case you need an OWIN context, use the next line, `OwinContext` class
            // is the part of the `Microsoft.Owin` package.
            var owinContext = new OwinContext(context.GetOwinEnvironment());

            // Allow all authenticated users to see the Dashboard (potentially dangerous).
            // return owinContext.Authentication.User.Identity.IsAuthenticated
            string userName = owinContext.Authentication.User.Identity.Name;
            return userName == "josh.silver" || userName == "kamran.qadir";
        }
    }
}