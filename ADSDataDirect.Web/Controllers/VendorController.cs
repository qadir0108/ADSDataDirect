using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Web.Models;
using PagedList;

namespace ADSDataDirect.Web.Controllers
{
    [Authorize]
    public class VendorController : BaseController
    {
        public ActionResult Index(CampaignSearchVm sc)
        {
            var vendors = Db.Vendors.Select(x =>
            new VendorVm
            {
                Id = x.Id.ToString(),
                Name = x.Name,
                CompanyName = x.CompanyName,
                Phone = x.Phone,
                Email = x.Email,
                CcEmails = x.CcEmails,
                DateCreated = x.CreatedAt.ToString()
            }).ToList();

            int pageNumber = (sc.Page ?? 1);
            var model = vendors.ToPagedList(pageNumber, PageSize);
            return View(model);
        }

        public ActionResult New()
        {
            return View();
        }

        [HttpPost]
        public ActionResult New(VendorVm vendorVm)
        {
            try
            {
                var vendor = new Vendor()
                {
                    Id = Guid.NewGuid(),
                    CreatedAt = DateTime.Now,
                    CreatedBy = LoggedInUser.Id,
                    Name = vendorVm.Name,
                    CompanyName = vendorVm.CompanyName,
                    Email = vendorVm.Email,
                    CcEmails = vendorVm.CcEmails,
                    Phone = vendorVm.Phone,
                };
                Db.Vendors.Add(vendor);
                Db.SaveChanges();

                ForceVendors = true;

                TempData["Success"] = "Vendor settings has been added successfully!";
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                //
            }
            return View("Error");
        }

        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                throw new HttpException(400, "Bad Request");
            }
            var x = Db.Vendors.Find(id);
            if (x == null)
            {
                throw new HttpException(404, "Not found");
            }
            var vendor = new VendorVm
            {
                Id = x.Id.ToString(),
                Name = x.Name,
                CompanyName = x.CompanyName,
                Email = x.Email,
                CcEmails = x.CcEmails,
                Phone = x.Phone,
                DateCreated = x.CreatedAt.ToString()
            };

            return View("New", vendor);
        }

        [HttpPost]
        public ActionResult Edit(VendorVm vendorVm)
        {
            try
            {
                var vendor = Db.Vendors.Find(Guid.Parse(vendorVm.Id));
                if (vendor != null)
                {
                    vendor.Name = vendorVm.Name;
                    vendor.CompanyName = vendorVm.CompanyName;
                    vendor.Email = vendorVm.Email;
                    vendor.Phone = vendorVm.Phone;
                    vendor.CcEmails = vendorVm.CcEmails;
                }
                Db.SaveChanges();
                TempData["Success"] = "Vendor settings has been updated successfully!";

                ForceVendors = true;
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                // ignored
            }
            return View("Error");
        }

        public ActionResult Delete(Guid? id)
        {
            try
            {
                var vendor = Db.Vendors.Find(id);
                if (vendor != null)
                {
                    Db.Vendors.Remove(vendor);
                    Db.SaveChanges();
                    ForceVendors = true;
                }
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message },
                    JsonRequestBehavior.AllowGet);
            }
        }
    }
}