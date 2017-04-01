using System.Web.Optimization;

namespace WFP.ICT.Web
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            //bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
            //            "~/Scripts/jquery-{version}.js"));

            //bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
            //            "~/Scripts/jquery.validate*"));

            //// Use the development version of Modernizr to develop with and learn from. Then, when you're
            //// ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            //bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
            //            "~/Scripts/modernizr-*"));

            //bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
            //          "~/Scripts/bootstrap.js",
            //          "~/Scripts/respond.js"));

            //bundles.Add(new StyleBundle("~/Content/css").Include(
            //          "~/Content/bootstrap.css"
            //          ));

            bundles.Add(new StyleBundle("~/Theme/CSS").Include(
                "~/css/fonts1.css",
                "~/css/fonts2.css",
                "~/css/font-awesome.min.css",
                "~/css/bootstrap.min.css",
                "~/css/style.css",
                "~/css/owl.carousel.css",
                "~/css/owl.theme.css",
                "~/css/owl.transitions.css",
                "~/css/fontello.css",
                "~/css/jquery-ui.css",
                "~/css/toastr.min.css",
                "~/css/wfp.css",
                "~/css/loader.css",
                "~/css/spinner.css",
                "~/Content/css/select2.min.css",
                "~/css/highcharts.css",
                "~/css/sweetalert.css",
                "~/css/bootstrap-datetimepicker.min.css"
                ));

            bundles.Add(new ScriptBundle("~/Theme/JS").Include(
                //"~/js/jquery-1.11.1.js",
                "~/js/jquery-1.11.3.min.js",
                "~/js/validator.min.js",
                "~/js/bootstrap.min.js",
                "~/js/jquery.flexnav.js",
                "~/js/navigation.js",
                "~/js/owl.carousel.min.js",
                "~/js/slider.js",
                "~/js/jquery.sticky.js",
                 //"~/js/header-sticky.js",
                 "~/js/toastr.min.js",
                 "~/js/jquery.blockUI.js",
                 "~/js/accounting.min.js", 
                 "~/js/wfp.js",
                 "~/js/nav.js",
                 "~/js/jquery.unobtrusive-ajax.min.js",
                 "~/Scripts/select2.min.js",
                 "~/Scripts/sweetalert.min.js",
                 "~/Scripts/moment.min.js",
                 "~/js/jquery.hotkeys.js",
                 "~/js/spinner.js",
                 "~/js/bootstrap-datetimepicker.min.js"
            ));

            bundles.Add(new ScriptBundle("~/Theme/jQueryUI").Include(
                "~/js/jquery-ui.js",
                "~/js/price-slider.js"
            ));

            BundleTable.EnableOptimizations = false;
        }
    }
}
