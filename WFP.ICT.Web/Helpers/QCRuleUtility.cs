using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WFP.ICT.Enum;

namespace WFP.ICT.Web.Helpers
{
    public static class QcRuleUtility
    {
        public static string GetString(int qcRule)
        {
            switch (qcRule)
            {
                case (int)QcRule.NotStartedInFirst4Hours:
                    return "Campaign is not started in first four(4) hours of Order";
                case (int)QcRule.NotHitOpenRate5In24Hours:
                    return "Campaign has not hit OPEN rate of 5% in 24 hours of Order";
                case (int)QcRule.NotHitOpenRate10In72Hours:
                    return "Campaign has not hit OPEN rate of 10% in 72 hours of Order";
                case (int)QcRule.NotHitClickRate750In24Hours:
                    return "Campaign has not hit CLICK rate of .75% in 24 hours of Order";
                case (int)QcRule.NotHitClickRate1500In72Hours:
                    return "Campaign has not hit CLICK rate of 1.5% in 72 hours of Order";
            }
            return "";
        }
    }
}