using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
using PagedList;
namespace WebApplication1.Controllers
{
    public class SearchPageController : Controller
    {
        // GET: SearchPage
        projectEntities db = new projectEntities();
        public ActionResult Index(string searchString,int page = 1, int pagesize = 9)
        {
            var listFood = listAllPaging(searchString,page, pagesize);
            ViewBag.SearchString = searchString;
            return View(listFood);
        }
        public IEnumerable<food> listAllPaging(string searchString,int page, int pagesize)
        {
            IQueryable<food> model = db.foods;
            if (!String.IsNullOrEmpty(searchString))
            {
                model = db.foods.Where(x => x.name.Contains(searchString) || x.summary.Contains(searchString));
            }
            return model.OrderByDescending(x=>x.id).ToPagedList(page, pagesize);
        }
    }
}