namespace ADSDataDirect.Enums
{
    public static class StringConstants
    {
        public const string TimeStampFormat = "M/d/yyyy H:mm";
        public const string DateFormatRegistry = "MMM dd, yyyy";
        public const string DateFormatSlashes = "MM/dd/yyyy";
        public const string DateFormatDashes = "MM-dd-yyyy";
        public const string DateTimeFormatSlashes = "MM/dd/yyyy HH:mm:ss";
        public const string DateTimeFormatDashes = "yyyy-MM-dd HH:mm:ss"; // "2017-07-10 14:30:00"
        public const string DateTimeDisplayFormatReview = "F";
        public const string TimeFormat = "h:mm tt";
        public const string TimeFormatAMPM = "tt";

        public static readonly string KeyNotStartedInXHours = "NotStartedInXHours";
        public static readonly string KeyNotHitOpenRateIn24Hours = "NotHitOpenRateIn24Hours";
        public static readonly string KeyNotHitOpenRateIn48Hours = "NotHitOpenRateIn48Hours";
        public static readonly string KeyNotHitOpenRateIn72Hours = "NotHitOpenRateIn72Hours";
        public static readonly string KeyNotHitClickRateIn24Hours = "NotHitClickRateIn24Hours";
        public static readonly string KeyNotHitClickRateIn48Hours = "NotHitClickRateIn48Hours";
        public static readonly string KeyNotHitClickRateIn72Hours = "NotHitClickRateIn72Hours";

        public static readonly string KeyExceededOpenRateIn24Hours = "ExceededOpenRateIn24Hours";
        public static readonly string KeyExceededOpenRateIn72Hours = "ExceededOpenRateIn72Hours";
        public static readonly string KeyExceededClickRateIn24Hours = "ExceededClickRateIn24Hours";
        public static readonly string KeyExceededClickRateIn72Hours = "ExceededClickRateIn72Hours";

        public static readonly string KeyAutoProcessTracking = "AutoProcessTracking";
        public static readonly string KeySendNotificationEmails = "SendNotificationEmails";

        public static readonly string CustomerStrategus = "Strategus";
        public static readonly string CustomerAdvantage = "Advantage";
    }
}