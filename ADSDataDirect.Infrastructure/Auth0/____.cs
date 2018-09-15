using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using ADSDataDirect.Infrastructure.Db;
using Newtonsoft.Json;

namespace ADSDataDirect.Infrastructure.Auth0
{
    public class ____ : SettingsManager
    {
        private const string _k = "Auth0";

        public static bool ___
        {
            get
            {
                bool _ = false;
                using (var db = new WfpictContext())
                {
                    var __ = db.Settings.FirstOrDefault(x => x.Key == _k);
                    _ =  (__ == null) || int.Parse(__.Value) == 1; 
                }
                return _;
            }
        }

        public void _____(bool _)
        {
            using (var db = new WfpictContext())
            {
                SaveSetting(db, _k, _ ? "1" : "0");
            }
        }
    }
}