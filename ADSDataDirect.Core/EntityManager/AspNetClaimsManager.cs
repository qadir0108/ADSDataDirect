using ADSDataDirect.Core.Entities;

namespace ADSDataDirect.Core.EntityManager
{
    public class AspNetClaimsManager : BaseEntityManager<AspNetClaims>
    {
        public AspNetClaimsManager()
        {

        }

        public AspNetClaimsManager(WfpictContext context) : base(context)
        {

        }
    }
}
