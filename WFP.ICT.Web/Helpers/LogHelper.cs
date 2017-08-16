using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ADSDataDirect.Enums;
using WFP.ICT.Data.Entities;

namespace WFP.ICT.Web.Helpers
{
    public class LogHelper
    {
        public static void AddLog(WFPICTContext db, LogTypeEnum logType, string OrderNumber, string Message)
        {
            Add(db, logType, LogStatusEnum.Success, OrderNumber, Message);
        }

        public static void AddError(WFPICTContext db, LogTypeEnum logType, string OrderNumber, string Message)
        {
            Add(db, logType, LogStatusEnum.Error, OrderNumber, Message);
        }

        private static void Add(WFPICTContext db, LogTypeEnum logType, LogStatusEnum logStatus, string OrderNumber, string Message)
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