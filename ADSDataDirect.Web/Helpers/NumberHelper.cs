namespace ADSDataDirect.Web.Helpers
{
    public class NumberHelper
    {
        private static int GetTotalFromRange(int firstNumber, int secondNumber)
        {
            if (firstNumber == 0 || secondNumber == 0)
                return 0;

            return secondNumber - firstNumber + 1;
        }

        public static int GetTotal(int firstStart, int firstEnd, int secondStart, int secondEnd, int thirdStart, int thirdEnd)
        {
            return GetTotalFromRange(firstStart, firstEnd) + GetTotalFromRange(secondStart, secondEnd) +
                   GetTotalFromRange(thirdStart, thirdEnd);
        }
    }
}