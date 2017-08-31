using System;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;

namespace ADSDataDirect.Core
{
    public static class LogHelper
    {
        public static void AddLog(WfpictContext db, LogType logType, string orderNumber, string message)
        {
            Add(db, logType, LogStatus.Success, orderNumber, message);
        }

        public static void AddError(WfpictContext db, LogType logType, string orderNumber, string message)
        {
            Add(db, logType, LogStatus.Error, orderNumber, message);
        }

        private static void Add(WfpictContext db, LogType logType, LogStatus logStatus, string orderNumber, string message)
        {
            db.SystemLogs.Add(new SystemLog()
            {
                Id = Guid.NewGuid(),
                CreatedAt = DateTime.Now,
                LogType = (int)logType,
                LogStatus = (int)logStatus,
                OrderNumber = orderNumber,
                Message = message
            });
            db.SaveChanges();
        }
    }
}