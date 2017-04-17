using System;
using System.Linq;
using System.Web.Mvc;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Controllers
{
    [Authorize]
    [AjaxAuthorize]
    public class HomeController : BaseController
    {
        private WFPICTContext db = new WFPICTContext();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Settings()
        {
            if (string.IsNullOrEmpty(LoggedInUser.APIKey))
            {
                var user = CurrentContextFromOwin.Users.FirstOrDefault(x => x.Id == LoggedInUser.Id);
                user.APIKey = KeyGenerator.GetUniqueKey(32);
                CurrentContextFromOwin.SaveChanges();
                SetupLoggedInUser(LoggedInUser.UserName);
            }
            UserProfileVM profile = new UserProfileVM()
            {
                APIKey = LoggedInUser.APIKey,
                Email = LoggedInUser.Email
            };
            return View("Settings",  profile);
        }

        [HttpPost]
        public ActionResult Settings(UserProfileVM profile)
        {
            try
            {
                var user = CurrentContextFromOwin.Users.FirstOrDefault(x => x.Id == LoggedInUser.Id);
                user.Email = profile.Email;
                //user.APIKey = profile.APIKey;
                CurrentContextFromOwin.SaveChanges();

                SetupLoggedInUser(LoggedInUser.UserName);
                TempData["Success"] = "Profile has been updated successfully!";
                return RedirectToAction("Settings");
            }
            catch (Exception ex)
            {
                
            }
            return View("Error");
        }

        public ActionResult Vendor()
        {
            var vendor = db.Vendors.FirstOrDefault();
            UserProfileVM profile = new UserProfileVM()
            {
                FirstName = vendor.Name,
                LastName = vendor.CompanyName,
                Email = vendor.Email
            };
            return View("Vendor", profile);
        }

        [HttpPost]
        public ActionResult Vendor(UserProfileVM profile)
        {
            try
            {
                var vendor = db.Vendors.FirstOrDefault();
                vendor.Name = profile.FirstName;
                vendor.CompanyName = profile.LastName;
                vendor.Email = profile.Email;
                db.SaveChanges();
                TempData["Success"] = "Vendor settings has been updated successfully!";
                return RedirectToAction("Vendor");
            }
            catch (Exception ex)
            {

            }
            return View("Error");
        }
    }
}