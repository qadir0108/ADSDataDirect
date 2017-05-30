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

namespace WFP.ICT.Web.Controllers
{
    [Authorize]
    public class HomeController : BaseController
    {
        int pageSize = 15;
        private ApplicationUserManager _userManager;
        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            set
            {
                _userManager = value;
            }
        }

        public ActionResult Index()
        {
            return RedirectToAction("Index", "Campaigns");
        }

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
                IsTestsCreatives = x.IsTestsCreatives,
                IsUsesAPI = x.IsUsesAPI
            }).ToList();

            int pageNumber = (sc.page ?? 1);
            var Model = model.ToPagedList(pageNumber, pageSize);
            return View("Users", Model);
        }

        public ActionResult SaveUser(CompanyUsersVM model)
        {
            try
            {
                var user = UserManager.FindById(model.ID.ToString());
                switch (model.Action)
                {
                    case "lock":
                        if (user.Status == (int)UserStatusEnum.Active)
                        {
                            user.Status = (int)UserStatusEnum.Locked;
                            user.LockoutEndDateUtc = new DateTime(9999, 12, 30);
                            bool a = UserManager.IsLockedOut(user.Id);
                        }
                        else if (user.Status == (int)UserStatusEnum.Locked)
                        {
                            user.Status = (int)UserStatusEnum.Active;
                            user.LockoutEndDateUtc = null;
                            bool a = UserManager.IsLockedOut(user.Id);
                        }
                        break;
                    case "type":
                        if (user.UserType == (int)UserTypeEnum.Admin)
                        {
                            user.UserType = (int) UserTypeEnum.User;
                        }
                        else if (user.UserType == (int)UserTypeEnum.User)
                        {
                            user.UserType = (int)UserTypeEnum.Admin;
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
                                throw new Exception(passwordChangeResult.Errors.FirstOrDefault());
                            }
                        }
                        break;
                    //case "create":
                    //    var newUser = new WFPUser()
                    //    {
                    //        Id = Guid.NewGuid().ToString(),
                    //        CreatedAt = DateTime.Now,
                    //        UserName = model.Name.Trim(),
                    //        Email = model.Name.Trim() + "@wfp.org",
                    //        FirstName = model.FirstName,
                    //        LastName = model.LastName,
                    //        OfficeID = LoggedInUser.OfficeID,
                    //        IsLocalUser = true
                    //    };
                    //    var result = UserManager.CreateAsync(newUser, model.Password);
                    //    if (result.Result != IdentityResult.Success)
                    //    {
                    //        throw new Exception("There is an error while creating user." + result.Result.Errors.FirstOrDefault());
                    //    }
                    //    break;
                    case "delete":
                        UserManager.Delete(user);
                        break;
                }
                base.db.SaveChanges();
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message },
                    JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult Settings()
        {
            if (string.IsNullOrEmpty(LoggedInUser.APIKey))
            {
                var user = base.db.Users.FirstOrDefault(x => x.Id == LoggedInUser.Id);
                user.APIKey = KeyGenerator.GetUniqueKey(32);
                base.db.SaveChanges();
                SetupLoggedInUser(LoggedInUser.UserName);
            }
            UserProfileVM profile = new UserProfileVM()
            {
                IsUsesAPI = LoggedInUser.IsUsesAPI,
                APIKey = LoggedInUser.APIKey,
                Email = LoggedInUser.Email,
                //IsTestsCreatives = LoggedInUser.IsTestsCreatives,
                CompanyLogo = LoggedInUser.CompanyLogo
            };
            return View("Settings",  profile);
        }

        [HttpPost]
        public ActionResult Settings(UserProfileVM profile)
        {
            try
            {
                var user = base.db.Users.FirstOrDefault(x => x.Id == LoggedInUser.Id);
                user.Email = profile.Email;
                user.CompanyLogo = profile.CompanyLogo;
                base.db.SaveChanges();

                SetupLoggedInUser(LoggedInUser.UserName);
                
                TempData["Success"] = "Profile has been updated successfully!";
                return RedirectToAction("Settings");
            }
            catch (Exception ex)
            {
                
            }
            return View("Error");
        }

        public ActionResult Vendors(CampaignSearchVM sc)
        {
            var vendors = db.Vendors.Select(x =>
            new UserProfileVM()
            {
                Id = x.Id.ToString(),
                FirstName = x.Name,
                LastName = x.CompanyName,
                Email = x.Email,
                CCEmails = x.CCEmails,
                Phone = x.Phone,
                APIKey = x.APIKey,
                DateCreated = x.CreatedAt.ToString()
            }).ToList();

            int pageNumber = (sc.page ?? 1);
            var Model = vendors.ToPagedList(pageNumber, pageSize);
            return View("Vendors", Model);
        }

        public ActionResult CreateVendor()
        {
            return View("CreateVendor");
        }

        [HttpPost]
        public ActionResult CreateVendor(UserProfileVM profile)
        {
            try
            {
                var vendor = new Vendor()
                {
                    Id = Guid.NewGuid(),
                    CreatedAt = DateTime.Now,
                    CreatedBy = LoggedInUser.Id,
                    Name = profile.FirstName,
                    CompanyName = profile.LastName,
                    Email = profile.Email,
                    CCEmails = profile.CCEmails,
                    Phone = profile.Phone,
                    APIKey = profile.IsUsesAPI ? KeyGenerator.GetUniqueKey(32) : string.Empty
                };
                db.Vendors.Add(vendor);
                db.SaveChanges();

                _forceVendors = true;

                TempData["Success"] = "Vendor settings has been added successfully!";
                return RedirectToAction("Vendors");
            }
            catch (Exception ex)
            {
            }
            return View("Error");
        }

        public ActionResult EditVendor(Guid? id)
        {
            if (id == null)
            {
                throw new HttpException(400, "Bad Request");
            }
            var x = db.Vendors.Find(id);
            if (x == null)
            {
                throw new HttpException(404, "Not found");
            }
            var vendor= new UserProfileVM()
            {
                Id = x.Id.ToString(),
                FirstName = x.Name,
                LastName = x.CompanyName,
                Email = x.Email,
                CCEmails = x.CCEmails,
                Phone = x.Phone,
                APIKey = x.APIKey,
                DateCreated = x.CreatedAt.ToString()
            };

            return View("CreateVendor", vendor);
        }

        [HttpPost]
        public ActionResult EditVendor(UserProfileVM profile)
        {
            try
            {
                var vendor = db.Vendors.Find(Guid.Parse(profile.Id));
                vendor.Name = profile.FirstName;
                vendor.CompanyName = profile.LastName;
                vendor.Email = profile.Email;
                vendor.CCEmails = profile.CCEmails;
                vendor.Phone = profile.Phone;
                db.SaveChanges();
                TempData["Success"] = "Vendor settings has been updated successfully!";

                _forceVendors = true;
                return RedirectToAction("Vendors");
            }
            catch (Exception ex)
            {
            }
            return View("Error");
        }

        public ActionResult SaveVendor(CompanyUsersVM model)
        {
            try
            {
                var vendor = db.Vendors.Find(model.ID);
                switch (model.Action)
                {
                    case "delete":
                        db.Vendors.Remove(vendor);
                        break;
                }
                db.SaveChanges();

                _forceVendors = true;

                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message },
                    JsonRequestBehavior.AllowGet);
            }
        }
    }
}