using System;

namespace WFP.ICT.Web.Models
{
    public class InventoryItemVM
    {
        public Guid ID { get; set; }
        public int Code { get; set; }

        public string Name { get; set; }
        public string NameInventoryNumber
        {
            get
            {
                return Name + " - " + InventoryNumber;
            }
        }
        public string Description { get; set; }
        public string Make { get; set; }
        public string PalateSize { get; set; }

        public Guid? InventoryItemTypeID { get; set; }

        public string EquipmentNumber { get; set; }
        public string InventoryNumber { get; set; }
        public string SerialNumber { get; set; }
        public string PurchaseOrderNumber { get; set; }
        public string AcquistionDate { get; set; }
        public string AcquistionValue { get; set; }

        public Guid? OfficeID { get; set; }
        public string Location { get; set; }
        public string AssignedTo { get; set; }
    }
}