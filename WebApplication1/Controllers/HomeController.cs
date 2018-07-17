using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
using PagedList;


namespace WebApplication1.Controllers
{
    public class HomeController : Controller
    {
        project2Entities db = new project2Entities();
        public ActionResult Index(int page = 1,int pagesize = 6)
        {

            var listFood = listAllPaging(page, pagesize);
            return View(listFood);
        }
        public IEnumerable<food> listAllPaging(int page , int pagesize)
        {
            return db.foods.OrderByDescending(x=>x.id).ToPagedList(page,pagesize);
        }
        public PartialViewResult FoodToDayPartial()
        {
            var listfoodtoday = db.foods.Where(n => n.today == 1).ToList();
            return PartialView(listfoodtoday);
        }



    }
}