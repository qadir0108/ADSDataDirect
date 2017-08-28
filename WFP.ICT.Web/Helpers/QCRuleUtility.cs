using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ADSDataDirect.Enums;

namespace WFP.ICT.Web.Helpers
{
    public class QCRuleUtility
    {
        public static string GetString(int QCRule)
        {
            switch (QCRule)
            {
                case (int)ADSDataDirect.Enums.QCRule.NotStartedInFirst4Hours:
                    return "Campaign is not started in first four(4) hours of Order";
                case (int)ADSDataDirect.Enums.QCRule.NotHitOpenRate5In24Hours:
                    return "Campaign has not hit OPEN rate of 5% in 24 hours of Order";
                case (int)ADSDataDirect.Enums.QCRule.NotHitOpenRate10In72Hours:
                    return "Campaign has not hit OPEN rate of 10% in 72 hours of Order";
                case (int)ADSDataDirect.Enums.QCRule.NotHitClickRate750In24Hours:
                    return "Campaign has not hit CLICK rate of .75% in 24 hours of Order";
                case (int)ADSDataDirect.Enums.QCRule.NotHitClickRate1500In72Hours:
                    return "Campaign has not hit CLICK rate of 1.5% in 72 hours of Order";
            }
            return "";
        }
    }
}