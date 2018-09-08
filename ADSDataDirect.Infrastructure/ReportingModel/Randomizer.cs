using System;

namespace ADSDataDirect.Infrastructure.ReportingModel
{
    public class Randomizer
    {
        public static void Test()
        {
            int count = 10;
            int[] numbers = GetNumbers(count, 100);
            for (int index = 0; index < count; index++)
            {
                Console.Write(numbers[index]);
                if ((index + 1) % 10 == 0)
                    Console.WriteLine("");
                else if (index != count - 1)
                    Console.Write(",");
            }
            Console.ReadKey();
        }

        public static int[] GetNumbers(int count, int total)
        {
            const int LOWERBOUND = 1;
            const int UPPERBOUND = 40;

            int[] result = new int[count];
            int currentsum = 0;
            int low, high, calc;

            if ((UPPERBOUND * count) < total ||
                (LOWERBOUND * count) > total ||
                UPPERBOUND < LOWERBOUND)
                throw new Exception("Not possible.");

            Random rnd = new Random();

            for (int index = 0; index < count; index++)
            {
                calc = (total - currentsum) - (UPPERBOUND * (count - 1 - index));
                low = calc < LOWERBOUND ? LOWERBOUND : calc;
                calc = (total - currentsum) - (LOWERBOUND * (count - 1 - index));
                high = calc > UPPERBOUND ? UPPERBOUND : calc;

                result[index] = rnd.Next(low, high + 1);

                currentsum += result[index];
            }

            // The tail numbers will tend to drift higher or lower so we should shuffle to compensate somewhat.

            int shuffleCount = rnd.Next(count * 5, count * 10);
            while (shuffleCount-- > 0)
                swap(ref result[rnd.Next(0, count)], ref result[rnd.Next(0, count)]);

            return result;
        }

        private static void swap(ref int item1, ref int item2)
        {
            int temp = item1;
            item1 = item2;
            item2 = temp;
        }
    }
}
