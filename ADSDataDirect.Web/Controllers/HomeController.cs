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
            if (LoggedInUser == null) return View("Settings", (UserProfileVm) null);

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
                CompanyName = LoggedInUser.CompanyName,
                WhiteLabel = LoggedInUser.WhiteLabel,
                CompanyLogo = LoggedInUser.CompanyLogo,
                ReportTemplate = LoggedInUser.ReportTemplate,
                IsUsesApi = LoggedInUser.IsUsesApi,
                ApiKey = LoggedInUser.ApiKey,
            };

            ViewBag.ReportTemplate = new SelectList(ReportTemplates, "Value", "Text", profile.ReportTemplate);

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
            user.CompanyName = profile.CompanyName;
            user.WhiteLabel = profile.WhiteLabel;
            user.CompanyLogo = profile.CompanyLogo;
            user.ReportTemplate = profile.ReportTemplate;
            Db.SaveChanges();

            SetupLoggedInUser(LoggedInUser.UserName);

            ViewBag.ReportTemplate = new SelectList(ReportTemplates, "Value","Text", profile.ReportTemplate);
            TempData["Success"] = "Settings has been saved successfully!";
            return RedirectToAction("Settings");
        }

        #endregion

    }
}