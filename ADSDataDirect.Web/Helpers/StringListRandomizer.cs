using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ADSDataDirect.Web.Helpers
{
    public static class StringListRandomizer
    {
        public static Stack CreateShuffledDeck(IEnumerable<string> values)
        {
            var random = new Random();
            var list = new List<string>(values);
            var stack = new Stack();

            while (list.Count > 0)
            {  // Get the next item at random. 
                var randomIndex = random.Next(0, list.Count);
                var randomItem = list[randomIndex];
                // Remove the item from the list and push it to the top of the deck. 
                list.RemoveAt(randomIndex);
                stack.Push(randomItem);
            }
            return stack;
        }

        public static List<string> RandomArrayEntries(List<string> arrayItems, int count)
        {
            var listToReturn = new List<string>();
            if (arrayItems.Count != count)
            {
                var deck = CreateShuffledDeck(arrayItems);
                for (var i = 0; i < count; i++)
                {
                    var item = (string)deck.Pop();
                    listToReturn.Add(item);
                }
                return listToReturn;
            }
            return arrayItems;
        }
    }
}