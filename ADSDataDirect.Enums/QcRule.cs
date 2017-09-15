namespace ADSDataDirect.Enums
{
    public enum QcRule
    {
        NotStartedInFirst4Hours, //If Campaign has not started in First 4 hours send a notification
        NotHitOpenRate5In24Hours, // If campaign has not hit Open rate of 5% in 24 hours send  notifcation
        NotHitOpenRate10In72Hours, // If campaing did not hit a 10% open rate send a notifcation (72hours) 
        NotHitClickRate750In24Hours,// If campaign has not hit .75% click Rate in 24 hours send notification
        NotHitClickRate1500In72Hours, // If campaign has not hit 1.5% in 72 hours send a notifcation
        MoreThan40PercentIsMobileClicks // If more than 40% of traffic is mobile clicks send an alert
    }
}
