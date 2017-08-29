using System;
using System.Linq;
using System.Threading;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using WFP.ICT.Data.Entities;
using WFP.ICT.Enum;
using WFP.ICT.Web.Models;

namespace WFP.ICT.Web.Hubs
{
    public class WFPICTUpdater
    {
        // Singleton instance
        private readonly static Lazy<WFPICTUpdater> _instance = 
            new Lazy<WFPICTUpdater>(
                () => new WFPICTUpdater(
                    GlobalHost.ConnectionManager.GetHubContext<WFPICTHub>().Clients));
        

        private readonly object _lock = new object();
        private readonly TimeSpan _updateInterval = TimeSpan.FromSeconds(20);
        private Timer _timer;
        private volatile bool _isUpdating;

        private WFPICTUpdater(IHubConnectionContext<dynamic> clients)
        {
            Clients = clients;
        }

        public static WFPICTUpdater Instance
        {
            get
            {
                return _instance.Value;
            }
        }

        private IHubConnectionContext<dynamic> Clients
        {
            get;
            set;
        }

        public void StartUpdatingClients()
        {
            lock (_lock)
            {
                _timer = new Timer(UpdateClients, null, _updateInterval, _updateInterval);
            }
        }

        private void UpdateClients(object state)
        {
            lock (_lock)
            {
                if (!_isUpdating)
                {
                    _isUpdating = true;

                    using (var db = new WfpictContext())
                    {
                        var logs = db.SystemLogs.OrderByDescending(x => x.CreatedAt)
                            .Take(100)
                            .ToList()
                            .Select(x => new SystemLogVM()
                            {
                                CreatedAt = x.CreatedAt.ToString(StringConstants.DateTimeFormatDashes),
                                LogType = System.Enum.GetName(typeof(LogType), (LogType)x.LogType),
                                OrderNumber = x.OrderNumber,
                                Message = x.Message
                            })
                            .ToList();
                        Clients.All.refresh(logs);
                    }
                    _isUpdating = false;
                }
            }
        }

        public void StopUpdatingClients()
        {
            lock (_lock)
            {
                if (_timer != null)
                {
                    _timer.Dispose();
                }
            }
        }
    }
}