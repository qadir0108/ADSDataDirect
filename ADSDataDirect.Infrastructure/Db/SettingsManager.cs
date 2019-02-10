using System;
using System.Globalization;
using System.Linq;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;

namespace ADSDataDirect.Infrastructure.Db
{
    public class SettingsManager
    {

        private static SettingsManager _instance;
        public static SettingsManager Instance => _instance ?? (_instance = new SettingsManager());

        private SettingsVm _settings = new SettingsVm();

        public SettingsVm LoadSettings(WfpictContext db)
        {
            var settingAuto = db.Settings.FirstOrDefault(x => x.Key == StringConstants.KeyAutoProcessTracking);
            if (settingAuto != null) _settings.IsAutoProcessTracking = int.Parse(settingAuto.Value) == 1;

            var settingSendNotifications = db.Settings.FirstOrDefault(x => x.Key == StringConstants.KeySendNotificationEmails);
            if (settingSendNotifications != null) _settings.IsSendNotificationEmails = int.Parse(settingSendNotifications.Value) == 1;

            var key = db.Settings.FirstOrDefault(x => x.Key == StringConstants.KeyNotStartedInXHours);
            _settings.NotStartedInXHoursValue = key != null ? int.Parse(key.Value) : 0;

            key = db.Settings.FirstOrDefault(x => x.Key == StringConstants.KeyNotHitOpenRateIn24Hours);
            _settings.NotHitOpenRateIn24HoursValue = key != null ? double.Parse(key.Value) : 0.0;

            key = db.Settings.FirstOrDefault(x => x.Key == StringConstants.KeyNotHitOpenRateIn48Hours);
            _settings.NotHitOpenRateIn48HoursValue = key != null ? double.Parse(key.Value) : 0.0;

            key = db.Settings.FirstOrDefault(x => x.Key == StringConstants.KeyNotHitOpenRateIn72Hours);
            _settings.NotHitOpenRateIn72HoursValue = key != null ? double.Parse(key.Value) : 0.0;

            key = db.Settings.FirstOrDefault(x => x.Key == StringConstants.KeyNotHitClickRateIn24Hours);
            _settings.NotHitClickRateIn24HoursValue = key != null ? double.Parse(key.Value) : 0.0;

            key = db.Settings.FirstOrDefault(x => x.Key == StringConstants.KeyNotHitClickRateIn48Hours);
            _settings.NotHitClickRateIn48HoursValue = key != null ? double.Parse(key.Value) : 0.0;

            key = db.Settings.FirstOrDefault(x => x.Key == StringConstants.KeyNotHitClickRateIn72Hours);
            _settings.NotHitClickRateIn72HoursValue = key != null ? double.Parse(key.Value) : 0.0;

            key = db.Settings.FirstOrDefault(x => x.Key == StringConstants.KeyExceededOpenRateIn24Hours);
            _settings.ExceededOpenRateIn24HoursValue = key != null ? double.Parse(key.Value) : 0.0;

            key = db.Settings.FirstOrDefault(x => x.Key == StringConstants.KeyExceededOpenRateIn72Hours);
            _settings.ExceededOpenRateIn72HoursValue = key != null ? double.Parse(key.Value) : 0.0;

            key = db.Settings.FirstOrDefault(x => x.Key == StringConstants.KeyExceededClickRateIn24Hours);
            _settings.ExceededClickRateIn24HoursValue = key != null ? double.Parse(key.Value) : 0.0;

            key = db.Settings.FirstOrDefault(x => x.Key == StringConstants.KeyExceededClickRateIn72Hours);
            _settings.ExceededClickRateIn72HoursValue = key != null ? double.Parse(key.Value) : 0.0;

            return _settings;
        }

        public void SaveSettings(WfpictContext db, SettingsVm settings)
        {
            SaveSetting(db, StringConstants.KeyAutoProcessTracking, settings.IsAutoProcessTracking ? "1" : "0");
            SaveSetting(db, StringConstants.KeySendNotificationEmails, settings.IsSendNotificationEmails ? "1" : "0");

            SaveSetting(db, StringConstants.KeyNotStartedInXHours, settings.NotStartedInXHoursValue.ToString(CultureInfo.InvariantCulture));
            SaveSetting(db, StringConstants.KeyNotHitOpenRateIn24Hours, settings.NotHitOpenRateIn24HoursValue.ToString(CultureInfo.InvariantCulture));
            SaveSetting(db, StringConstants.KeyNotHitOpenRateIn48Hours, settings.NotHitOpenRateIn48HoursValue.ToString(CultureInfo.InvariantCulture));
            SaveSetting(db, StringConstants.KeyNotHitOpenRateIn72Hours, settings.NotHitOpenRateIn72HoursValue.ToString(CultureInfo.InvariantCulture));
            SaveSetting(db, StringConstants.KeyNotHitClickRateIn24Hours, settings.NotHitClickRateIn24HoursValue.ToString(CultureInfo.InvariantCulture));
            SaveSetting(db, StringConstants.KeyNotHitClickRateIn48Hours, settings.NotHitClickRateIn48HoursValue.ToString(CultureInfo.InvariantCulture));
            SaveSetting(db, StringConstants.KeyNotHitClickRateIn72Hours, settings.NotHitClickRateIn72HoursValue.ToString(CultureInfo.InvariantCulture));

            SaveSetting(db, StringConstants.KeyExceededOpenRateIn24Hours, settings.ExceededOpenRateIn24HoursValue.ToString(CultureInfo.InvariantCulture));
            SaveSetting(db, StringConstants.KeyExceededOpenRateIn72Hours, settings.ExceededOpenRateIn72HoursValue.ToString(CultureInfo.InvariantCulture));
            SaveSetting(db, StringConstants.KeyExceededClickRateIn24Hours, settings.ExceededClickRateIn24HoursValue.ToString(CultureInfo.InvariantCulture));
            SaveSetting(db, StringConstants.KeyExceededClickRateIn72Hours, settings.ExceededClickRateIn72HoursValue.ToString(CultureInfo.InvariantCulture));
        }

        protected void SaveSetting(WfpictContext db, string key, string value)
        {
            var setting = db.Settings.FirstOrDefault(x => x.Key == key);
            if (setting == null)
            {
                db.Settings.Add(new Settings
                {
                    Id = Guid.NewGuid(),
                    CreatedAt = DateTime.Now,
                    Key = key,
                    Value = value
                });
            }
            else
            {
                setting.Value = value;
            }
            db.SaveChanges();
        }
    }
}