using System.Linq;
using System.Web.Mvc;
using ADSDataDirect.Web.Helpers;
using ADSDataDirect.Web.Models;

namespace ADSDataDirect.Web.Controllers
{
    [Authorize]
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
            return RedirectToAction("Index", "Campaigns");
        }

        #region Settings

        public ActionResult Settings()
        {
            UserProfileVm profile = null;
            if (LoggedInUser == null) return RedirectToAction("Login", "Account");

            if (string.IsNullOrEmpty(LoggedInUser?.ApiKey))
            {
                var user = Db.Users.FirstOrDefault(x => x.Id == LoggedInUser.Id);
                if (user != null) user.ApiKey = KeyGenerator.GetUniqueKey(32);
                Db.SaveChanges();
                SetupLoggedInUser(LoggedInUser.UserName);
            }

            profile = new UserProfileVm()
            {
                UserName = LoggedInUser.UserName,
                FirstName = LoggedInUser.FirstName,
                LastName = LoggedInUser.LastName,
                Email = LoggedInUser.Email,
                IsUsesApi = LoggedInUser.IsUsesApi,
                ApiKey = LoggedInUser.ApiKey,
            };

            return View("Settings", profile);
        }

        [HttpPost]
        public ActionResult Settings(UserProfileVm profile)
        {
            var user = Db.Users.FirstOrDefault(x => x.Id == LoggedInUser.Id);
            if (user == null) return View("Error");

            user.FirstName = profile.FirstName;
            user.LastName = profile.LastName;
            user.Email = profile.Email;
            Db.SaveChanges();

            SetupLoggedInUser(LoggedInUser.UserName);

            TempData["Success"] = "Settings has been saved successfully!";
            return RedirectToAction("Settings");
        }

        #endregion

    }
}