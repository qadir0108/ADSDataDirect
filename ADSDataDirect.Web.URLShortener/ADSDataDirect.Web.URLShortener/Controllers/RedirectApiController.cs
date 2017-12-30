using ADSDataDirect.Core.Entities;
using ADSDataDirect.Web.URLShortener.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace ADSDataDirect.Web.URLShortener.Controllers
{
    public class RedirectApiController : ApiController
    {
        [HttpGet]
        [ActionName("get")]
        [Route("{orderNumber}/{type}/{id}")]
        // GET: api/Redirect/5
        public async Task<IHttpActionResult> Get(string orderNumber, string type, string id)
        {
            string join = $"{orderNumber}/{type}/{id}";
            string redirectURL = "http://www.google.com";
            try
            {
                using (WfpictContext context= new WfpictContext())
                {
                    // Check if link is present in links table
                    bool ifLinkPresent = context.DynamicCodingLinks.Any(x => x.OrderNumber == orderNumber && x.VerumURL == join);
                    if (!ifLinkPresent) throw new Exception($"Link {join} is not present in links");

                    // Pick that 2501/u/1 that is not yet redemed! e.g. link with unique 90750431
                    DynamicCodingLink link = context.DynamicCodingLinks
                        .FirstOrDefault(x => x.OrderNumber == orderNumber 
                                          && x.VerumURL == join
                                          && x.IsURLRedemed == false);

                    if (link == null && (type == "u" || type == "ou"))
                    {
                        // In case of clicks only; consume other links that are not yet in the same Order
                        link = context.DynamicCodingLinks
                        .FirstOrDefault(x => x.OrderNumber == orderNumber
                                            && x.URLType == "u"
                                            && x.IsURLRedemed == false);
                    }

                    if (link == null) throw new Exception("No more link");

                    redirectURL = link.OrignalURL; 
                    link.IsURLRedemed = true;
                    context.SaveChanges();

                    // Fire open link
                    if(type == "ou")
                    {
                        DynamicCodingLink openLink = context.DynamicCodingLinks
                        .FirstOrDefault(x => x.OrderNumber == orderNumber
                                          && x.URLType == "o"
                                          && x.IsURLRedemed == false);

                        if (openLink == null) throw new Exception("Open links finished");

                        var httpClient = new HttpClient();
                        var content = await httpClient.GetAsync(openLink.OrignalURL);
                        if(content.IsSuccessStatusCode)
                        {
                            openLink.IsURLRedemed = true;
                            context.SaveChanges();
                        }
                    }
                    
                }
            }
            catch(Exception ex) {
                // Empty
            }

            return Redirect(redirectURL);
        }

    }
}
