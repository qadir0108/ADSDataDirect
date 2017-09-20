namespace ADSDataDirect.Enums
{
    public static class StringConstants
    {
        public const string TimeStampFormat = "M/d/yyyy H:mm";
        public const string DateFormatRegistry = "MMM dd, yyyy";
        public const string DateFormatSlashes = "MM/dd/yyyy";
        public const string DateTimeFormatDashes = "yyyy-MM-dd HH:mm:ss"; // "2017-07-10 14:30:00"
        public const string DateTimeDisplayFormatReview = "F";
        public const string TimeFormat = "h:mm tt";

        public static readonly string KeyOrderCcEmails = "OrderCCEmails";

        public static readonly string KeyNotStartedInXHours = "NotStartedInXHours";
        public static readonly string KeyNotHitOpenRateIn24Hours = "NotHitOpenRateIn24Hours";
        public static readonly string KeyNotHitOpenRateIn72Hours = "NotHitOpenRateIn72Hours";
        public static readonly string KeyNotHitClickRateIn24Hours = "NotHitClickRateIn24Hours";
        public static readonly string KeyNotHitClickRateIn72Hours = "NotHitClickRateIn72Hours";

        public static readonly string KeyAutoProcessTracking = "AutoProcessTracking";
        public static readonly string KeySendNotificationEmails = "SendNotificationEmails";
    }
}