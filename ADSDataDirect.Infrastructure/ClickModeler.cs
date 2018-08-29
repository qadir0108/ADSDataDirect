using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADSDataDirect.Infrastructure
{
    public sealed class ClickModeler
    {
        private ClickModeler()
        {
        }

        private static readonly SortedDictionary<int, KeyValuePair<int, int>> HoursPercentageDictionaryDynamic
            = new SortedDictionary<int, KeyValuePair<int, int>>()
        {
            {1, new KeyValuePair<int, int>(100, 300) },
            {3, new KeyValuePair<int, int>(95, 150) },
            {5, new KeyValuePair<int, int>(75, 200) },
            {7, new KeyValuePair<int, int>(100, 200) },
            {9, new KeyValuePair<int, int>(100, 170) },
            {12, new KeyValuePair<int, int>(70, 150) },
            {18, new KeyValuePair<int, int>(50, 100) },
            {24, new KeyValuePair<int, int>(60, 120) },
            {30, new KeyValuePair<int, int>(50, 90) },
            {36, new KeyValuePair<int, int>(30, 70) },
            {42, new KeyValuePair<int, int>(20, 60) }
        };

        public static double GetPercentageDynamic(int hr)
        {
            var r = new Random();
            double finalPercentage = 0.0;
            if (hr >= 1)
                finalPercentage += r.Next(HoursPercentageDictionaryDynamic[1].Key, HoursPercentageDictionaryDynamic[1].Value) / 10000.0;
            if (hr >= 3)
                finalPercentage += r.Next(HoursPercentageDictionaryDynamic[3].Key, HoursPercentageDictionaryDynamic[3].Value) / 10000.0;
            if (hr >= 5)
                finalPercentage += r.Next(HoursPercentageDictionaryDynamic[5].Key, HoursPercentageDictionaryDynamic[5].Value) / 10000.0;
            if (hr >= 7)
                finalPercentage += r.Next(HoursPercentageDictionaryDynamic[7].Key, HoursPercentageDictionaryDynamic[7].Value) / 10000.0;
            if (hr >= 9)
                finalPercentage += r.Next(HoursPercentageDictionaryDynamic[9].Key, HoursPercentageDictionaryDynamic[9].Value) / 10000.0;
            if (hr >= 12)
                finalPercentage += r.Next(HoursPercentageDictionaryDynamic[12].Key, HoursPercentageDictionaryDynamic[12].Value) / 10000.0;
            if (hr >= 18)
                finalPercentage += r.Next(HoursPercentageDictionaryDynamic[18].Key, HoursPercentageDictionaryDynamic[18].Value) / 10000.0;
            if (hr >= 24)
                finalPercentage += r.Next(HoursPercentageDictionaryDynamic[24].Key, HoursPercentageDictionaryDynamic[24].Value) / 10000.0;
            if (hr >= 30)
                finalPercentage += r.Next(HoursPercentageDictionaryDynamic[30].Key, HoursPercentageDictionaryDynamic[30].Value) / 10000.0;
            if (hr >= 36)
                finalPercentage += r.Next(HoursPercentageDictionaryDynamic[36].Key, HoursPercentageDictionaryDynamic[36].Value) / 10000.0;
            if (hr >= 42)
                finalPercentage += r.Next(HoursPercentageDictionaryDynamic[42].Key, HoursPercentageDictionaryDynamic[42].Value) / 10000.0;
            return finalPercentage;
        }

        private static readonly SortedDictionary<int, double> HoursPercentageDictionary = new SortedDictionary<int, double>()
        {
            {1, 0.0179 }, {5, 0.0479}, {8, 0.0678}, {12, 0.0818}, {18, 0.0893}, {24, 0.1013}, {30, 0.1173}, {36, 0.1184}, {44, 0.1206}
        };

        // 4 = 1
        // 5 = 5
        // 6 = 5
        // >=44 = 44
        public static double GetPercentage(int hr)
        {
            if (hr >= 44) return HoursPercentageDictionary[44];

            int actualHr = -1;
            int[] hrs = HoursPercentageDictionary.Keys.ToArray();
            for (int i = 0; i < hrs.Length; i++)
            {
                if (hr >= hrs[i] && hr < hrs[i + 1])
                {
                    actualHr = hrs[i];
                    break;
                }
            }
            return HoursPercentageDictionary[actualHr];
        }

        public static int GetOpens(long quantity, DateTime startDateTime)
        {
            int hrsPassed = (int)Math.Round((DateTime.Now - startDateTime).TotalHours);
            return (int)Math.Round(quantity * GetPercentageDynamic(hrsPassed));
        }
    }
}
