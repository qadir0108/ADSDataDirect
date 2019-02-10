namespace ADSDataDirect.Infrastructure.Db
{
    public class SettingsVm
    {
        public bool IsAutoProcessTracking { get; set; }
        public bool IsSendNotificationEmails { get; set; }

        public int NotStartedInXHoursValue { get; set; }
        public double NotHitOpenRateIn24HoursValue { get; set; }
        public double NotHitOpenRateIn48HoursValue { get; set; }
        public double NotHitOpenRateIn72HoursValue { get; set; }
        public double NotHitClickRateIn24HoursValue { get; set; }
        public double NotHitClickRateIn48HoursValue { get; set; }
        public double NotHitClickRateIn72HoursValue { get; set; }

        public double ExceededOpenRateIn24HoursValue { get; set; }
        public double ExceededOpenRateIn72HoursValue { get; set; }
        public double ExceededClickRateIn24HoursValue { get; set; }
        public double ExceededClickRateIn72HoursValue { get; set; }
    }
}