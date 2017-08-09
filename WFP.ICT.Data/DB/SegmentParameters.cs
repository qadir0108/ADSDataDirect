using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WFP.ICT.Data.DB
{
    public class SegmentParameters
    {
        public long DataQuantity { get; set; }
        public string CustomerCode { get; set; }
        public List<string> ZipCodes { get; set; }

        public DataTable Zips
        {
            get { return CreateDataTable(ZipCodes); }
        }

        private static DataTable CreateDataTable(IEnumerable<string> ids)
        {
            DataTable table = new DataTable();
            table.Columns.Add("ZipCode", typeof(string));
            foreach (string id in ids)
            {
                table.Rows.Add(id);
            }
            return table;
        }
    }
}
