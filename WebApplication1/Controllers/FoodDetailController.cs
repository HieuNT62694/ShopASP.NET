using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
namespace WebApplication1.Controllers
{
    public class FoodDetailController : Controller
    {
        // GET: FoodDetail
        project2Entities db = new project2Entities();
        public ActionResult Index(int id)
        {
            var fooddetail = db.foods.Where(x => x.id == id).ToList();
            return View(fooddetail);
        }
        public PartialViewResult FoodTypePartial(int idtype) 
        {
            var foodintype = db.foods.Where(x => x.id_type == idtype).Take(3).ToList();
            return PartialView(foodintype);
        }
    }
}