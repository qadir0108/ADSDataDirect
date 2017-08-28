using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Data.Entity;

namespace WFP.ICT.Data.Entities
{
    // ID, UserName, Email, PhoneNumber and Password used from IdentityUser
    public class WfpUser : IdentityUser
    {
        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(Microsoft.AspNet.Identity.UserManager<WFP.ICT.Data.Entities.WfpUser, string> manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = await manager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            try
            {
                using (WfpictContext ctx = new WfpictContext())
                {
                    var userId = userIdentity.GetUserId();
                    var user = ctx.Users.Include(x => x.Roles).FirstOrDefault(x => x.Id == userId);

                    foreach (var role in user.Roles)
                    {
                        var roleClaims = ctx.RoleClaims.Include("Claim").Where(x => x.RoleID == role.RoleId);
                        foreach (var roleClaim in roleClaims)
                        {
                            userIdentity.AddClaim(new Claim(ClaimTypes.UserData, roleClaim.Claim.ClaimValue));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // ignored
            }
            return userIdentity;
        }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        
        public DateTime? LastLogin { get; set; }

        public int Status { get; set; } // UserStatus
        public int UserType { get; set; } // UserType

        public bool IsUsesApi { get; set; }
        public string ApiKey { get; set; }
        public bool IsTestsCreatives { get; set; }

        public string CompanyName { get; set; }
        public string CompanyLogo { get; set; }
        public string WhiteLabel { get; set; }
        public string ReportTemplate { get; set; }

        public DateTime CreatedAt { get; set; }
        public string CreatedById { get; set; }
        public virtual WfpUser CreatedBy { get; set; }

        public WfpUser()
        {
        }
    }
}
