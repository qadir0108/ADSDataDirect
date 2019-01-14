using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using ADSDataDirect.Enums;
using ADSDataDirect.Infrastructure.Image;
using ADSDataDirect.Web.Helpers;
using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;

namespace ADSDataDirect.Infrastructure.TemplateReports
{
    public class TrackingReportTemplateStrat : BaseTrackingReport, ITrackingReport 
    {
        public TrackingReportTemplateStrat(string reportTemplate, string customerName, string companyLogo, string screenshotFilePath) 
            : base(reportTemplate, customerName, companyLogo, screenshotFilePath)
        {
            LogoWidth = 500;
            LogoHeight = 86;
        }

        public override void Generate(TemplateReportVm model, string outputFilePath)
        {
            //ImageResizer.Resize(LogoFilePath, LogoResized, LogoWidth, LogoHeight, true);

            File.Copy(TemplateFile, outputFilePath, true);

            byte[] byteArray = File.ReadAllBytes(outputFilePath);
            using (MemoryStream stream = new MemoryStream())
            {
                stream.Write(byteArray, 0, byteArray.Length);
                using (SpreadsheetDocument spreadSheet = SpreadsheetDocument.Open(stream, true))
                {
                    spreadSheet.WorkbookPart.Workbook.CalculationProperties.ForceFullCalculation = true;
                    spreadSheet.WorkbookPart.Workbook.CalculationProperties.FullCalculationOnLoad = true;

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

                    //ExcelHelper.AddImage(worksheetPart, LogoResized, 6, 1);

                    Cell cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "L", 2);
                    cell.CellValue = new CellValue(DateTime.Now.ToString(StringConstants.DateFormatSlashes));
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 10);
                    cell.CellValue = new CellValue(model.StartDate);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 11);
                    cell.CellValue = new CellValue(model.SubjectLine);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 13);
                    cell.CellValue = new CellValue(model.FromLine);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 14);
                    cell.CellValue = new CellValue(model.WhiteLabel);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 16);
                    cell.CellValue = new CellValue(model.OrderNumber);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 17);
                    cell.CellValue = new CellValue(model.CampaignName);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    if(!string.IsNullOrEmpty(model.IoNumber) && !model.IoNumber.EndsWith("RDP"))
                    {
                        uint rowNumber = 18;
                        foreach (var segment in model.Segments)
                        {
                            cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", rowNumber);
                            cell.CellValue = new CellValue(segment.SegmentNumber);
                            cell.DataType = new EnumValue<CellValues>(CellValues.String);

                            cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "D", rowNumber);
                            cell.CellValue = new CellValue(segment.SegmentDataFileUrl);
                            cell.DataType = new EnumValue<CellValues>(CellValues.String);
                            rowNumber++;
                        }
                    }

                    // right side
                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "L", 6);
                    cell.CellValue = new CellValue(model.Quantity);
                    cell.DataType = new EnumValue<CellValues>(CellValues.Number);

                    // key stats
                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 23);
                    cell.CellValue = new CellValue(model.Quantity);
                    cell.DataType = new EnumValue<CellValues>(CellValues.Number);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 26);
                    cell.CellValue = new CellValue(model.Opened);
                    cell.DataType = new EnumValue<CellValues>(CellValues.Number);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "H", 26);
                    cell.CellValue = new CellValue(model.Desktop);
                    cell.DataType = new EnumValue<CellValues>(CellValues.Number);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "L", 26);
                    cell.CellValue = new CellValue(model.Mobile);
                    cell.DataType = new EnumValue<CellValues>(CellValues.Number);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 29);
                    cell.CellValue = new CellValue(model.Clicked);
                    cell.DataType = new EnumValue<CellValues>(CellValues.Number);

                    // Shared and Un-sub stats
                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 32);
                    cell.CellValue = new CellValue(model.Bounce);
                    cell.DataType = new EnumValue<CellValues>(CellValues.Number);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 35);
                    cell.CellValue = new CellValue(model.Opt);
                    cell.DataType = new EnumValue<CellValues>(CellValues.Number);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 39);
                    cell.CellValue = new CellValue(model.RetargetingImpressions);
                    cell.DataType = new EnumValue<CellValues>(CellValues.Number);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 40);
                    cell.CellValue = new CellValue(model.RetargetingClicks);
                    cell.DataType = new EnumValue<CellValues>(CellValues.Number);

                    #endregion

                    #region Second Page
                    if (File.Exists(ScreenshotFilePath))
                        ExcelHelper.AddImage(worksheetPart, ScreenshotFilePath, 45, 3);
                    #endregion

                    uint start = 70;
                    #region Third Page
                    foreach (var vm in model.PerLink)
                    {
                        PopulateRowTemplate(worksheetPart.Worksheet, vm, start);
                        start++;
                    }
                    #endregion

                    worksheetPart.Worksheet.Save();
                    spreadSheet.Close();
                }
                File.WriteAllBytes(outputFilePath, stream.ToArray());
            }
        }

        public override void PopulateRowTemplate(Worksheet worksheet, TemplateReportDetailVm row, uint rowNumber)
        {
            Cell cell = ExcelHelper.GetCell(worksheet, "A", rowNumber);
            cell.CellValue = new CellValue(row.Link);
            cell.DataType = new EnumValue<CellValues>(CellValues.String);

            cell = ExcelHelper.GetCell(worksheet, "L", rowNumber);
            cell.CellValue = new CellValue(row.ClickCount.ToString());
            cell.DataType = new EnumValue<CellValues>(CellValues.Number);
        }

    }
}