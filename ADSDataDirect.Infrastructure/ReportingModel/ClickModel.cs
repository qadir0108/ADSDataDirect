namespace ADSDataDirect.Infrastructure.ReportingModel
{
    public class ClickModel
    {
        public string Link { get; set; }
        public double ClickPercentage { get; set; }
        public int Clicks { get; set; }

        public int Index { get; set; }
        public int GroupNumber { get; set; }

        public int WhichOf3 { get; set; }
        public int WhichOf5 { get; set; }

        public double Distribution3 { get; set; }
        public double Distribution5 { get; set; }
        public double Distribution5Half { get; set; }
        public double Distribution35 { get; set; }

        public int RandomOutOf10K { get; set; }

    }
}
