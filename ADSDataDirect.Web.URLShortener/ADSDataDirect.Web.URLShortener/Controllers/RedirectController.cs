using ADSDataDirect.Core.Entities;
using ADSDataDirect.Web.URLShortener.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace ADSDataDirect.Web.URLShortener.Controllers
{
    public class RedirectController : Controller
    {
        [HttpGet]
        [ActionName("get")]
        [Route("{orderNumber}/{type}/{id}")]
        // GET: api/Redirect/5
        public ActionResult Get(string orderNumber, string type, string id)
        {
            string join = $"{orderNumber}/{type}/{id}";
            string redirectURL = "http://www.google.com";
            try
            {
                using (WfpictContext context= new WfpictContext())
                {
                    // Pick that 2501/u/1 that is not yet redemed! e.g. link with unique 90750431
                    DynamicCodingLink link = context.DynamicCodingLinks
                        .FirstOrDefault(x => x.OrderNumber == orderNumber 
                                          && x.VerumURL == join
                                          && x.IsURLRedemed == false);
                    if (link == null)
                    {
                        // consume other links that are not yet in the same Order
                        link = context.DynamicCodingLinks
                        .FirstOrDefault(x => x.OrderNumber == orderNumber
                                            && x.URLType == "u"
                                            && x.IsURLRedemed == false);
                    }

                    if (link == null) throw new Exception("No more link");

                    redirectURL = link.OrignalURL; 
                    link.IsURLRedemed = true;
                    context.SaveChanges();
                }
            }
            catch { }

            return View(redirectURL);
            //return Redirect(redirectURL);
        }

    }
}
