using System;
using System.Data.Entity;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace ADSDataDirect.Core.Entities
{
    // ID, UserName, Email, PhoneNumber and Password used from IdentityUser
    public sealed class WfpUser : IdentityUser
    {
        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(Microsoft.AspNet.Identity.UserManager<WfpUser, string> manager)
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
                    if (user != null)
                    {
                        foreach (var role in user.Roles)
                        {
                            var roleClaims = ctx.RoleClaims.Include("Claim").Where(x => x.RoleId == role.RoleId);
                            foreach (var roleClaim in roleClaims)
                            {
                                userIdentity.AddClaim(new Claim(ClaimTypes.UserData, roleClaim.Claim.ClaimValue));
                            }
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

        public Guid? CustomerId { get; set; }
        public Customer Customer { get; set; }
        
        public DateTime CreatedAt { get; set; }
        public string CreatedById { get; set; }
        public WfpUser CreatedBy { get; set; }

        public WfpUser()
        {
        }
    }
}
