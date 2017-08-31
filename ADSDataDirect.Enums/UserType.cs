using System.ComponentModel;

namespace ADSDataDirect.Enums
{
    public enum UserType
    {
        [Description("Admin")]
        Admin = 0,
        [Description("User")]
        User = 1,
        [Description("Vendor")]
        Vendor = 2
    }
}
