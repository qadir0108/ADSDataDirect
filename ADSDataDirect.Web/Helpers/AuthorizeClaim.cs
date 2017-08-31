using System;
using System.Linq;
using System.Security.Claims;
using System.Web.Mvc;
using System.Web.Routing;

namespace ADSDataDirect.Web.Helpers
{
    public class AuthorizeClaim : ActionFilterAttribute
    {
        public string Claims { get; set; }

        /// <summary>
        /// Method: OnActionExecuting
        /// Comments: This action filter method is user authorized to access the page.
        /// Parameters: Required the Page Permissions enum   
        /// </summary>
        /// <param name="filterContext"></param>
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {           
            bool ifAllowed = false;

            try
            {
                // Check Claims
                var userIdentity = filterContext.HttpContext.User.Identity as ClaimsIdentity;
                //var roles = userIdentity.Claims.Where(x => x.Type == ClaimTypes.Role).Select(claim =>claim.Value).ToArray();
                var claims = userIdentity.Claims.Where(x => x.Type == ClaimTypes.UserData).Select(claim => claim.Value).ToList();
                var claimsList = Claims.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);

                foreach (var requestedClaim in claimsList)
                {
                    if (claims.Contains(requestedClaim))
                    {
                        ifAllowed = true;
                        break;
                    }
                }
                
                if (ifAllowed)
                {
                    base.OnActionExecuting(filterContext);
                    return;
                }
            }
            catch(Exception ex)
            {
              
            }

            // Redirect to Error page
            filterContext.Result =
                    new RedirectToRouteResult(new RouteValueDictionary   
                    {  
                        { "action", "NotAuthorized" },  
                        { "controller", "Error" }
                    });
            return;
        }
    }
}