﻿using System;
using System.Configuration;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using ADSDataDirect.Web.Controllers;
using ADSDataDirect.Web.Hangfire;
using ADSDataDirect.Infrastructure.Emails;

namespace ADSDataDirect.Web
{
    public class MvcApplication : HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);

            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            HangfireBootstrapper.Instance.Start();
        }

        protected void Application_End(object sender, EventArgs e)
        {
            HangfireBootstrapper.Instance.Stop();
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            var httpContext = ((MvcApplication)sender).Context;
            var currentController = " ";
            var currentAction = " ";
            var currentRouteData = RouteTable.Routes.GetRouteData(new HttpContextWrapper(httpContext));

            if (currentRouteData != null)
            {
                if (currentRouteData.Values["controller"] != null && !string.IsNullOrEmpty(currentRouteData.Values["controller"].ToString()))
                {
                    currentController = currentRouteData.Values["controller"].ToString();
                }

                if (currentRouteData.Values["action"] != null && !string.IsNullOrEmpty(currentRouteData.Values["action"].ToString()))
                {
                    currentAction = currentRouteData.Values["action"].ToString();
                }
            }
            var ex = Server.GetLastError();

            try
            {
                if(ex is HttpException)
                {
                    if(((HttpException)ex).GetHttpCode() != 404)
                    {
                        EmailHelper.SendErrorEmail(ConfigurationManager.AppSettings["ErrorEmailAddress"], ex, currentController, currentAction);
                    }
                }
            }
            catch (Exception exx)
            {
                //
            }

            var routeData = new RouteData();
            var action = "GenericError";

            if (ex is HttpException)
            {
                var httpEx = ex as HttpException;

                switch (httpEx.GetHttpCode())
                {
                    case 400:
                        action = "BadRequest";
                        break;
                    case 404:
                        action = "NotFound";
                        break;
                        // others if any
                }
            }

            httpContext.ClearError();
            httpContext.Response.Clear();
            httpContext.Response.StatusCode = ex is HttpException ? ((HttpException)ex).GetHttpCode() : 500;
            httpContext.Response.TrySkipIisCustomErrors = true;

            routeData.Values["controller"] = "Error";
            routeData.Values["action"] = action;
            routeData.Values["exception"] = new HandleErrorInfo(ex, currentController, currentAction);

            IController errorController = new ErrorController();
            HttpContextWrapper wrapper = new HttpContextWrapper(httpContext);
            var rc = new RequestContext(wrapper, routeData);
            errorController.Execute(rc);
        }
    }
}
