using System;
using System.Linq;

namespace ADSDataDirect.Web.Helpers
{
    public class GatePassGenerator
    {
        public static string GetNewPass()
        {
            byte[] buffer = Guid.NewGuid().ToByteArray();
            var formNumber = BitConverter.ToUInt32(buffer, 0) ^ BitConverter.ToUInt32(buffer, 4) ^ BitConverter.ToUInt32(buffer, 8) ^ BitConverter.ToUInt32(buffer, 12);
            return formNumber.ToString("X");
        }

        static Random _random = new Random();
        public static string GetNewPass(int digits)
        {
            byte[] buffer = new byte[digits / 2];
            _random.NextBytes(buffer);
            string result = string.Concat(buffer.Select(x => x.ToString("X2")).ToArray());
            if (digits % 2 == 0)
                return result;
            return result + _random.Next(16).ToString("X");
        }
    }
}