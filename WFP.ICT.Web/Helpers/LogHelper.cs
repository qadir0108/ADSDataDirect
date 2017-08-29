using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;

namespace WFP.ICT.Web.Helpers
{
    public class LogHelper
    {
        public static void AddLog(WfpictContext db, LogType logType, string OrderNumber, string Message)
        {
            Add(db, logType, LogStatus.Success, OrderNumber, Message);
        }

        public static void AddError(WfpictContext db, LogType logType, string OrderNumber, string Message)
        {
            Add(db, logType, LogStatus.Error, OrderNumber, Message);
        }

        private static void Add(WfpictContext db, LogType logType, LogStatus logStatus, string OrderNumber, string Message)
        {
            db.SystemLogs.Add(new SystemLog()
            {
                Id = Guid.NewGuid(),
                CreatedAt = DateTime.Now,
                LogType = (int)logType,
                LogStatus = (int)logStatus,
                OrderNumber = OrderNumber,
                Message = Message
            });
            db.SaveChanges();
        }
    }
}