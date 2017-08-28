using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using WFP.ICT.Data.Entities;
using WFP.ICT.Web.Helpers;
using WFP.ICT.Web.Models;
using PagedList;
using WFP.ICT.Enum;

namespace WFP.ICT.Web.Controllers
{
    [Authorize]
    public class CustomerController : BaseController
    {
        private const int PageSize = 15;
        public ActionResult Index(CampaignSearchVM sc)
        {
            var customer = Db.Customers.Select(x =>
            new CustomerVm
            {
                Id = x.Id.ToString(),
                Code = x.Code,
                Name = x.Name,
                WebDomain = x.WebDomain,
                Phone = x.Phone,
                Email = x.Email,
                DateCreated = x.CreatedAt.ToString()
            }).ToList();

            int pageNumber = (sc.page ?? 1);
            var model = customer.ToPagedList(pageNumber, PageSize);
            return View(model);
        }

        public ActionResult New()
        {
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
                    Code = customerVm.Code,
                    Name = customerVm.Name,
                    Email = customerVm.Email,
                    Phone = customerVm.Phone,
                    WebDomain = customerVm.WebDomain,
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
            var vendor = new CustomerVm
            {
                Id = x.Id.ToString(),
                Code = x.Code,
                Name = x.Name,
                Email = x.Email,
                Phone = x.Phone,
                WebDomain = x.WebDomain,
                DateCreated = x.CreatedAt.ToString()
            };

            return View("New", vendor);
        }

        [HttpPost]
        public ActionResult Edit(CustomerVm customerVm)
        {
            try
            {
                var customer = Db.Customers.Find(Guid.Parse(customerVm.Id));
                if (customer != null)
                {
                    customer.Code = customerVm.Code;
                    customer.Name = customerVm.Name;
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