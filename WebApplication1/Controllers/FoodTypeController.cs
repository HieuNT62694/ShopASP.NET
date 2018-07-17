using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class FoodTypeController : Controller
    {
        // GET: FoodType
        project2Entities db = new project2Entities();
        public ActionResult Index()
        {
            var lisfoodtype = db.food_type.ToList();
            return View(lisfoodtype);
        }
        public PartialViewResult TypeFoodPartial(int id = 1)
        {
            var model = from f in db.foods
                        join ft in db.food_type
                        on f.id_type equals ft.id
                        where f.id_type == id
                        select new FoodTypeView()
                        {
                            typeName = ft.name,
                            typeid = ft.id,
                            foodName = f.name,
                            image = f.image,
                            price = f.price,
                            sumary = f.summary,
                            id = f.id
                        };
            var listfoodtype = model.ToList();
            return PartialView(listfoodtype);
        }
    }
}