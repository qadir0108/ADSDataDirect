namespace ADSDataDirect.Enums
{
    public enum QcRule
    {
        NotStartedInFirstXHours, //If Campaign has not started in First 4 hours send a notification
        NotHitOpenRateIn24Hours, // If campaign has not hit Open rate of 5% in 24 hours send  notifcation
        NotHitOpenRateIn72Hours, // If campaing did not hit a 10% open rate send a notifcation (72hours) 
        NotHitClickRateIn24Hours,// If campaign has not hit .75% click Rate in 24 hours send notification
        NotHitClickRateIn72Hours, // If campaign has not hit 1.5% in 72 hours send a notifcation
        MoreThan40PercentIsMobileClicks // If more than 40% of traffic is mobile clicks send an alert
    }
}
