using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class ThucDonController : Controller
    {
        // GET: ThucDon
        projectEntities db = new projectEntities();
        public ActionResult Index(int id = 1)
        {
            var menusession = new MenuView();
            var Menu = db.menus.SingleOrDefault(x => x.id == id);
            menusession.menuName = Menu.name;
            menusession.image = Menu.image;
            Session.Add("MENUSESSION",menusession);
            return View();
        }
        public PartialViewResult FoodInMenuPartial(int id = 1)
        {
            var model = from f in db.foods
                        join md in db.menu_detail
                        on f.id equals md.id_food
                        join m in db.menus
                        on md.id_menu equals m.id
                        where md.id_menu == id
                        select new MenuView()
                        {
                            menuName = m.name,
                            image = m.image,
                            foodName = f.name,
                            price = f.price,
                            sumary = f.summary,
                            id = m.id
                        };
            var listfoodinmenu = model.ToList();
            return PartialView(listfoodinmenu);
        }
        public PartialViewResult MenuPartial()
        {
            var listmenu = db.menus.ToList();
            return PartialView(listmenu);
        }
    }
}