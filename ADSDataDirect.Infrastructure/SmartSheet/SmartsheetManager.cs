using ADSDataDirect.Core.Entities;
using ADSDataDirect.Enums;
using Smartsheet.Api;
using Smartsheet.Api.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;

namespace ADSDataDirect.Infrastructure.Smartsheet
{
    public class SmartsheetManager
    {
        readonly WfpictContext Db;
        public SmartsheetManager(WfpictContext db)
        {
            Db = db;
        }

        private static Dictionary<string, SheetMap> sheetMaps = new Dictionary<string, SheetMap>();
        private static SmartsheetClient GetClient()
        {
            // Initialize client
            SmartsheetClient client = new SmartsheetBuilder()
                // TODO: Set your API access in environment variable SMARTSHEET_ACCESS_TOKEN or else here
                .SetAccessToken(ConfigurationManager.AppSettings["SmartsheetApiKey"])
                .Build();
            return client;
        }

        public PaginatedResult<Sheet> GetSheets()
        {
            // List all sheets
            PaginatedResult<Sheet> sheets = GetClient().SheetResources.ListSheets(
                null,               // IEnumerable<SheetInclusion> includes
                null,               // PaginationParameters
                null                // Nullable<DateTime> modifiedSince = null
            );
            Console.WriteLine("Found " + sheets.TotalCount + " sheets");
            return sheets;
        }

        public List<string> GetSheetNames()
        {
            return GetSheets().Data.Select(x => x.Name).ToList();
        }

        public void LoadSheetMaps()
        {
            sheetMaps.Clear();
            foreach (var sheet in GetSheets().Data)
            {
                Console.WriteLine("Loading sheet id: " + sheet.Id);

                // Load the entire sheet
                var entireSheet = GetClient().SheetResources.GetSheet(
                    sheet.Id.Value, //5670346721388420,           // long sheetId
                    null,                       // IEnumerable<SheetLevelInclusion> includes
                    null,                       // IEnumerable<SheetLevelExclusion> excludes
                    null,                       // IEnumerable<long> rowIds
                    null,                       // IEnumerable<int> rowNumbers
                    null,                       // IEnumerable<long> columnIds
                    null,                       // Nullable<long> pageSize
                    null                        // Nullable<long> page
                );
                Console.WriteLine("Loaded " + entireSheet.Rows.Count + " rows from sheet: " + entireSheet.Name);

                Dictionary<string, long> columnMap = new Dictionary<string, long>();
                foreach (Column column in entireSheet.Columns)
                    columnMap.Add(column.Title, (long)column.Id);

                sheetMaps.Add(sheet.Name, new SheetMap() { Sheet = entireSheet, ColumnMap = columnMap });
            }
        }
        
        public List<Campaign> Read(string sheetName)
        {
            List<Campaign> campaigns = new List<Campaign>();
            var camps = Db.Campaigns.ToList();
            int newOrderNumber = camps.Count > 0
                ? camps.Max(x => int.Parse(x.OrderNumber.TrimEnd("RDP".ToCharArray()))) + 1
                : 2500;

            var sheetMap = sheetMaps[sheetName];

            foreach (var row in sheetMap.Sheet.Rows)
            {
                Campaign campaign = null;

                switch (sheetName)
                {
                    case "ADS Verum Customers":
                        campaign = ReadRow1(row, sheetMap);
                        break;
                    case "ADS Verum Advantage":
                        campaign = ReadRow2(row, sheetMap);
                        break;
                }

                if (campaign == null)
                    continue;

                campaign.OrderNumber = newOrderNumber.ToString();
                newOrderNumber++;
                campaigns.Add(campaign);
            }
            return campaigns;
        }

