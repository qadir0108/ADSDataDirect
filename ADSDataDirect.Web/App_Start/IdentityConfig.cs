﻿using System;
using System.Security.Claims;
using System.Threading.Tasks;
using ADSDataDirect.Core.Entities;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security;

namespace ADSDataDirect.Web
{
    public class EmailService : IIdentityMessageService
    {
        public Task SendAsync(IdentityMessage message)
        {
            // Plug in your email service here to send an email.
            return Task.FromResult(0);
        }
    }

    public class SmsService : IIdentityMessageService
    {
        public Task SendAsync(IdentityMessage message)
        {
            // Plug in your SMS service here to send a text message.
            return Task.FromResult(0);
        }
    }

    // Configure the application user manager used in this application. UserManager is defined in ASP.NET Identity and is used by the application.
    public class ApplicationUserManager : UserManager<WfpUser>
    {
        public ApplicationUserManager(IUserStore<WfpUser> store) : base(store)
        {
        }

        public static ApplicationUserManager Create(IdentityFactoryOptions<ApplicationUserManager> options, IOwinContext context) 
        {
            var manager = new ApplicationUserManager(new UserStore<WfpUser>(context.Get<WfpictContext>()));
            // Configure validation logic for usernames
            manager.UserValidator = new UserValidator<WfpUser>(manager)
            {
                AllowOnlyAlphanumericUserNames = false,
                RequireUniqueEmail = true
            };

            // Configure validation logic for passwords
            manager.PasswordValidator = new PasswordValidator
            {
                //RequiredLength = 6,
                //RequireNonLetterOrDigit = true,
                //RequireDigit = true,
                //RequireLowercase = true,
                //RequireUppercase = true,
            };

            // Configure user lockout defaults
            manager.UserLockoutEnabledByDefault = true;
            manager.DefaultAccountLockoutTimeSpan = TimeSpan.FromMinutes(5);
            manager.MaxFailedAccessAttemptsBeforeLockout = 5;

            // Register two factor authentication providers. This application uses Phone and Emails as a step of receiving a code for verifying the user
            // You can write your own provider and plug it in here.
            manager.RegisterTwoFactorProvider("Phone Code", new PhoneNumberTokenProvider<WfpUser>
            {
                MessageFormat = "Your security code is {0}"
            });
            manager.RegisterTwoFactorProvider("Email Code", new EmailTokenProvider<WfpUser>
            {
                Subject = "Security Code",
                BodyFormat = "Your security code is {0}"
            });
            manager.EmailService = new EmailService();
            manager.SmsService = new SmsService();
            var dataProtectionProvider = options.DataProtectionProvider;
            if (dataProtectionProvider != null)
            {
                manager.UserTokenProvider = 
                    new DataProtectorTokenProvider<WfpUser>(dataProtectionProvider.Create("ASP.NET Identity"));
            }
            return manager;
        }
    }

    public class ApplicationRoleManager : RoleManager<WfpRole>
    {
        public ApplicationRoleManager(IRoleStore<WfpRole, string> roleStore): base(roleStore)
        {
        }

        public static ApplicationRoleManager Create(IdentityFactoryOptions<ApplicationRoleManager> options, IOwinContext context)
        {
            return new ApplicationRoleManager(new RoleStore<WfpRole>(context.Get<WfpictContext>()));
        }

        public void AddClaim(WfpictContext ctx, string roleId, Guid claimId)
        {
            ctx.RoleClaims.Add(new AspNetRoleClaims()
            {
                Id = Guid.NewGuid(),
                RoleId = roleId,
                ClaimId = claimId,
                CreatedAt = DateTime.Now
            });
            ctx.SaveChanges();
        }
    }

    // Configure the application sign-in manager which is used in this application.
    public class ApplicationSignInManager : SignInManager<WfpUser, string>
    {
        public ApplicationSignInManager(ApplicationUserManager userManager, IAuthenticationManager authenticationManager)
            : base(userManager, authenticationManager)
        {
        }

        public override Task<ClaimsIdentity> CreateUserIdentityAsync(WfpUser user)
        {
            return user.GenerateUserIdentityAsync((ApplicationUserManager)UserManager);
        }

        public static ApplicationSignInManager Create(IdentityFactoryOptions<ApplicationSignInManager> options, IOwinContext context)
        {
            return new ApplicationSignInManager(context.GetUserManager<ApplicationUserManager>(), context.Authentication);
        }

        public override Task SignInAsync(WfpUser user, bool isPersistent, bool rememberBrowser)
        {
            return base.SignInAsync(user, isPersistent, rememberBrowser);
        }

        public override Task<SignInStatus> TwoFactorSignInAsync(string provider, string code, bool isPersistent, bool rememberBrowser)
        {
            return base.TwoFactorSignInAsync(provider, code, isPersistent, rememberBrowser);
        }

        //public override Task<SignInStatus> PasswordSignInAsync(string userName, string password, bool isPersistent, bool shouldLockout)
        //{
        //    var resultFromLocal = base.PasswordSignInAsync(userName, password, isPersistent, shouldLockout);
        //    if (resultFromLocal.Result == SignInStatus.Success)
        //    {
        //        var user = UserManager.FindByName(userName);
        //        if (user.Status == (int)UserStatus.Locked)
        //            return Task.FromResult(SignInStatus.LockedOut);

        //        return Task.FromResult(SignInStatus.Success);
        //    } else if (resultFromLocal.Result == SignInStatus.LockedOut)
        //    {
        //        return Task.FromResult(SignInStatus.LockedOut);
        //    }
        //    else
        //    {
        //        var company = HttpContext.Current.Session["company"] as WFP.ICT.Data.Entities.Company;
        //        bool IsAuthenticated = DirectoryManager.Authenticate(company.ActiveDiretoryDomain, userName, password);
        //        if (IsAuthenticated) {

        //            // Create user
        //            var user = UserManager.FindByName(userName);
        //            if (user == null)
        //            {
        //                var newUser = new WFPUser
        //                {
        //                    UserName = userName,
        //                    Email = userName + "@wfp.org",
        //                    CreatedAt = DateTime.Now
        //                };

        //                // Temp password, so that for each time local should fail
        //                var createUserResult = UserManager.CreateAsync(newUser, SecurityConstants.UserAllUserPassword);
        //                if (createUserResult.Result == IdentityResult.Success)
        //                {
        //                }
        //                else
        //                {
        //                    throw new AdsException("There is an error while creating user." + createUserResult.Result.Errors.FirstOrDefault());
        //                }
        //            }

        //            return Task.FromResult(SignInStatus.RequiresVerification);
        //        } else
        //        {
        //            return Task.FromResult(SignInStatus.Failure);
        //        }
        //    }
        //}
    }
}
