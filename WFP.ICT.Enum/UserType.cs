using System.ComponentModel;

namespace WFP.ICT.Enum
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
