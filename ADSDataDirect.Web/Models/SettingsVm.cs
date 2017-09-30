using System;
using System.Data.Entity;
using System.Globalization;
using ADSDataDirect.Core.Entities;
using System.Linq;
using ADSDataDirect.Enums;

namespace ADSDataDirect.Web.Models
{
    public class SettingsVm
    {
        public bool IsAutoProcessTracking { get; set; }
        public bool IsSendNotificationEmails { get; set; }

        public int NotStartedInXHoursValue { get; set; }
        public double NotHitOpenRateIn24HoursValue { get; set; }
        public double NotHitOpenRateIn72HoursValue { get; set; }
        public double NotHitClickRateIn24HoursValue { get; set; }
        public double NotHitClickRateIn72HoursValue { get; set; }
    }
}