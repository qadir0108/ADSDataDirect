using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using ADSDataDirect.Enums;
using ADSDataDirect.Web.Helpers;
using ADSDataDirect.Web.Models;
using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using Xdr = DocumentFormat.OpenXml.Drawing.Spreadsheet;
using A = DocumentFormat.OpenXml.Drawing;
using Hyperlink = DocumentFormat.OpenXml.Spreadsheet.Hyperlink;

namespace ADSDataDirect.Web.Reports
{
    public static class TrackingReports
    {
        public static void GenerateTemplate1(CampaignTrackingVm model, string templateFile, bool isAddDataFiles, string logoFilePath, string imageFilePath, string outputFile)
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
                    cell.CellValue = new CellValue(model.DeliveryPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 15);
                    cell.CellValue = new CellValue(model.Deployed);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 16);
                    cell.CellValue = new CellValue(model.Quantity);
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

                    if(isAddDataFiles)
                    {
                        uint rowNumber = 43;
                        foreach (var segment in model.Segments)
                        {
                            cell = GetCell(worksheetPart.Worksheet, "A", rowNumber);
                            cell.CellValue = new CellValue(segment.SegmentNumber);
                            cell.DataType = new EnumValue<CellValues>(CellValues.String);

                            cell = GetCell(worksheetPart.Worksheet, "B", rowNumber);
                            cell.CellValue = new CellValue(segment.SegmentDataFileUrl);
                            cell.DataType = new EnumValue<CellValues>(CellValues.String);
                            rowNumber++;
                        }
                    }
                    
                    #endregion

                    #region Second Page

                    if (File.Exists(imageFilePath))
                        AddImage(worksheetPart, imageFilePath, 17, 7);

                    cell = GetCell(worksheetPart.Worksheet, "B", 73);
                    cell.CellValue = new CellValue(model.CampaignName);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

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
                    int total = 117;
                    foreach (var vm in model.PerLink)
                    {
                        PopulateRowTemplate1(worksheetPart.Worksheet, vm, start);
                        start++;
                    }

                    #endregion

                    DeleteRows(start, total - (int)start, worksheetPart.Worksheet.GetFirstChild<SheetData>());

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

                    uint rowNumber = 15;
                    foreach (var segment in model.Segments)
                    {
                        cell = GetCell(worksheetPart.Worksheet, "C", rowNumber);
                        cell.CellValue = new CellValue(segment.SegmentNumber);
                        cell.DataType = new EnumValue<CellValues>(CellValues.String);

                        cell = GetCell(worksheetPart.Worksheet, "D", rowNumber);
                        cell.CellValue = new CellValue(segment.SegmentDataFileUrl);
                        cell.DataType = new EnumValue<CellValues>(CellValues.String);
                        rowNumber++;
                    }

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
                    cell = GetCell(worksheetPart.Worksheet, "C", 20);
                    cell.CellValue = new CellValue(model.Quantity);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 23);
                    cell.CellValue = new CellValue(model.OpenedPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "H", 23);
                    cell.CellValue = new CellValue(model.Opened);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 26);
                    cell.CellValue = new CellValue(model.ClickedPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "H", 26);
                    cell.CellValue = new CellValue(model.Clicked);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "L", 26);
                    cell.CellValue = new CellValue(model.ClickToOpenPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "C", 29);
                    cell.CellValue = new CellValue("Forwards : " + model.Forwards);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);
                    
                    cell = GetCell(worksheetPart.Worksheet, "C", 32);
                    cell.CellValue = new CellValue(model.UnsubPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "H", 32);
                    cell.CellValue = new CellValue(model.Unsub);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = GetCell(worksheetPart.Worksheet, "L", 32);
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

            var newRow = ExcelHelper.InsertRow(rowIndex, worksheet.WorksheetPart, null, true);
            return newRow.Elements<Cell>().FirstOrDefault(c => string.Compare(c.CellReference.Value, columnName + rowIndex, true) == 0);

        }

        private static void DeleteRows(uint rowIndex, int count, SheetData sheetData)
        {
            foreach (var row in sheetData.Elements<Row>().Where(r => r.RowIndex.Value >= rowIndex && r.RowIndex.Value <= rowIndex + count).ToList())
            {
                row.Remove();
            }
        }

        private static Row GetRow(Worksheet worksheet, uint rowIndex)
        {
            return worksheet.GetFirstChild<SheetData>().Elements<Row>().FirstOrDefault(r => r.RowIndex == rowIndex);
        }

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