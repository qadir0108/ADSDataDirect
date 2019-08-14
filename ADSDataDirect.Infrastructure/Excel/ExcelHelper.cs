using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using Xdr = DocumentFormat.OpenXml.Drawing.Spreadsheet;
using A = DocumentFormat.OpenXml.Drawing;
using Hyperlink = DocumentFormat.OpenXml.Spreadsheet.Hyperlink;
using System.IO;

namespace ADSDataDirect.Web.Helpers
{
    public static class ExcelHelper
    {
        public static Cell GetCell(Worksheet worksheet, string columnName, uint rowIndex)
        {
            Row row = GetRow(worksheet, rowIndex);

            if (row != null)
                return row.Elements<Cell>().FirstOrDefault(c => string.Compare(c.CellReference.Value, columnName + rowIndex, true) == 0);

            var newRow = ExcelHelper_Old.InsertRow(rowIndex, worksheet.WorksheetPart, null, false);
            return newRow.Elements<Cell>().FirstOrDefault(c => string.Compare(c.CellReference.Value, columnName + rowIndex, true) == 0);

        }

        public static void DeleteRows(uint rowIndex, int count, SheetData sheetData)
        {
            foreach (var row in sheetData.Elements<Row>().Where(r => r.RowIndex.Value >= rowIndex && r.RowIndex.Value <= rowIndex + count).ToList())
            {
                row.Remove();
            }
        }

        public static Row GetRow(Worksheet worksheet, uint rowIndex)
        {
            return worksheet.GetFirstChild<SheetData>().Elements<Row>().FirstOrDefault(r => r.RowIndex == rowIndex);
        }

        public static void AddImage(WorksheetPart worksheetPart, string imageFilePath, int rowNumber, int colNumber)
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