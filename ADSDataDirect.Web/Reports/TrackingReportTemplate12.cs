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
    public class TrackingReportTemplate12 : BaseTrackingReport, ITrackingReport 
    {
        public TrackingReportTemplate12(string reportTemplate, string customerName, string companyLogo, string screenshotFilePath) 
            : base(reportTemplate, customerName, companyLogo, screenshotFilePath)
        {
            LogoWidth = 650;
            LogoHeight = 116;
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
                    ExcelHelper.AddImage(worksheetPart, LogoResized, 68, 1);

                    Cell cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "J", 8);
                    cell.CellValue = new CellValue(model.OrderNumber);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "J", 9);
                    cell.CellValue = new CellValue(model.StartDate);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "J", 10);
                    cell.CellValue = new CellValue(DateTime.Now.ToString(StringConstants.DateFormatSlashes));
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "B", 8);
                    cell.CellValue = new CellValue(model.CampaignName);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // send / delviery
                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 14);
                    cell.CellValue = new CellValue(model.DeliveryPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 15);
                    cell.CellValue = new CellValue(model.Deployed);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 16);
                    cell.CellValue = new CellValue(model.Quantity);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // opened
                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 22);
                    cell.CellValue = new CellValue(model.OpenedPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 23);
                    cell.CellValue = new CellValue(model.Opened);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // clicks
                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "A", 26);
                    cell.CellValue = new CellValue(model.Clicked);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "B", 26);
                    cell.CellValue = new CellValue(model.ClickedPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 26);
                    cell.CellValue = new CellValue(model.ClickToOpenPercentage);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // bounce & opt
                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "A", 29);
                    cell.CellValue = new CellValue(model.Bounce);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "B", 29);
                    cell.CellValue = new CellValue(model.Opt);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // desktop & mobile
                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 37);
                    cell.CellValue = new CellValue(model.Desktop);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "C", 38);
                    cell.CellValue = new CellValue(model.Mobile);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // desktop & mobile
                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "H", 14);
                    cell.CellValue = new CellValue(model.SubjectLine);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "H", 15);
                    cell.CellValue = new CellValue(model.FromLine);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    // Data Files
                    if (Template.Equals(ReportTemplate.Tracking1.ToString()) && !model.IoNumber.EndsWith("RDP"))
                    {
                        uint rowNumber = 43;
                        foreach (var segment in model.Segments)
                        {
                            cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "A", rowNumber);
                            cell.CellValue = new CellValue(segment.SegmentNumber);
                            cell.DataType = new EnumValue<CellValues>(CellValues.String);

                            cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "B", rowNumber);
                            cell.CellValue = new CellValue(segment.SegmentDataFileUrl);
                            cell.DataType = new EnumValue<CellValues>(CellValues.String);
                            rowNumber++;
                        }
                    }
                    
                    #endregion

                    #region Second Page

                    if (File.Exists(ScreenshotFilePath))
                        ExcelHelper.AddImage(worksheetPart, ScreenshotFilePath, 17, 7);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "B", 73);
                    cell.CellValue = new CellValue(model.CampaignName);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "J", 73);
                    cell.CellValue = new CellValue(model.OrderNumber);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "J", 74);
                    cell.CellValue = new CellValue(model.StartDate);
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    cell = ExcelHelper.GetCell(worksheetPart.Worksheet, "J", 75);
                    cell.CellValue = new CellValue(DateTime.Now.ToString(StringConstants.DateFormatSlashes));
                    cell.DataType = new EnumValue<CellValues>(CellValues.String);

                    uint start = 82;
                    int total = 117;
                    foreach (var vm in model.PerLink)
                    {
                        PopulateRowTemplate(worksheetPart.Worksheet, vm, start);
                        start++;
                    }

                    #endregion

                    ExcelHelper.DeleteRows(start, total - (int)start, worksheetPart.Worksheet.GetFirstChild<SheetData>());

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

            cell = ExcelHelper.GetCell(worksheet, "F", rowNumber);
            cell.CellValue = new CellValue(row.ClickCount);
            cell.DataType = new EnumValue<CellValues>(CellValues.String);

            cell = ExcelHelper.GetCell(worksheet, "G", rowNumber);
            cell.CellValue = new CellValue(row.UniqueCount);
            cell.DataType = new EnumValue<CellValues>(CellValues.String);

            cell = ExcelHelper.GetCell(worksheet, "H", rowNumber);
            cell.CellValue = new CellValue(row.MobileCount);
            cell.DataType = new EnumValue<CellValues>(CellValues.String);
        }

    }
}