        private Campaign ReadRow1(Row row, SheetMap sheetMap)
        {
            // Ignore alreay imported
            string IONumber = sheetMap.GetCellByColumnName(row, "IO#").DisplayValue;
            if (!string.IsNullOrEmpty(IONumber))
                return null;

            var campaign = new Campaign();
            campaign.Price = row.Id.Value; // Just re-using Price feild, in fact it should be rowId long
            campaign.Id = Guid.NewGuid();
            campaign.CreatedAt = DateTime.Now;
            campaign.CreatedBy = "Smartsheet";
            campaign.Status = (int)CampaignStatus.OrderRecevied;
            campaign.WhiteLabel = sheetMap.GetCellByColumnName(row, "White Label").DisplayValue;
            campaign.CampaignName = sheetMap.GetCellByColumnName(row, "Campaign Name").DisplayValue;
            campaign.BroadcastDate = sheetMap.GetCellByColumnName(row, "Broadcast Date").Value.ToSafeDateTime();
            campaign.RepresentativeName = sheetMap.GetCellByColumnName(row, "Production Rep").DisplayValue;
            campaign.RepresentativeEmail = sheetMap.GetCellByColumnName(row, "Production Rep").DisplayValue;

            campaign.Quantity = sheetMap.GetCellByColumnName(row, "QTY").DisplayValue.ToSafeInt();
            campaign.GeoDetails = sheetMap.GetCellByColumnName(row, "GEO").DisplayValue;
            campaign.Demographics = sheetMap.GetCellByColumnName(row, "Demo").DisplayValue;
            campaign.FromLine = sheetMap.GetCellByColumnName(row, "From Line").DisplayValue;
            campaign.SubjectLine = sheetMap.GetCellByColumnName(row, "Subject Line").DisplayValue;
            campaign.SpecialInstructions = sheetMap.GetCellByColumnName(row, "Special Instructions").DisplayValue;
            campaign.IsPersonalization = sheetMap.GetCellByColumnName(row, "Personalization").Value.ToSafeBoolean();
            campaign.IsSuppression = sheetMap.GetCellByColumnName(row, "Suppression").Value.ToSafeBoolean();
            campaign.Assets = new CampaignAsset();

            campaign.Assets.Id = Guid.NewGuid();
            campaign.Assets.CampaignId = campaign.Id;
            campaign.Assets.CreatedAt = DateTime.Now;
            campaign.Assets.CreatedBy = "Smartsheet";

            return campaign;
        }

        private Campaign ReadRow2(Row row, SheetMap sheetMap)
        {
            // Ignore alreay imported
            string IONumber = sheetMap.GetCellByColumnName(row, "ID#Verum").DisplayValue;
            if (!string.IsNullOrEmpty(IONumber))
                return null;

            var campaign = new Campaign();
            campaign.Price = row.Id.Value; // Just re-using Price feild, in fact it should be rowId long
            campaign.Id = Guid.NewGuid();
            campaign.CreatedAt = DateTime.Now;
            campaign.CreatedBy = "Smartsheet";
            campaign.Status = (int)CampaignStatus.OrderRecevied;
            campaign.WhiteLabel = StringConstants.CustomerAdvantage;
            campaign.CampaignName = sheetMap.GetCellByColumnName(row, "Campaign Name").DisplayValue;
            campaign.BroadcastDate = sheetMap.GetCellByColumnName(row, "Broadcast Date").Value.ToSafeDateTime();
            campaign.RepresentativeName = sheetMap.GetCellByColumnName(row, "Account Manager").DisplayValue;
            campaign.RepresentativeEmail = sheetMap.GetCellByColumnName(row, "Account Manager").DisplayValue;
            campaign.Quantity = sheetMap.GetCellByColumnName(row, "Broadcast Quantity").DisplayValue.ToSafeInt();
            campaign.GeoDetails = sheetMap.GetCellByColumnName(row, "ZIP/Geo").DisplayValue;
            campaign.FromLine = sheetMap.GetCellByColumnName(row, "From Line").Value.ToSafeString();
            campaign.SubjectLine = sheetMap.GetCellByColumnName(row, "Subject Line").DisplayValue;
            campaign.SpecialInstructions = sheetMap.GetCellByColumnName(row, "Schedule / Special Instructions").DisplayValue;
            campaign.Assets = new CampaignAsset();

            campaign.Assets.Id = Guid.NewGuid();
            campaign.Assets.CampaignId = campaign.Id;
            campaign.Assets.CreatedAt = DateTime.Now;
            campaign.Assets.CreatedBy = "Smartsheet";

            return campaign;
        }

        public bool Update(string sheetName, long rowId, string IONumber)
        {
            var sheetMap = sheetMaps[sheetName];

            var rowToUpdate = sheetMap.GetRowById(rowId);
            if (rowToUpdate == null) return false;

            Cell[] cellsToUpdate = null;

            switch (sheetName)
            {
                case "ADS Verum Customers":
                    cellsToUpdate = new Cell[] {
                            new Cell.UpdateCellBuilder(sheetMap.ColumnMap["IO#"],IONumber).Build(),
                            new Cell.UpdateCellBuilder(sheetMap.ColumnMap["Sent to Verum"],"Yes").Build(),
                            };
                    break;
                case "ADS Verum Advantage":
                    cellsToUpdate = new Cell[] {
                            new Cell.UpdateCellBuilder(sheetMap.ColumnMap["ID#Verum"],IONumber).Build(),
                            new Cell.UpdateCellBuilder(sheetMap.ColumnMap["Sent to Verum"],"Yes").Build(),
                            };
                    break;
            }

            Row rowBeingUpdated = new Row.UpdateRowBuilder(rowToUpdate.Id).SetCells(cellsToUpdate).Build();
            IList<Row> updatedRows = GetClient().SheetResources.RowResources
                                                .UpdateRows(sheetMap.Sheet.Id.Value,new Row[] { rowBeingUpdated });
            return updatedRows.Count > 0;
        }
    }
}