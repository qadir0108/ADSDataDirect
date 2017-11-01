using ADSDataDirect.Enums;
using ADSDataDirect.Web.Helpers;
using ADSDataDirect.Web.Models;
using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace ADSDataDirect.Web.Reports
{
    public class TrackingReportTemplate34 : BaseTrackingReport, ITrackingReport 
    {
        public TrackingReportTemplate34(string reportTemplate, string customerName, string companyLogo, string screenshotFilePath) 
            : base(reportTemplate, customerName, companyLogo, screenshotFilePath)
        {
            LogoWidth = 500;
            LogoHeight = 86;
        }

        public override void Generate(CampaignTrackingVm model, string outputFilePath)
        {
            ImageResizer.Resize(LogoFilePath, LogoResized, LogoWidth, LogoHeight, true);

            File.Copy(TemplateFile, outputFilePath, true);

            byte[] byteArray = File.ReadAllBytes(outputFilePath);
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

                    ExcelHelper.AddImage(worksheetPart, LogoResized, 3, 1);

                    Cell cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "L", 2);
                    cell.CellValue = new CellValue(DateTime.Now.ToString(StringConstants.DateTimeFormatSlashes));
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 7);
                    cell.CellValue = new CellValue(model.StartDate);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 8);
                    cell.CellValue = new CellValue(model.SubjectLine);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 10);
                    cell.CellValue = new CellValue(model.FromLine);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 11);
                    cell.CellValue = new CellValue(model.WhiteLabel);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 13);
                    cell.CellValue = new CellValue(model.OrderNumber);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 14);
                    cell.CellValue = new CellValue(model.CampaignName);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    uint rowNumber = 15;
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

                    // right side
                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "L", 4);
                    cell.CellValue = new CellValue(model.Quantity);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "L", 7);
                    cell.CellValue = new CellValue(model.OpenedPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "L", 10);
                    cell.CellValue = new CellValue(model.ClickedPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // Un-sub right
                    if (Template.Equals(ReportTemplate.Tracking3.ToString()))
                    {
                        cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "L", 13);
                        cell.CellValue = new CellValue(model.UnsubToOpenPercentage);
                        cell.DataType = new EnumValue<CellValues>(CellValues.String);
                    }

                    // key stats
                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 20);
                    cell.CellValue = new CellValue(model.Quantity);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 23);
                    cell.CellValue = new CellValue(model.OpenedPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "H", 23);
                    cell.CellValue = new CellValue(model.Opened);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 26);
                    cell.CellValue = new CellValue(model.ClickedPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "H", 26);
                    cell.CellValue = new CellValue(model.Clicked);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "L", 26);
                    cell.CellValue = new CellValue(model.ClickToOpenPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // Shared and Un-sub stats
                    if (Template.Equals(ReportTemplate.Tracking3.ToString()))
                    {
                        cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 29);
                        cell.CellValue = new CellValue("Forwards : " + model.Forwards);
                        cell.DataType = new EnumValue<CellValues>(CellValues.String);

                        cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 32);
                        cell.CellValue = new CellValue(model.UnsubPercentage);
                        cell.DataType = new EnumValue<CellValues>(CellValues.String);

                        cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "H", 32);
                        cell.CellValue = new CellValue(model.Unsub);
                        cell.DataType = new EnumValue<CellValues>(CellValues.String);

                        cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "L", 32);
                        cell.CellValue = new CellValue(model.UnsubToOpenPercentage);
                        cell.DataType = new EnumValue<CellValues>(CellValues.String);
                    }
                    #endregion

                    uint start = 36;
                    #region Second Page
                    if (Template.Equals(ReportTemplate.Tracking4.ToString()))
                    {
                        start = 67;

                        cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 36);
                        cell.CellValue = new CellValue(model.SubjectLine);
                        cell.DataType = new EnumValue<CellValues>(CellValues.String);

                        cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 37);
                        cell.CellValue = new CellValue(model.FromLine);
                        cell.DataType = new EnumValue<CellValues>(CellValues.String);

                        if (File.Exists(ScreenshotFilePath))
                            ExcelHelper.AddImage(worksheetPart, ScreenshotFilePath, 36, 5);
                    }
                    #endregion

                    #region Third Page
                    foreach (var vm in model.PerLink)
                    {
                        PopulateRowTemplate(worksheetPart.Worksheet, vm, start);
                        start++;
                    }

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "A", start);
                    cell.CellValue = new CellValue("Total:");
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "L", start);
                    cell.CellValue = new CellValue(model.Clicked);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    #endregion

                    worksheetPart.Worksheet.Save();
                    spreadSheet.Close();
                }
                File.WriteAllBytes(outputFilePath, stream.ToArray());
            }
        }

        public override void PopulateRowTemplate(Worksheet worksheet, CampaignTrackingDetailVm row, uint rowNumber)
        {
            Cell cell = ExcelHelper.GetCell(worksheet, "A", rowNumber);
            cell.CellValue = new CellValue(row.Link);
            cell.DataType = new EnumValue<CellValues>(CellValues.String);

            cell = ExcelHelper.GetCell(worksheet, "L", rowNumber);
            cell.CellValue = new CellValue(row.ClickCount);
            cell.DataType = new EnumValue<CellValues>(CellValues.String);
        }

    }
}