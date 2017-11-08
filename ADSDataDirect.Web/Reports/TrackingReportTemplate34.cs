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

                    ExcelHelper.AddImage(worksheetPart, LogoResized, 6, 1);

                    Cell cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "L", 2);
                    cell.CellValue = new CellValue(DateTime.Now.ToString(StringConstants.DateFormatDashes));
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

                    if(!model.IoNumber.EndsWith("RDP"))
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
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // key stats
                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 23);
                    cell.CellValue = new CellValue(model.Quantity);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "H", 26);
                    cell.CellValue = new CellValue(model.Opened);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "H", 29);
                    cell.CellValue = new CellValue(model.Clicked);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // Shared and Un-sub stats
                    if (Template.Equals(ReportTemplate.Tracking3.ToString()))
                    {
                        cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 32);
                        cell.CellValue = new CellValue("Forwards : " + model.Forwards);
                        cell.DataType = new EnumValue<CellValues>(CellValues.String);

                        cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "H", 35);
                        cell.CellValue = new CellValue(model.Unsub);
                        cell.DataType = new EnumValue<CellValues>(CellValues.String);
                    }
                    #endregion

                    uint start = 39;
                    #region Second Page
                    if (Template.Equals(ReportTemplate.Tracking4.ToString()))
                    {
                        start = 70;

                        cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 39);
                        cell.CellValue = new CellValue(model.SubjectLine);
                        cell.DataType = new EnumValue<CellValues>(CellValues.String);

                        cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 40);
                        cell.CellValue = new CellValue(model.FromLine);
                        cell.DataType = new EnumValue<CellValues>(CellValues.String);

                        if (File.Exists(ScreenshotFilePath))
                            ExcelHelper.AddImage(worksheetPart, ScreenshotFilePath, 41, 5);
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
                    cell.DataType = new EnumValue<CellValues>(CellValues.Number);

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
            cell.DataType = new EnumValue<CellValues>(CellValues.Number);
        }

    }
}