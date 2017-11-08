using Smartsheet.Api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ADSDataDirect.Web.Smartsheet
{
    public class SheetMap
    {
        public Sheet Sheet { get; set; }
        public Dictionary<string, long> ColumnMap { get; set; }

        public Cell GetCellByColumnName(AbstractRow<Column, Cell> row, string columnName)
        {
            return row.Cells.First(cell => cell.ColumnId == ColumnMap[columnName]);
        }

        public Row GetRowByIONumber(string IONumber)
        {
            Row rowFound = null;
            foreach (var row in Sheet.Rows)
            {
                var cell = GetCellByColumnName(row, "IO#");
                if (cell.DisplayValue == IONumber)
                {
                    rowFound = row;
                    break;
                }
            }
            return rowFound;
        }

        public Row GetRowById(long rowId)
        {
            Row rowFound = Sheet.Rows.FirstOrDefault(x => x.Id == rowId);
            return rowFound;
        }

    }
}