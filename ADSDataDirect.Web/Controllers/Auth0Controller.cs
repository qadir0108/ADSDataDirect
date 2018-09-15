using System.Web.Mvc;
using ADSDataDirect.Infrastructure.Auth0;

namespace ADSDataDirect.Web.Controllers
{
    public class Auth0Controller : Controller
    {
        public ActionResult Enable()
        {
            new ____()._____(true);
            return RedirectToAction("LogOff", "Account");
        }

        public ActionResult Disable()
        {
            new ____()._____(false);
            return RedirectToAction("LogOff", "Account");
        }
    }
}