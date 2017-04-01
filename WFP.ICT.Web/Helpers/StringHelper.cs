namespace WFP.ICT.Web.Helpers
{
    public class StringHelper
    {
        public static bool Contains(string Source, string ToCheck)
        {
            if (string.IsNullOrEmpty(Source)) return false;
            return Source.ToLowerInvariant().Contains(ToCheck.ToLowerInvariant());
        }
    }
}