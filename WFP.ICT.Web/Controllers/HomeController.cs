using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;
using PagedList;
using WFP.ICT.Enum;
using WFP.ICT.Web.ProData;

namespace WFP.ICT.Web.Controllers
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
            UserProfileVM profile = null;
            if (LoggedInUser == null) return View("Settings", (UserProfileVM) null);

            if (string.IsNullOrEmpty(LoggedInUser?.ApiKey))
            {
                var user = Db.Users.FirstOrDefault(x => x.Id == LoggedInUser.Id);
                if (user != null) user.ApiKey = KeyGenerator.GetUniqueKey(32);
                Db.SaveChanges();
                SetupLoggedInUser(LoggedInUser.UserName);
            }

            profile = new UserProfileVM()
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
        public ActionResult Settings(UserProfileVM profile)
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