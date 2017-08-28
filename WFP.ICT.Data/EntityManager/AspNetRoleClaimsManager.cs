using WFP.ICT.Data.Entities;

namespace WFP.ICT.Data.EntityManager
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
