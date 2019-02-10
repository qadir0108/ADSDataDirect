using System;
using System.Linq;
using System.Data.Entity;
using System.Globalization;
using System.Web.Mvc;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.Helpers;
using ADSDataDirect.Web.Models;
using PagedList;
using ADSDataDirect.Infrastructure.Db;

namespace ADSDataDirect.Web.Controllers
{
    [Authorize]
    public class NotificationController : BaseController
    {
        // Notification
        public ActionResult Index(NotificationSearchVm sc)
        {
            var notifications = Db.Notifications
                .Where(x => x.Status == (int)NotificationStatus.Found);

            if (!string.IsNullOrEmpty(sc.BasicOrderNumber))
            {
                notifications = notifications.Where(s => s.CampaignId.ToString() == sc.BasicOrderNumber);
            }

            if (!string.IsNullOrEmpty(sc.OrderedFrom))
            {
                DateTime dateFrom = DateTime.ParseExact(sc.OrderedFrom, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                notifications = notifications.Where(s => s.FoundAt >= dateFrom.Date);
                ViewBag.OrderedFrom = sc.OrderedFrom;
            }
            if (!string.IsNullOrEmpty(sc.OrderedTo))
            {
                DateTime dateTo = DateTime.ParseExact(sc.OrderedTo, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                notifications = notifications.Where(s => s.FoundAt <= dateTo.Date);
                ViewBag.OrderedTo = sc.OrderedTo;
            }

            var notificationVms = notifications.OrderByDescending(x => x.CreatedAt).ToList().Select(x =>
                new NotificationVm()
                {
                    Id = x.Id.ToString(),
                    CampaignId = x.CampaignId.ToString(),
                    OrderNumber = x.OrderNumber,
                    SegmentNumber = x.SegmentNumber,
                    CampaignName = Db.Campaigns.Include(y => y.Approved).FirstOrDefault(y => y.Id == x.CampaignId)
                        ?.Approved.CampaignName,
                    QcRule = x.QcRule,
                    QcRuleString = Enum.GetName(typeof(QcRule), x.QcRule),
                    Message = x.Message,
                    FoundAt = x.FoundAt?.ToString(StringConstants.TimeStampFormat),
                    Status = Enum.GetName(typeof(NotificationStatus), x.Status)
                });

            ViewBag.BasicOrderNumber = OrderNumberList;

            // Paging
            int pageNumber = (sc.Page ?? 1);
            return View(notificationVms.ToPagedList(pageNumber, PageSize));
        }

        public ActionResult Settings()
        {
            SettingsVm sc = SettingsManager.Instance.LoadSettings(Db);
            string view = IsNxs ? "SettingsNXS" : "Settings";
            return View(view, sc);
        }

        [HttpPost]
        public ActionResult Settings(SettingsVm sc)
        {
            SettingsManager.Instance.SaveSettings(Db, sc);
            TempData["Success"] = "Notification Settings has been saved sucessfully.";
            return RedirectToAction("Settings");
        }

    }
}