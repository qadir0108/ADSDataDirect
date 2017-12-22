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
    public class RedirectController : ApiController
    {
        [HttpGet]
        [ActionName("get")]
        [Route("{orderNumber}/{type}/{id}")]
        // GET: api/Redirect/5
        public async Task<IHttpActionResult> Get(string orderNumber, string type, string id)
        {
           
            string join = $"{orderNumber}/{type}/{id}";
            string redirectURL = "http://verumdm.com";
            try
            {
                using (WfpictContext context= new WfpictContext())
                {
                    CampaignLink link;
                    switch (type)
                    {
                        case "u":
                            link = context.CampaignLinks.FirstOrDefault(x => x.OrderNumber == orderNumber && x.URL == join);
                            if (link == null) break;
                            redirectURL = $"https://vt.orbee.co?oa_aid=98&oa_cpid=9&oa_vtid=EB28225D1&oa_source=www.glakeshonda.com&oa_uid={link.SalesMasterId}";
                            link.IsURLRedemed = true;
                            break;
                        case "o":
                            link = context.CampaignLinks.FirstOrDefault(x => x.OrderNumber == orderNumber && x.OpenURL == join);
                            if (link == null) break;
                            redirectURL = $"https://rs.orbee.co?oa_aid=98&oa_cpid=9&oa_ctid=EB28225D1&oa_uid={link.SalesMasterId}&oa_campaign=GreatLakesHonda&oa_dest=http%3A%2F%2Fwww.glakeshonda.com%2Fnew-inventory%2Findex.htm%3Futm_source%3DEchoMCM%26utm_medium%3DAcquisition%26utm_content%3DTheme%26utm_campaign%3DEB28225D1";
                            link.IsOpenURLRedemed = true;
                            break;
                        case "b":
                            link = context.CampaignLinks.FirstOrDefault(x => x.OrderNumber == orderNumber && x.BannerURL == join);
                            if (link == null) break;
                            redirectURL = $"https://rs.orbee.co?oa_aid=98&oa_cpid=9&oa_ctid=EB28225D3&oa_uid={link.SalesMasterId}&oa_campaign=GreatLakesHonda&oa_dest=http%3A%2F%2Fwww.glakeshonda.com%2F%3Futm_source%3DEchoMCM%26utm_medium%3DAcquisition%26utm_content%3DHome%26utm_campaign%3DEB28225D3";
                            link.IsBannerURLRedemed = true;
                            break;
                    }
                    context.SaveChanges();
                }
                
            }
            catch { }

            return Redirect(redirectURL);
        }

    }
}
