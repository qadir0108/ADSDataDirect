using ADSDataDirect.Core.Entities;

namespace ADSDataDirect.Core.EntityManager
{
    public class AspNetRoleClaimsManager : BaseEntityManager<AspNetRoleClaims>
    {
        public AspNetRoleClaimsManager()
        {

        }

        public AspNetRoleClaimsManager(WfpictContext context) : base(context)
        {

        }
    }
}
