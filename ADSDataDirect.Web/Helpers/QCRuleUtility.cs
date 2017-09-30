using ADSDataDirect.Enums;

namespace ADSDataDirect.Web.Helpers
{
    public static class QcRuleUtility
    {
        public static string GetString(int qcRule)
        {
            switch (qcRule)
            {
                case (int)QcRule.NotStartedInFirstXHours:
                    return "Campaign is not started in first four(4) hours of Order";
                case (int)QcRule.NotHitOpenRateIn24Hours:
                    return "Campaign has not hit OPEN rate of 5% in 24 hours of Order";
                case (int)QcRule.NotHitOpenRateIn72Hours:
                    return "Campaign has not hit OPEN rate of 10% in 72 hours of Order";
                case (int)QcRule.NotHitClickRateIn24Hours:
                    return "Campaign has not hit CLICK rate of .75% in 24 hours of Order";
                case (int)QcRule.NotHitClickRateIn72Hours:
                    return "Campaign has not hit CLICK rate of 1.5% in 72 hours of Order";
            }
            return "";
        }
    }
}