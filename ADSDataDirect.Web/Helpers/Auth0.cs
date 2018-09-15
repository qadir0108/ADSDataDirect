using System;
using System.Configuration;
using System.Web.Mvc;
using System.Web.Routing;
using ADSDataDirect.Infrastructure.Auth0;

namespace ADSDataDirect.Web.Helpers
{
    public class Auth0 : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {           
            try
            {
                if (____.___)
                {
                    base.OnActionExecuting(filterContext);
                    return;
                }
            }
            catch(Exception ex)
            {
                //
            }

            filterContext.Result =
                    new RedirectToRouteResult(new RouteValueDictionary   
                    {  
                        { "action", "NotFound" },  
                        { "controller", "Error" }
                    });
            return;
        }
    }
}