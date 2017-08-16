using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ADSDataDirect.Enums
{
    public enum CampaignStatusEnum
    {
        OrderRecevied = 0,
        Rebroadcasted = 1,
        Testing = 2,
        Approved = 3,
        Monitoring = 4,
        //Tracking, update set 4 where 5, set 5 where 6 , set 6 where 7
        Completed = 5,
        Cancelled = 6,
        NotRebroadcasted = 7,
    }
}
