using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using PagedList;

namespace ADSDataDirect.Web.Controllers
{
    [Authorize]
    public class CompanyController : BaseController
    {
        private ApplicationUserManager _userManager;
        private ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
        }

        #region Users

        public ActionResult Users(CampaignSearchVm sc)
        {
            var model = UserManager.Users
                .Where(x => x.UserName != "kamran.qadir")
                .Select(x =>
            new UserProfileVm()
            {
                Id = x.Id,
                UserName = x.UserName,
                Email = x.Email,
                DateCreated = x.CreatedAt.ToString(),
                Status = x.Status,
                Type = x.UserType,
                FirstName = x.FirstName,
                LastName = x.LastName,
                CustomerId = x.CustomerId.ToString(),
                IsTestsCreatives = x.IsTestsCreatives,
                IsUsesApi = x.IsUsesApi
            }).ToList();

            ViewBag.WhiteLabel = CustomersList;
            int pageNumber = (sc.Page ?? 1);
            return View("Users", model.ToPagedList(pageNumber, PageSize));
        }

        public ActionResult ChangeWhiteLabel(Guid? userId, Guid? whiteLabel)
        {
            try
            {
                var user = UserManager.FindById(userId.ToString());
                user.CustomerId = whiteLabel;
                Db.SaveChanges();
                SetupLoggedInUser(user.UserName);
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult SaveUser(CompanyUsersVm model)
        {
            try
            {
                var user = UserManager.FindById(model.Id.ToString());
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
                        switch (user.UserType)
                        {
                            case (int)UserType.Admin:
                                user.UserType = (int)UserType.User;
                                break;
                            case (int)UserType.User:
                                user.UserType = (int)UserType.Admin;
                                break;
                        }
                        break;
                    case "tests":
                        user.IsTestsCreatives = !user.IsTestsCreatives;
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