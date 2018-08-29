using System;
using System.Linq;
using System.Data.Entity;
using System.Web;
using System.Web.Mvc;
using ADSDataDirect.Core.Entities;
using ADSDataDirect.Web.Models;
using PagedList;

namespace ADSDataDirect.Web.Controllers
{
    [Authorize]
    public class KeywordController : BaseController
    {
        public ActionResult Index(CampaignSearchVm sc)
        {
            var keywords = Db.OpenModelKeywords
                .OrderBy(x => x.CreatedAt)
                .Select(x =>
            new KeywordVm
            {
                Id = x.Id.ToString(),
                Keyword = x.Keyword,
                RulePercentage = x.RulePercentage,
                DateCreated = x.CreatedAt.ToString()
            }).ToList();

            int pageNumber = (sc.Page ?? 1);
            var model = keywords.ToPagedList(pageNumber, PageSize);

            int index = 1;
            foreach (var m in model)
            {
                m.Index = index++;
            }
            return View(model);
        }

        public ActionResult New()
        {
            ViewBag.ReportTemplate = new SelectList(ReportTemplates, "Value", "Text");
            return View();
        }

        [HttpPost]
        public ActionResult New(KeywordVm vm)
        {
            try
            {
                var keyword = new OpenModelKeyword
                {
                    Id = Guid.NewGuid(),
                    CreatedAt = DateTime.Now,
                    CreatedBy = LoggedInUser.Id,
                    Keyword = vm.Keyword,
                    RulePercentage = vm.RulePercentage,
                };
                Db.OpenModelKeywords.Add(keyword);
                Db.SaveChanges();

                //SetForceCustomers(true);

                TempData["Success"] = "New Keyword has been added successfully!";
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
            var x = Db.OpenModelKeywords.Find(id);
            if (x == null)
            {
                throw new HttpException(404, "Not found");
            }
            var vm = new KeywordVm
            {
                Id = x.Id.ToString(),
                Keyword = x.Keyword,
                RulePercentage  = x.RulePercentage,
                DateCreated = x.CreatedAt.ToString()
            };
            //ViewBag.ReportTemplate = new SelectList(ReportTemplates, "Value", "Text", customerVm.ReportTemplate);
            return View("New", vm);
        }

        [HttpPost]
        public ActionResult Edit(KeywordVm vm)
        {
            try
            {
                var keyword = Db.OpenModelKeywords.Find(Guid.Parse(vm.Id));
                if (keyword != null)
                {
                    keyword.Keyword = vm.Keyword;
                    keyword.RulePercentage = vm.RulePercentage;
                }
                Db.SaveChanges();
                TempData["Success"] = "Keyword has been updated successfully!";

                //SetForceCustomers(true);
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
                var keyword = Db.OpenModelKeywords.Find(id);
                if (keyword != null)
                {
                    Db.OpenModelKeywords.Remove(keyword);
                    Db.SaveChanges();
                    //SetForceCustomers(true);
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