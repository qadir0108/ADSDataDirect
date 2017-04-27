using System.ComponentModel;

namespace WFP.ICT.Enum
{
    public enum UserTypeEnum
    {
        [Description("Admin")]
        Admin = 0,
        [Description("User")]
        User = 1,
        [Description("Vendor")]
        Vendor = 2
    }
}
