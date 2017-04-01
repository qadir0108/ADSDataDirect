using System;
using System.Linq;
using System.Web.Mvc;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Controllers
{
    [Authorize]
    [AjaxAuthorize]
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult UserProfile()
        {
            UserProfileVM profile = new UserProfileVM()
            {
                FirstName = (LoggedInUser != null) ? LoggedInUser.FirstName : null,
                LastName = (LoggedInUser != null) ? LoggedInUser.LastName : null,
                
            };
            return View("UserProfile", profile);
        }

        [HttpPost]
        public ActionResult UserProfile(UserProfileVM profile)
        {
            try
            {
                var user = CurrentContextFromOwin.Users.FirstOrDefault(x => x.Id == LoggedInUser.Id);
                user.FirstName = profile.FirstName;
                user.LastName = profile.LastName;
                CurrentContextFromOwin.SaveChanges();

                SetupLoggedInUser(LoggedInUser.UserName);
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}