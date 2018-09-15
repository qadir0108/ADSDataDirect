using System.Web;
using System.Web.Mvc;

namespace ADSDataDirect.Web.Controllers
{
    public class ErrorController : Controller
    {
        //
        // GET: /Error/
        public ActionResult Index()
        {
            return RedirectToAction("GenericError", new HandleErrorInfo(new HttpException(403, "Dont allow access the pages"), "ErrorController", "Index"));
        }

        public ViewResult GenericError(HandleErrorInfo exception)
        {
            return View("Error", exception);
        }

        public ViewResult NotFound()
        {
            ViewBag.Title = "404. Not Found";
            return View("Error", new HandleErrorInfo(new HttpException(404, "404. Not Found"), "ErrorController", "Index"));
        }

        public ViewResult NotFound404(HandleErrorInfo exception)
        {
            ViewBag.Title = "404. Not Found";
            return View("Error", new HandleErrorInfo(new HttpException(404, "404. Not Found"), "ErrorController", "Index"));
        }


        public ViewResult BadRequest(HandleErrorInfo exception)
        {
            ViewBag.Title = "400. Bad Request";
            return View("Error", new HandleErrorInfo(new HttpException(400, "400. Bad Request"), "ErrorController", "Index"));
        }

        public ViewResult NotAuthorized()
        {
            ViewBag.Title = "You are not authorized";
            return View("Error");
        }
    }
}