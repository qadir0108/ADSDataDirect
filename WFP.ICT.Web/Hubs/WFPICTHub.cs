using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;

namespace WFP.ICT.Hubs
{
    [HubName("wFPICTHub")]
    public class WFPICTHub : Hub
    {
        private readonly WFPICTUpdater _wfpictUpdater;

        public WFPICTHub() : this(WFPICTUpdater.Instance)
        {
        }

        public WFPICTHub(WFPICTUpdater wfpictUpdater)
        {
            _wfpictUpdater = wfpictUpdater;
        }
        // Server methods
        //public IEnumerable<DevTestVM> GetAllDevTests()
        //{
        //    return _wfpictUpdater.GetAllDevTests();
        //}

        public void StartUpdatingClients()
        {
            _wfpictUpdater.StartUpdatingClients();
        }

        public void StopUpdatingClients()
        {
            _wfpictUpdater.StopUpdatingClients();
        }
    }
}