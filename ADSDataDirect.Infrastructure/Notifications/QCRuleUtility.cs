using ADSDataDirect.Enums;

namespace ADSDataDirect.Infrastructure.Notifications
{
    public static class QcRuleUtility
    {
        public static string GetString(int qcRule)
        {
            switch (qcRule)
            {
                case (int)QcRule.NotStartedInFirstXHours:
                    return "Campaign has not started within X hours";
                case (int)QcRule.OpenTrafficInLast1Day:
                    return "Did you see open traffic in last 24 hrs";
                case (int)QcRule.ClickTrafficInLast1Day:
                    return "Did you see click traffic in last 24 hrs";
                case (int)QcRule.NotHitOpenRateIn1Day:
                    return "Campaign has not generated X% Opens in 1 day";
                case (int)QcRule.NotHitOpenRateIn2Days:
                    return "Campaign has not generated X% Opens in 2 days";
                case (int)QcRule.NotHitOpenRateIn3Days:
                    return "Campaign has not generated X% Opens in 3 days";
                case (int)QcRule.NotHitClickRateIn1Day:
                    return "Campaign has not generated X% Clicks in 1 day";
                case (int)QcRule.NotHitClickRateIn2Days:
                    return "Campaign has not generated X% Clicks in 2 days";
                case (int)QcRule.NotHitClickRateIn3Days:
                    return "Campaign has not generated X% Clicks in 3 days";
            }
            return "";
        }
    }
}