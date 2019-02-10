namespace ADSDataDirect.Enums
{
    public enum QcRule
    {
        NotStartedInFirstXHours = 1, //If Campaign has not started in First 4 hours send a notification
        OpenTrafficInLast1Day = 2, // Did you see open traffic in last 24 hrs
        ClickTrafficInLast1Day = 3, // Did you see click traffic in last 24 hrs
        NotHitOpenRateIn1Day = 4, // If campaign has not hit Open rate of 5% in 24 hours send  notifcation
        NotHitClickRateIn1Day = 5,// If campaign has not hit 1.0% click Rate in 48 hours send notification
        NotHitOpenRateIn2Days = 6, // If campaign has not hit Open rate of 8% in 48 hours send  notifcation
        NotHitClickRateIn2Days = 7,// If campaign has not hit .75% click Rate in 24 hours send notification
        NotHitOpenRateIn3Days = 8, // If campaing did not hit a 10% open rate send a notifcation (72hours) 
        NotHitClickRateIn3Days = 9, // If campaign has not hit 1.5% in 72 hours send a notifcation

        ExceededOpenRateIn24Hours = 10, // If campaign EXCEEDS Open rate of 5% in 24 hours send  notifcation
        ExceededOpenRateIn72Hours = 11, // If campaing EXCEEDS a 10% open rate send a notifcation (72hours) 
        ExceededClickRateIn24Hours = 12,// If campaign EXCEEDS .75% click Rate in 24 hours send notification
        ExceededClickRateIn72Hours = 13, // If campaign EXCEEDS 1.5% in 72 hours send a notifcation

        
    }
}
