using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using WFP.ICT.Enum;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;
using Xdr = DocumentFormat.OpenXml.Drawing.Spreadsheet;
using A = DocumentFormat.OpenXml.Drawing;
using A14 = DocumentFormat.OpenXml.Office2010.Drawing;

namespace WFP.ICT.Web.Reports
{
    public static class TrackingReports
    {
        public static void GenerateTemplate1(CampaignTrackingVm model, string templateFile, string logoFilePath, string imageFilePath, string outputFile)
        {
            File.Copy(templateFile, outputFile, true);

            byte[] byteArray = File.ReadAllBytes(outputFile);
            using (MemoryStream stream = new MemoryStream())
            {
                stream.Write(byteArray, 0, byteArray.Length);
                using (SpreadsheetDocument spreadSheet = SpreadsheetDocument.Open(stream, true))
                {
                    // Do work here
                    IEnumerable<Sheet> sheets = spreadSheet.WorkbookPart.Workbook
                        .GetFirstChild<Sheets>().Elements<Sheet>()
                        .Where(s => s.Name == "TrackingReport")
                        .ToArray();

                    if (!sheets.Any())
                    {
                        throw new AdsException("No sheets");
                    }

                    string relationshipId = sheets.First().Id.Value;
                    WorksheetPart worksheetPart = (WorksheetPart) spreadSheet.WorkbookPart.GetPartById(relationshipId);

                    #region First Page

                    AddImage(worksheetPart, logoFilePath, 3, 1);
                    AddImage(worksheetPart, logoFilePath, 68, 1);

                    Cell cell = GetCell(worksheetPart.Worksheet, "J", 8);
                    cell.CellValue = new CellValue(model.OrderNumber);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "J", 9);
                    cell.CellValue = new CellValue(model.StartDate);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "J", 10);
                    cell.CellValue = new CellValue(DateTime.Now.ToString(StringConstants.DateFormatSlashes));
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "B", 8);
                    cell.CellValue = new CellValue(model.CampaignName);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // send / delviery
                    cell = GetCell(worksheetPart.Worksheet, "C", 14);
                    cell.CellValue = new CellValue(model.OpenedPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 15);
                    cell.CellValue = new CellValue(model.Quantity);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 16);
                    cell.CellValue = new CellValue(model.Opened);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // opened
                    cell = GetCell(worksheetPart.Worksheet, "C", 22);
                    cell.CellValue = new CellValue(model.OpenedPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 23);
                    cell.CellValue = new CellValue(model.Opened);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // clicks
                    cell = GetCell(worksheetPart.Worksheet, "A", 26);
                    cell.CellValue = new CellValue(model.Clicked);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "B", 26);
                    cell.CellValue = new CellValue(model.ClickedPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 26);
                    cell.CellValue = new CellValue(model.ClickToOpenPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // bounce & opt
                    cell = GetCell(worksheetPart.Worksheet, "A", 29);
                    cell.CellValue = new CellValue(model.Bounce);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "B", 29);
                    cell.CellValue = new CellValue(model.Opt);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // desktop & mobile
                    cell = GetCell(worksheetPart.Worksheet, "C", 37);
                    cell.CellValue = new CellValue(model.Desktop);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 38);
                    cell.CellValue = new CellValue(model.Mobile);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // desktop & mobile
                    cell = GetCell(worksheetPart.Worksheet, "H", 14);
                    cell.CellValue = new CellValue(model.SubjectLine);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "H", 15);
                    cell.CellValue = new CellValue(model.FromLine);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    #endregion

                    #region Second Page

                    if (File.Exists(imageFilePath))
                        AddImage(worksheetPart, imageFilePath, 17, 7);

                    cell = GetCell(worksheetPart.Worksheet, "J", 73);
                    cell.CellValue = new CellValue(model.OrderNumber);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "J", 74);
                    cell.CellValue = new CellValue(model.StartDate);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "J", 75);
                    cell.CellValue = new CellValue(DateTime.Now.ToString(StringConstants.DateFormatSlashes));
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    uint start = 82;
                    foreach (var vm in model.PerLink)
                    {
                        PopulateRowTemplate1(worksheetPart.Worksheet, vm, start);
                        start++;
                    }

                    #endregion

                    worksheetPart.Worksheet.Save();
                    spreadSheet.Close();
                }
                File.WriteAllBytes(outputFile, stream.ToArray());
            }
        }

        public static void GenerateTemplate2(CampaignTrackingVm model, string templateFile, string logoFilePath, string imageFilePath, string outputFile)
        {
            File.Copy(templateFile, outputFile, true);

            byte[] byteArray = File.ReadAllBytes(outputFile);
            using (MemoryStream stream = new MemoryStream())
            {
                stream.Write(byteArray, 0, byteArray.Length);
                using (SpreadsheetDocument spreadSheet = SpreadsheetDocument.Open(stream, true))
                {
                    // Do work here
                    IEnumerable<Sheet> sheets = spreadSheet.WorkbookPart.Workbook
                        .GetFirstChild<Sheets>().Elements<Sheet>()
                        .Where(s => s.Name == "TrackingReport")
                        .ToArray();

                    if (!sheets.Any())
                    {
                        throw new AdsException("No sheets");
                    }

                    string relationshipId = sheets.First().Id.Value;
                    WorksheetPart worksheetPart = (WorksheetPart)spreadSheet.WorkbookPart.GetPartById(relationshipId);

                    #region First Page

                    AddImage(worksheetPart, logoFilePath, 3, 1);

                    Cell cell = GetCell(worksheetPart.Worksheet, "C", 7);
                    cell.CellValue = new CellValue(model.StartDate);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 8);
                    cell.CellValue = new CellValue(model.SubjectLine);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 10);
                    cell.CellValue = new CellValue(model.FromLine);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 11);
                    cell.CellValue = new CellValue(model.WhiteLabel);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 13);
                    cell.CellValue = new CellValue(model.OrderNumber);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 14);
                    cell.CellValue = new CellValue(model.CampaignName);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // right side
                    cell = GetCell(worksheetPart.Worksheet, "L", 4);
                    cell.CellValue = new CellValue(model.Quantity);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "L", 7);
                    cell.CellValue = new CellValue(model.OpenedPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "L", 10);
                    cell.CellValue = new CellValue(model.ClickedPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "L", 13);
                    cell.CellValue = new CellValue(model.UnsubToOpenPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // key stats
                    cell = GetCell(worksheetPart.Worksheet, "C", 19);
                    cell.CellValue = new CellValue(model.Quantity);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 22);
                    cell.CellValue = new CellValue(model.OpenedPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "H", 22);
                    cell.CellValue = new CellValue(model.Opened);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 25);
                    cell.CellValue = new CellValue(model.ClickedPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "H", 25);
                    cell.CellValue = new CellValue(model.Clicked);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "L", 25);
                    cell.CellValue = new CellValue(model.ClickToOpenPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 28);
                    cell.CellValue = new CellValue("Forwards : " + model.Forwards);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);
                    
                    cell = GetCell(worksheetPart.Worksheet, "C", 31);
                    cell.CellValue = new CellValue(model.UnsubPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "H", 31);
                    cell.CellValue = new CellValue(model.Unsub);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "L", 31);
                    cell.CellValue = new CellValue(model.UnsubToOpenPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    #endregion

                    #region Second Page
                    
                    uint start = 36;
                    foreach (var vm in model.PerLink)
                    {
                        PopulateRowTemplate2(worksheetPart.Worksheet, vm, start);
                        start++;
                    }

                    #endregion

                    worksheetPart.Worksheet.Save();
                    spreadSheet.Close();
                }
                File.WriteAllBytes(outputFile, stream.ToArray());
            }
        }

        private static void PopulateRowTemplate1(Worksheet worksheet, CampaignTrackingDetailVm row, uint rowNumber)
        {
            Cell cell = GetCell(worksheet, "A", rowNumber);
            cell.CellValue = new CellValue(row.Link);
            cell.DataType = new EnumValue<CellValues>(CellValues.String);

            cell = GetCell(worksheet, "F", rowNumber);
            cell.CellValue = new CellValue(row.ClickCount);
            cell.DataType = new EnumValue<CellValues>(CellValues.String);

            cell = GetCell(worksheet, "G", rowNumber);
            cell.CellValue = new CellValue(row.UniqueCount);
            cell.DataType = new EnumValue<CellValues>(CellValues.String);

            cell = GetCell(worksheet, "H", rowNumber);
            cell.CellValue = new CellValue(row.MobileCount);
            cell.DataType = new EnumValue<CellValues>(CellValues.String);
        }

        private static void PopulateRowTemplate2(Worksheet worksheet, CampaignTrackingDetailVm row, uint rowNumber)
        {
            Cell cell = GetCell(worksheet, "A", rowNumber);
            cell.CellValue = new CellValue(row.Link);
            cell.DataType = new EnumValue<CellValues>(CellValues.String);

            cell = GetCell(worksheet, "L", rowNumber);
            cell.CellValue = new CellValue(row.ClickCount);
            cell.DataType = new EnumValue<CellValues>(CellValues.String);
        }

        private static Cell GetCell(Worksheet worksheet, string columnName, uint rowIndex)
        {
            Row row = GetRow(worksheet, rowIndex);

            if (row != null)
                return row.Elements<Cell>().FirstOrDefault(c => string.Compare(c.CellReference.Value, columnName + rowIndex, true) == 0);

            var firstRow = GetRow(worksheet, 82);
            var lastRow = GetRow(worksheet, 99);
            //row.InsertAfter(row.CloneNode(true));
            //var newRow = CreateRow(firstRow, lastRow, rowIndex, worksheet.GetFirstChild<SheetData>());

            var newRow = InsertRow(rowIndex, worksheet.WorksheetPart, null, true);

            return newRow.Elements<Cell>().FirstOrDefault(c => string.Compare(c.CellReference.Value, columnName + rowIndex, true) == 0);

        }

        private static Row CreateRow(Row firstRow, Row lastRow, uint newRowIndex, SheetData sheetData)
        {
            var newRow = (Row)firstRow.CloneNode(true);
            foreach (Cell cell in newRow.Elements<Cell>())
            {
                string cellReference = cell.CellReference.Value;
                cell.CellReference = new StringValue(cellReference.Replace(firstRow.RowIndex.Value.ToString(), newRowIndex.ToString()));
            }
            newRow.RowIndex = new UInt32Value(newRowIndex);

            sheetData.InsertAfter(newRow, lastRow);
            return newRow;
        }

        // Given a worksheet and a row index, return the row.
        private static Row GetRow(Worksheet worksheet, uint rowIndex)
        {
            return worksheet.GetFirstChild<SheetData>().Elements<Row>().FirstOrDefault(r => r.RowIndex == rowIndex);
        }

        #region NEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEWNEW

        /// <summary>
        /// Inserts a new row at the desired index. If one already exists, then it is
        /// returned. If an insertRow is provided, then it is inserted into the desired
        /// rowIndex
        /// </summary>
        /// <param name="rowIndex">Row Index</param>
        /// <param name="worksheetPart">Worksheet Part</param>
        /// <param name="insertRow">Row to insert</param>
        /// <param name="isLastRow">Optional parameter - True, you can guarantee that this row is the last row (not replacing an existing last row) in the sheet to insert; false it is not</param>
        /// <returns>Inserted Row</returns>
        public static Row InsertRow(uint rowIndex, WorksheetPart worksheetPart, Row insertRow, bool isNewLastRow = false)
        {
            Worksheet worksheet = worksheetPart.Worksheet;
            SheetData sheetData = worksheet.GetFirstChild<SheetData>();

            Row retRow = !isNewLastRow ? sheetData.Elements<Row>().FirstOrDefault(r => r.RowIndex == rowIndex) : null;

            // If the worksheet does not contain a row with the specified row index, insert one.
            if (retRow != null)
            {
                // if retRow is not null and we are inserting a new row, then move all existing rows down.
                if (insertRow != null)
                {
                    UpdateRowIndexes(worksheetPart, rowIndex, false);
                    UpdateMergedCellReferences(worksheetPart, rowIndex, false);
                    UpdateHyperlinkReferences(worksheetPart, rowIndex, false);

                    // actually insert the new row into the sheet
                    retRow = sheetData.InsertBefore(insertRow, retRow);  // at this point, retRow still points to the row that had the insert rowIndex

                    string curIndex = retRow.RowIndex.ToString();
                    string newIndex = rowIndex.ToString();

                    foreach (Cell cell in retRow.Elements<Cell>())
                    {
                        // Update the references for the rows cells.
                        cell.CellReference = new StringValue(cell.CellReference.Value.Replace(curIndex, newIndex));
                    }

                    // Update the row index.
                    retRow.RowIndex = rowIndex;
                }
            }
            else
            {
                // Row doesn't exist yet, shifting not needed.
                // Rows must be in sequential order according to RowIndex. Determine where to insert the new row.
                Row refRow = !isNewLastRow ? sheetData.Elements<Row>().FirstOrDefault(row => row.RowIndex > rowIndex) : null;

                // use the insert row if it exists
                retRow = insertRow ?? new Row() { RowIndex = rowIndex };

                IEnumerable<Cell> cellsInRow = retRow.Elements<Cell>();

                if (cellsInRow.Any())
                {
                    string curIndex = retRow.RowIndex.ToString();
                    string newIndex = rowIndex.ToString();

                    foreach (Cell cell in cellsInRow)
                    {
                        // Update the references for the rows cells.
                        cell.CellReference = new StringValue(cell.CellReference.Value.Replace(curIndex, newIndex));
                    }

                    // Update the row index.
                    retRow.RowIndex = rowIndex;
                }

                sheetData.InsertBefore(retRow, refRow);
            }

            return retRow;
        }

        /// <summary>
        /// Updates all of the Row indexes and the child Cells' CellReferences whenever
        /// a row is inserted or deleted.
        /// </summary>
        /// <param name="worksheetPart">Worksheet Part</param>
        /// <param name="rowIndex">Row Index being inserted or deleted</param>
        /// <param name="isDeletedRow">True if row was deleted, otherwise false</param>
        private static void UpdateRowIndexes(WorksheetPart worksheetPart, uint rowIndex, bool isDeletedRow)
        {
            // Get all the rows in the worksheet with equal or higher row index values than the one being inserted/deleted for reindexing.
            IEnumerable<Row> rows = worksheetPart.Worksheet.Descendants<Row>().Where(r => r.RowIndex.Value >= rowIndex);

            foreach (Row row in rows)
            {
                uint newIndex = (isDeletedRow ? row.RowIndex - 1 : row.RowIndex + 1);
                string curRowIndex = row.RowIndex.ToString();
                string newRowIndex = newIndex.ToString();

                foreach (Cell cell in row.Elements<Cell>())
                {
                    // Update the references for the rows cells.
                    cell.CellReference = new StringValue(cell.CellReference.Value.Replace(curRowIndex, newRowIndex));
                }

                // Update the row index.
                row.RowIndex = newIndex;
            }
        }

        /// <summary>
        /// Updates the MergedCelss reference whenever a new row is inserted or deleted. It will simply take the
        /// row index and either increment or decrement the cell row index in the merged cell reference based on
        /// if the row was inserted or deleted.
        /// </summary>
        /// <param name="worksheetPart">Worksheet Part</param>
        /// <param name="rowIndex">Row Index being inserted or deleted</param>
        /// <param name="isDeletedRow">True if row was deleted, otherwise false</param>
        private static void UpdateMergedCellReferences(WorksheetPart worksheetPart, uint rowIndex, bool isDeletedRow)
        {
            if (worksheetPart.Worksheet.Elements<MergeCells>().Count() > 0)
            {
                MergeCells mergeCells = worksheetPart.Worksheet.Elements<MergeCells>().FirstOrDefault();

                if (mergeCells != null)
                {
                    // Grab all the merged cells that have a merge cell row index reference equal to or greater than the row index passed in
                    List<MergeCell> mergeCellsList = mergeCells.Elements<MergeCell>().Where(r => r.Reference.HasValue)
                                                                                     .Where(r => GetRowIndex(r.Reference.Value.Split(':').ElementAt(0)) >= rowIndex ||
                                                                                                 GetRowIndex(r.Reference.Value.Split(':').ElementAt(1)) >= rowIndex).ToList();

                    // Need to remove all merged cells that have a matching rowIndex when the row is deleted
                    if (isDeletedRow)
                    {
                        List<MergeCell> mergeCellsToDelete = mergeCellsList.Where(r => GetRowIndex(r.Reference.Value.Split(':').ElementAt(0)) == rowIndex ||
                                                                                       GetRowIndex(r.Reference.Value.Split(':').ElementAt(1)) == rowIndex).ToList();

                        // Delete all the matching merged cells
                        foreach (MergeCell cellToDelete in mergeCellsToDelete)
                        {
                            cellToDelete.Remove();
                        }

                        // Update the list to contain all merged cells greater than the deleted row index
                        mergeCellsList = mergeCells.Elements<MergeCell>().Where(r => r.Reference.HasValue)
                                                                         .Where(r => GetRowIndex(r.Reference.Value.Split(':').ElementAt(0)) > rowIndex ||
                                                                                     GetRowIndex(r.Reference.Value.Split(':').ElementAt(1)) > rowIndex).ToList();
                    }

                    // Either increment or decrement the row index on the merged cell reference
                    foreach (MergeCell mergeCell in mergeCellsList)
                    {
                        string[] cellReference = mergeCell.Reference.Value.Split(':');

                        if (GetRowIndex(cellReference.ElementAt(0)) >= rowIndex)
                        {
                            string columnName = GetColumnName(cellReference.ElementAt(0));
                            cellReference[0] = isDeletedRow ? columnName + (GetRowIndex(cellReference.ElementAt(0)) - 1).ToString() : IncrementCellReference(cellReference.ElementAt(0), CellReferencePartEnum.Row);
                        }

                        if (GetRowIndex(cellReference.ElementAt(1)) >= rowIndex)
                        {
                            string columnName = GetColumnName(cellReference.ElementAt(1));
                            cellReference[1] = isDeletedRow ? columnName + (GetRowIndex(cellReference.ElementAt(1)) - 1).ToString() : IncrementCellReference(cellReference.ElementAt(1), CellReferencePartEnum.Row);
                        }

                        mergeCell.Reference = new StringValue(cellReference[0] + ":" + cellReference[1]);
                    }
                }
            }
        }

        /// <summary>
        /// Updates all hyperlinks in the worksheet when a row is inserted or deleted.
        /// </summary>
        /// <param name="worksheetPart">Worksheet Part</param>
        /// <param name="rowIndex">Row Index being inserted or deleted</param>
        /// <param name="isDeletedRow">True if row was deleted, otherwise false</param>
        private static void UpdateHyperlinkReferences(WorksheetPart worksheetPart, uint rowIndex, bool isDeletedRow)
        {
            Hyperlinks hyperlinks = worksheetPart.Worksheet.Elements<Hyperlinks>().FirstOrDefault();

            if (hyperlinks != null)
            {
                Match hyperlinkRowIndexMatch;
                uint hyperlinkRowIndex;

                foreach (Hyperlink hyperlink in hyperlinks.Elements<Hyperlink>())
                {
                    hyperlinkRowIndexMatch = Regex.Match(hyperlink.Reference.Value, "[0-9]+");
                    if (hyperlinkRowIndexMatch.Success && uint.TryParse(hyperlinkRowIndexMatch.Value, out hyperlinkRowIndex) && hyperlinkRowIndex >= rowIndex)
                    {
                        // if being deleted, hyperlink needs to be removed or moved up
                        if (isDeletedRow)
                        {
                            // if hyperlink is on the row being removed, remove it
                            if (hyperlinkRowIndex == rowIndex)
                            {
                                hyperlink.Remove();
                            }
                            // else hyperlink needs to be moved up a row
                            else
                            {
                                hyperlink.Reference.Value = hyperlink.Reference.Value.Replace(hyperlinkRowIndexMatch.Value, (hyperlinkRowIndex - 1).ToString());

                            }
                        }
                        // else row is being inserted, move hyperlink down
                        else
                        {
                            hyperlink.Reference.Value = hyperlink.Reference.Value.Replace(hyperlinkRowIndexMatch.Value, (hyperlinkRowIndex + 1).ToString());
                        }
                    }
                }

                // Remove the hyperlinks collection if none remain
                if (hyperlinks.Elements<Hyperlink>().Count() == 0)
                {
                    hyperlinks.Remove();
                }
            }
        }

        /// <summary>
        /// Given a cell name, parses the specified cell to get the row index.
        /// </summary>
        /// <param name="cellReference">Address of the cell (ie. B2)</param>
        /// <returns>Row Index (ie. 2)</returns>
        public static uint GetRowIndex(string cellReference)
        {
            // Create a regular expression to match the row index portion the cell name.
            Regex regex = new Regex(@"\d+");
            Match match = regex.Match(cellReference);

            return uint.Parse(match.Value);
        }

        /// <summary>
        /// Increments the reference of a given cell.  This reference comes from the CellReference property
        /// on a Cell.
        /// </summary>
        /// <param name="reference">reference string</param>
        /// <param name="cellRefPart">indicates what is to be incremented</param>
        /// <returns></returns>
        public static string IncrementCellReference(string reference, CellReferencePartEnum cellRefPart)
        {
            string newReference = reference;

            if (cellRefPart != CellReferencePartEnum.None && !String.IsNullOrEmpty(reference))
            {
                string[] parts = Regex.Split(reference, "([A-Z]+)");

                if (cellRefPart == CellReferencePartEnum.Column || cellRefPart == CellReferencePartEnum.Both)
                {
                    List<char> col = parts[1].ToCharArray().ToList();
                    bool needsIncrement = true;
                    int index = col.Count - 1;

                    do
                    {
                        // increment the last letter
                        col[index] = Letters[Letters.IndexOf(col[index]) + 1];

                        // if it is the last letter, then we need to roll it over to 'A'
                        if (col[index] == Letters[Letters.Count - 1])
                        {
                            col[index] = Letters[0];
                        }
                        else
                        {
                            needsIncrement = false;
                        }

                    } while (needsIncrement && --index >= 0);

                    // If true, then we need to add another letter to the mix. Initial value was something like "ZZ"
                    if (needsIncrement)
                    {
                        col.Add(Letters[0]);
                    }

                    parts[1] = new String(col.ToArray());
                }

                if (cellRefPart == CellReferencePartEnum.Row || cellRefPart == CellReferencePartEnum.Both)
                {
                    // Increment the row number. A reference is invalid without this componenet, so we assume it will always be present.
                    parts[2] = (int.Parse(parts[2]) + 1).ToString();
                }

                newReference = parts[1] + parts[2];
            }

            return newReference;
        }

        /// <summary>
        /// Given a cell name, parses the specified cell to get the column name.
        /// </summary>
        /// <param name="cellReference">Address of the cell (ie. B2)</param>
        /// <returns>Column name (ie. A2)</returns>
        private static string GetColumnName(string cellName)
        {
            // Create a regular expression to match the column name portion of the cell name.
            Regex regex = new Regex("[A-Za-z]+");
            Match match = regex.Match(cellName);

            return match.Value;
        }
        public enum CellReferencePartEnum
        {
            None,
            Column,
            Row,
            Both
        }
        private static List<char> Letters = new List<char>() { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ' ' };


        #endregion
        
        private static void AddImage(WorksheetPart worksheetPart, string imageFilePath, int rowNumber, int colNumber)
        {
            Bitmap bm = new Bitmap(imageFilePath);
            DocumentFormat.OpenXml.Drawing.Extents extents = new DocumentFormat.OpenXml.Drawing.Extents();
            var extentsCx = (long)bm.Width * (long)((float)914400 / bm.HorizontalResolution);
            var extentsCy = (long)bm.Height * (long)((float)914400 / bm.VerticalResolution);
            bm.Dispose();

            var colOffset = 0;
            var rowOffset = 0;
            //int colNumber = 5;
            //int rowNumber = 10;

            var drawingsPart = worksheetPart.DrawingsPart;
            var worksheetDrawing = drawingsPart.WorksheetDrawing;

            var imagePart = drawingsPart.AddImagePart(ImagePartType.Jpeg);

            using (var stream = new FileStream(imageFilePath, FileMode.Open))
            {
                imagePart.FeedData(stream);
            }

            var nvps = worksheetDrawing.Descendants<Xdr.NonVisualDrawingProperties>();
            var nvpId = nvps.Count() > 0 ?
                (UInt32Value)worksheetDrawing.Descendants<Xdr.NonVisualDrawingProperties>().Max(p => p.Id.Value) + 1 :
                1U;

            var oneCellAnchor = new Xdr.OneCellAnchor(
                new Xdr.FromMarker
                {
                    ColumnId = new Xdr.ColumnId((colNumber - 1).ToString()),
                    RowId = new Xdr.RowId((rowNumber - 1).ToString()),
                    ColumnOffset = new Xdr.ColumnOffset(colOffset.ToString()),
                    RowOffset = new Xdr.RowOffset(rowOffset.ToString())
                },
                new Xdr.Extent { Cx = extentsCx, Cy = extentsCy },
                new Xdr.Picture(
                    new Xdr.NonVisualPictureProperties(
                        new Xdr.NonVisualDrawingProperties { Id = nvpId, Name = "Picture " + nvpId, Description = imageFilePath },
                        new Xdr.NonVisualPictureDrawingProperties(new A.PictureLocks { NoChangeAspect = true })
                    ),
                    new Xdr.BlipFill(
                        new A.Blip { Embed = drawingsPart.GetIdOfPart(imagePart), CompressionState = A.BlipCompressionValues.Print },
                        new A.Stretch(new A.FillRectangle())
                    ),
                    new Xdr.ShapeProperties(
                        new A.Transform2D(
                            new A.Offset { X = 0, Y = 0 },
                            new A.Extents { Cx = extentsCx, Cy = extentsCy }
                        ),
                        new A.PresetGeometry { Preset = A.ShapeTypeValues.Rectangle }
                    )
                ),
                new Xdr.ClientData()
            );
            worksheetDrawing.Append(oneCellAnchor);

            //foreach (ImagePart i in worksheetPart.DrawingsPart.ImageParts)
            //{
            //    var rId = worksheetPart.DrawingsPart.GetIdOfPart(i);

            //    Console.WriteLine("The rId of this Image is '{0}'", rId);
            //    //Stream stream = i.GetStream();
            //    //long length = stream.Length;
            //    //byte[] byteStream = new byte[length];
            //    //stream.Read(byteStream, 0, (int)length);
            //    //var imageAsString = Convert.ToBase64String(byteStream);

            //    if (rId == "rId5")
            //    {
            //        using (var stream1 = new FileStream(logoFilePath, FileMode.Open))
            //        {
            //            i.FeedData(stream1);
            //        }
            //    }

            //    if (rId == "rId3")
            //    {
            //        using (var stream1 = new FileStream(imageFilePath, FileMode.Open))
            //        {
            //            i.FeedData(stream1);
            //        }
            //    }

            //}


        }

    }
}