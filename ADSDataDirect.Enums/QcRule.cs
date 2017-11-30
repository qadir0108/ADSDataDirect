namespace ADSDataDirect.Enums
{
    public enum QcRule
    {
        NotStartedInFirstXHours = 1, //If Campaign has not started in First 4 hours send a notification
        NotHitOpenRateIn24Hours = 2, // If campaign has not hit Open rate of 5% in 24 hours send  notifcation
        NotHitOpenRateIn72Hours = 3, // If campaing did not hit a 10% open rate send a notifcation (72hours) 
        NotHitClickRateIn24Hours = 4,// If campaign has not hit .75% click Rate in 24 hours send notification
        NotHitClickRateIn72Hours = 5, // If campaign has not hit 1.5% in 72 hours send a notifcation
        ExceededOpenRateIn24Hours = 6, // If campaign EXCEEDS Open rate of 5% in 24 hours send  notifcation
        ExceededOpenRateIn72Hours = 7, // If campaing EXCEEDS a 10% open rate send a notifcation (72hours) 
        ExceededClickRateIn24Hours = 8,// If campaign EXCEEDS .75% click Rate in 24 hours send notification
        ExceededClickRateIn72Hours = 9, // If campaign EXCEEDS 1.5% in 72 hours send a notifcation

        OpenTrafficInLast24Hours = 10, // Did you see open traffic in last 24 hrs
        ClickTrafficInLast24Hours = 11, // Did you see click traffic in last 24 hrs
    }
}
