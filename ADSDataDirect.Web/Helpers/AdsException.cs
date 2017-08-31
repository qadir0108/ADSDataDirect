using System;
using System.Runtime.Serialization;

namespace ADSDataDirect.Web.Helpers
{
    [Serializable]
    public class AdsException : Exception
    {
        public AdsException()
        : base() { }

        public AdsException(string message)
        : base(message) { }

        public AdsException(string format, params object[] args)
        : base(string.Format(format, args)) { }

        public AdsException(string message, Exception innerException)
        : base(message, innerException) { }

        public AdsException(string format, Exception innerException, params object[] args)
        : base(string.Format(format, args), innerException) { }

        protected AdsException(SerializationInfo info, StreamingContext context)
        : base(info, context) { }
    }
}