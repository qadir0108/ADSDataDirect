using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;

namespace ADSDataDirect.Web.Hubs
{
    [HubName("wFPICTHub")]
    public class WfpictHub : Hub
    {
        private readonly WfpictUpdater _wfpictUpdater;

        public WfpictHub() : this(WfpictUpdater.Instance)
        {
        }

        public WfpictHub(WfpictUpdater wfpictUpdater)
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