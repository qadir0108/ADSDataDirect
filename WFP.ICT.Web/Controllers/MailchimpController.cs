using System.Threading.Tasks;
using System.Web.Mvc;
using MailChimp.Net;
using MailChimp.Net.Interfaces;
using MailChimp.Net.Models;

namespace WFP.ICT.Web.Controllers
{
    public class MailchimpController : Controller
    {
        // GET: Mailchimp
        public async Task<ActionResult> Index()
        {
            IMailChimpManager manager = new MailChimpManager(); //if you have it in config
            var mailChimpListCollection = await manager.Lists.GetAllAsync().ConfigureAwait(false);

            var listId = "beef55c8bb";
            var members = await manager.Members.GetAllAsync(listId).ConfigureAwait(false);

            // Use the Status property if updating an existing member
            var member = new Member { EmailAddress = $"githubTestAccount@test.com", StatusIfNew = Status.Subscribed };
            member.MergeFields.Add("FNAME", "HOLY");
            member.MergeFields.Add("LNAME", "COW");
            await manager.Members.AddOrUpdateAsync(listId, member);

            return View(mailChimpListCollection);
        }
    }
}