using System;
using System.Linq;
using System.Data.Entity;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Web.Models;
using PagedList;
using System.Collections.Generic;
using ADSDataDirect.Infrastructure.DataReports;

namespace ADSDataDirect.Web.Controllers
{
    [Authorize]
    public class CustomerController : BaseController
    {
        public ActionResult Index(CampaignSearchVm sc)
        {
            var customer = Db.Customers
                .Select(x =>
            new CustomerVm
            {
                Id = x.Id.ToString(),
                WhiteLabel = x.WhiteLabel,
                CompanyName = x.CompanyName,
                CompanyLogo = x.CompanyLogo,
                ReportTemplate = x.ReportTemplate,
                WebDomain = x.WebDomain,
                Phone = x.Phone,
                Email = x.Email,
                IsUseOpenModel = x.IsUseOpenModel,
                OpenInitial = x.OpenInitial,
                OpenEnd = x.OpenEnd,
                ClickInitial = x.ClickInitial,
                ClickEnd = x.ClickEnd,
                DateCreated = x.CreatedAt.ToString()
            }).ToList();

            string view = IsNxs ? "IndexNXS" : "Index";

            int pageNumber = (sc.Page ?? 1);
            var model = customer.ToPagedList(pageNumber, PageSize);
            return View(view, model);
        }

        public ActionResult New()
        {
            ViewBag.ReportTemplate = new SelectList(ReportTemplates, "Value", "Text");
            string view = IsNxs ? "NewNXS" : "New";
            return View(view);
        }

        [HttpPost]
        public ActionResult New(CustomerVm customerVm)
        {
            try
            {
                var customer = new Customer
                {
                    Id = Guid.NewGuid(),
                    CreatedAt = DateTime.Now,
                    CreatedBy = LoggedInUser.Id,
                    WhiteLabel = customerVm.WhiteLabel,
                    CompanyName = customerVm.CompanyName,
                    CompanyLogo = customerVm.CompanyLogo,
                    ReportTemplate = customerVm.ReportTemplate,
                    WebDomain = customerVm.WebDomain,
                    Email = customerVm.Email,
                    Phone = customerVm.Phone,
                    IsUseOpenModel = customerVm.IsUseOpenModel,
                    OpenInitial = customerVm.OpenInitial,
                    OpenEnd = customerVm.OpenEnd,
                    ClickInitial = customerVm.ClickInitial,
                    ClickEnd = customerVm.ClickEnd
                };
                Db.Customers.Add(customer);
                Db.SaveChanges();

                SetForceCustomers(true);

                TempData["Success"] = "New White Label has been added successfully!";
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
            var x = Db.Customers.Find(id);
            if (x == null)
            {
                throw new HttpException(404, "Not found");
            }
            var customerVm = new CustomerVm
            {
                Id = x.Id.ToString(),
                WhiteLabel = x.WhiteLabel,
                CompanyName = x.CompanyName,
                CompanyLogo = x.CompanyLogo,
                ReportTemplate = x.ReportTemplate,
                WebDomain = x.WebDomain,
                Email = x.Email,
                Phone = x.Phone,
                IsUseOpenModel = x.IsUseOpenModel,
                OpenInitial = x.OpenInitial,
                OpenEnd = x.OpenEnd,
                ClickInitial = x.ClickInitial,
                ClickEnd = x.ClickEnd,
                DateCreated = x.CreatedAt.ToString()
            };
            ViewBag.ReportTemplate = new SelectList(ReportTemplates, "Value", "Text", customerVm.ReportTemplate);

            string view = IsNxs ? "NewNXS" : "New";
            return View(view, customerVm);
        }

        [HttpPost]
        public ActionResult Edit(CustomerVm customerVm)
        {
            try
            {
                var customer = Db.Customers.Find(Guid.Parse(customerVm.Id));
                if (customer != null)
                {
                    customer.WhiteLabel = customerVm.WhiteLabel;
                    customer.CompanyName = customerVm.CompanyName;
                    customer.CompanyLogo = customerVm.CompanyLogo;
                    customer.ReportTemplate = customerVm.ReportTemplate;
                    customer.WebDomain = customerVm.WebDomain;
                    customer.Email = customerVm.Email;
                    customer.Phone = customerVm.Phone;
                    customer.IsUseOpenModel = customerVm.IsUseOpenModel;
                    customer.OpenInitial = customerVm.OpenInitial;
                    customer.OpenEnd = customerVm.OpenEnd;
                    customer.ClickInitial = customerVm.ClickInitial;
                    customer.ClickEnd = customerVm.ClickEnd;
                }
                Db.SaveChanges();
                TempData["Success"] = "White Label settings has been updated successfully!";

                SetForceCustomers(true);
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
                var customer = Db.Customers.Find(id);
                if (customer != null)
                {
                    Db.Customers.Remove(customer);
                    Db.SaveChanges();
                    SetForceCustomers(true);
                }
                return Json(new JsonResponse() { IsSucess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message },
                    JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult DownloadOrdersStatus(Guid? id)
        {
            try
            {
                var customer = Db.Customers.Find(id);
                if (customer == null)
                {
                    TempData["Error"] = "White label not found.";
                    return RedirectToAction("Index", "Customer");
                }

                if (string.IsNullOrEmpty(customer.WhiteLabel))
                {
                    TempData["Error"] = "Customer White label is not set.";
                    return RedirectToAction("Index", "Customer");
                }

                List<Campaign> campaigns = Db.Campaigns
                .Include(x => x.Assets)
                .Include(x => x.Segments)
                .Include(x => x.ProDatas)
                .Include(x => x.Testing)
                .Include(x => x.Approved)
                .Include(x => x.Trackings)
                .Where(x => x.Approved != null && x.Approved.WhiteLabel == customer.WhiteLabel)
                .ToList();

                CustomerOrdersStatusReports.Generate(Response, customer.WhiteLabel, campaigns);

                return null;
            }
            catch (Exception ex)
            {
                return Json(new JsonResponse() { IsSucess = false, ErrorMessage = ex.Message },
                    JsonRequestBehavior.AllowGet);
            }
        }
    }
}