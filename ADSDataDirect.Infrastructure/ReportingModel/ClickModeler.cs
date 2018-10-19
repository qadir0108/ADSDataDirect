using ADSDataDirect.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADSDataDirect.Infrastructure.ReportingModel
{
    public static class ClickModeler
    {
        private static double[] spreadOf3 = new double[] { 0.583333333, 0.291666667, 0.125 };
        private static double[] spreadOf5 = new double[] { 0.310344828, 0.275862069, 0.206896552, 0.137931034, 0.068965517 };
        static readonly Random Random = new Random();

        // Spread of 3 or 5
        private static double GetSectionSpread(int spreadOf, int whichOf)
        {
            if (whichOf > 5) whichOf = 5;
            whichOf = whichOf - 1; // Arrays!
            return spreadOf == 3 ? spreadOf3[whichOf] : spreadOf5[whichOf];
        }

        public static List<ClickModel> GenerateClicks(List<string> links, long clickCountTotal, List<OpenModelKeyword> keywords)
        {
            int numberOfLinks = links.Count;
            int numberInEachGroup = numberOfLinks < 3 ? 1 : (numberOfLinks / 3);
            int numberOfUpperGroups = numberOfLinks / numberInEachGroup;
            int numberOfBottomGroups = (numberInEachGroup * numberOfUpperGroups > numberOfLinks) ?
                (numberOfLinks - numberInEachGroup * (numberOfUpperGroups - 1)) :
                (numberOfLinks - numberInEachGroup * numberOfUpperGroups);

            List<ClickModel> clicks = new List<ClickModel>();
            int previousWhichOf3 = 0;
            int previousWhichOf5 = 0;
            for (int index = 0; index < numberOfLinks; index++)
            {
                ClickModel click = new ClickModel()
                {
                    Index = index + 1,
                    Link = links[index]
                };
                click.GroupNumber = (int)Math.Ceiling((double)((index) / numberInEachGroup)) + 1;
                click.WhichOf3 = click.GroupNumber > 3 ? 3 : click.GroupNumber;
                click.WhichOf5 = (previousWhichOf3 != click.WhichOf3) ? 1 : (previousWhichOf5 + 1);
                previousWhichOf3 = click.WhichOf3;
                previousWhichOf5 = click.WhichOf5;

                click.Distribution3 = GetSectionSpread(3, click.WhichOf3);
                click.Distribution5 = GetSectionSpread(5, click.WhichOf5);
                click.Distribution5Half = (click.Distribution5 / 2.0);
                click.Distribution35 = click.Distribution3 * click.Distribution5;
                click.RandomOutOf10K = Random.Next((int)(click.Distribution35 * 10000), (int)(click.Distribution35 * (1 + click.Distribution5Half) * 10000));

                clicks.Add(click);
            }
            int sumOfRandoms = clicks.Sum(x => x.RandomOutOf10K);
            clicks.ForEach(x => x.ClickPercentage = (double)x.RandomOutOf10K / sumOfRandoms);

            // Override %ages for social links
            foreach (var click in clicks)
            {
                double overRidePercentage = -1;

                foreach (var k in keywords)
                {
                    if (click.Link.Contains(k.Keyword))
                    {
                        overRidePercentage = k.RulePercentage / 100.0;
                        break;
                    }
                }
                if (overRidePercentage != -1)
                {
                    click.ClickPercentage = overRidePercentage;
                }
            }

            clicks.ForEach(x => x.Clicks = (int)Math.Ceiling(x.ClickPercentage  * clickCountTotal));

            return clicks;
        }

        public static List<ClickModel> GenerateClicksOutof100(List<string> links, long clickCountTotal, List<OpenModelKeyword> keywords)
        {
            List<ClickModel> clicks = new List<ClickModel>();

            // Calculate remaing %ages out of 100 excluding %ages of kewords
            float totalPercentage = 100f;
            int toOverRideCount = 0;
            foreach (var l in links)
            {
                foreach (var k in keywords)
                {
                    if (l.Contains(k.Keyword))
                    {
                        totalPercentage = totalPercentage - k.RulePercentage;
                        toOverRideCount++;
                    }
                }
            }

            int remainingPercentage = 100;//(int)totalPercentage;
            int nonSocialLinks = links.Count - toOverRideCount;
            List<int> numbers;
            if (nonSocialLinks == 1)
                numbers = new List<int>() { 100 };
            else if (nonSocialLinks == 2)
            {
                // first 50-60%
                var num1 = (int)(Random.Next(50000, 65000) / 1000.0);
                numbers = new List<int>() { num1, 100 - num1 };
            }
            else if (nonSocialLinks == 3)
            {
                // first 50-60%, second 30-35%
                var num1 = (int)(Random.Next(50000, 65000) / 1000.0);
                var num2 = (int)(Random.Next(20000, 35000) / 1000.0);
                numbers = new List<int>() { num1, num2, 100 - num1 - num2 };
            }
            else
                numbers = Randomizer.GetNumbers(nonSocialLinks, remainingPercentage).AsEnumerable().OrderByDescending(x => x).ToList();
            int index = 0;
            foreach (var l in links)
            {
                var m = new ClickModel()
                {
                    Link = l,
                };

                float overRidePercentage = -1f;

                foreach (var k in keywords)
                {
                    if (l.Contains(k.Keyword))
                    {
                        overRidePercentage = k.RulePercentage;
                        break;
                    }
                }
                if (overRidePercentage != -1)
                {
                    m.ClickPercentage = overRidePercentage;
                }
                else
                {
                    m.ClickPercentage = numbers[index];
                    index++;
                }
                m.Clicks = (int)(m.ClickPercentage / 100.0 * (double)clickCountTotal);
                clicks.Add(m);
            }

            return clicks;
        }

        public static List<ClickModel> GenerateClicksStartFrom12Percent(List<string> links, long clickCountTotal, List<OpenModelKeyword> keywords)
        {
            double firstPercentage = (double)(Random.Next(120000, 150000));
            double percentage = firstPercentage;
            List<ClickModel> clicks = new List<ClickModel>();
            foreach (var l in links)
            {
                var m = new ClickModel()
                {
                    Link = l,
                };

                float overRidePercentage = -1f;

                foreach (var k in keywords)
                {
                    if (l.Contains(k.Keyword))
                    {
                        overRidePercentage = k.RulePercentage;
                        break;
                    }
                }
                if (overRidePercentage != -1)
                {
                    m.ClickPercentage = overRidePercentage;
                }
                else
                {
                    m.ClickPercentage = percentage / 10000.0;
                    // decrement random for next link  0.1 - firstPercentage
                    percentage = firstPercentage - (Random.Next(2000, (int)firstPercentage));
                }
                m.Clicks = (int)(m.ClickPercentage / 100.0 * (double)clickCountTotal);
                clicks.Add(m);
            }

            return clicks;
        }
    }
}
