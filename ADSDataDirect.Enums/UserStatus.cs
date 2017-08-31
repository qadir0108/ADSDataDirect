using System.ComponentModel;

namespace ADSDataDirect.Enums
{
    public enum UserStatus
    {
        [Description("Active")]
        Active = 0,
        [Description("Locked")]
        Locked = 1,
        [Description("Expired")]
        Expired = 2
    }
}
