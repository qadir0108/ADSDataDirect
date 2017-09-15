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
    public class CustomerController : BaseController
    {
        public ActionResult Index(CampaignSearchVm sc)
        {
            var customer = Db.Customers.Select(x =>
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
                DateCreated = x.CreatedAt.ToString()
            }).ToList();

            int pageNumber = (sc.Page ?? 1);
            var model = customer.ToPagedList(pageNumber, PageSize);
            return View(model);
        }

        public ActionResult New()
        {
            ViewBag.ReportTemplate = new SelectList(ReportTemplates, "Value", "Text");
            return View();
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
                };
                Db.Customers.Add(customer);
                Db.SaveChanges();

                ForceCustomers = true;

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
                DateCreated = x.CreatedAt.ToString()
            };
            ViewBag.ReportTemplate = new SelectList(ReportTemplates, "Value", "Text", customerVm.ReportTemplate);
            return View("New", customerVm);
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
                }
                Db.SaveChanges();
                TempData["Success"] = "White Label settings has been updated successfully!";

                ForceCustomers = true;
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
                    ForceCustomers = true;
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