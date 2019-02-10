using ADSDataDirect.Core;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADSDataDirect.Infrastructure.Notifications
{
    public class NotificationRecorder
    {
        public static void SaveNotificationRecord(WfpictContext db,
            Guid? campaignId, string orderNumber, string segmentNumber,
            QcRule qcRule, string message)
        {

            var alreadyNoted = db.Notifications
                .FirstOrDefault(x => x.CampaignId == campaignId && x.OrderNumber == orderNumber && x.SegmentNumber == segmentNumber
                                     && x.QcRule == (int)qcRule && x.Status == (int)NotificationStatus.Found);

            if (alreadyNoted != null) return;

            LogHelper.AddLog(db, LogType.RulesProcessing, orderNumber, $"Problem found. QCRule {qcRule} , Message {message}");
            db.Notifications.Add(new Notification()
            {
                Id = Guid.NewGuid(),
                CreatedAt = DateTime.Now,
                CampaignId = campaignId,
                OrderNumber = orderNumber,
                SegmentNumber = segmentNumber,
                Status = (int)NotificationStatus.Found,
                Message = message,
                CheckTime = DateTime.Now,
                FoundAt = DateTime.Now,
                QcRule = (int)qcRule
            });
            db.SaveChanges();
        }
    }
}
