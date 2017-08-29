using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using PagedList;
using WFP.ICT.Enum;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Controllers
{
    public class CompanyController : BaseController
    {
        private const int PageSize = 15;
        private ApplicationUserManager _userManager;
        private ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
        }

        #region Users

        public ActionResult Users(CampaignSearchVM sc)
        {
            var model = UserManager.Users.Select(x =>
            new UserProfileVM()
            {
                Id = x.Id,
                UserName = x.UserName,
                Email = x.Email,
                DateCreated = x.CreatedAt.ToString(),
                Status = x.Status,
                Type = x.UserType,
                FirstName = x.FirstName,
                LastName = x.LastName,
                CompanyName = x.CompanyName,
                CompanyLogo = x.CompanyLogo,
                WhiteLabel = x.WhiteLabel,
                ReportTemplate = x.ReportTemplate,
                IsTestsCreatives = x.IsTestsCreatives,
                IsUsesApi = x.IsUsesApi
            }).ToList();

            int pageNumber = (sc.page ?? 1);
            var Model = model.ToPagedList(pageNumber, PageSize);
            ViewBag.WhiteLabel = CustomersList;
            return View("Users", Model);
        }

        public ActionResult ChangeWhiteLabel(Guid? userId, string whiteLabel)
        {
            try
            {
                var user = UserManager.FindById(userId.ToString());
                user.WhiteLabel = whiteLabel;
                Db.SaveChanges();
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult SaveUser(CompanyUsersVM model)
        {
            try
            {
                var user = UserManager.FindById(model.ID.ToString());
                switch (model.Action)
                {
                    case "lock":
                        if (user.Status == (int)UserStatus.Active)
                        {
                            user.Status = (int)UserStatus.Locked;
                            user.LockoutEndDateUtc = new DateTime(9999, 12, 30);
                            bool a = UserManager.IsLockedOut(user.Id);
                        }
                        else if (user.Status == (int)UserStatus.Locked)
                        {
                            user.Status = (int)UserStatus.Active;
                            user.LockoutEndDateUtc = null;
                            bool a = UserManager.IsLockedOut(user.Id);
                        }
                        break;
                    case "type":
                        if (user.UserType == (int)UserType.Admin)
                        {
                            user.UserType = (int)UserType.User;
                        }
                        else if (user.UserType == (int)UserType.User)
                        {
                            user.UserType = (int)UserType.Admin;
                        }
                        break;
                    case "tests":
                        if (user.IsTestsCreatives)
                        {
                            user.IsTestsCreatives = false;
                        }
                        else
                        {
                            user.IsTestsCreatives = true;
                        }
                        break;
                    case "password":
                        if (!string.IsNullOrEmpty(model.Password))
                        {
                            string resetToken = UserManager.GeneratePasswordResetToken(user.Id);
                            IdentityResult passwordChangeResult = UserManager.ResetPassword(user.Id, resetToken, model.Password);
                            if (passwordChangeResult != IdentityResult.Success)
                            {
                                throw new AdsException(passwordChangeResult.Errors.FirstOrDefault());
                            }
                        }
                        break;
                    case "delete":
                        UserManager.Delete(user);
                        break;
                }
                Db.SaveChanges();
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message },
                    JsonRequestBehavior.AllowGet);
            }
        }

        #endregion
    }
}