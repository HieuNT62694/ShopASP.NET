using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class CartController : Controller
    {
        projectEntities db = new projectEntities();
        private const string CartSession = "CartSession"; 
        // GET: Cart
        public ActionResult Index()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart!=null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }
        public JsonResult DeleteAll(string cartModel)
        {
            Session[CartSession] = null;
            return Json(new
            {
                status = true
            });
        }
        public JsonResult Update(string cartModel)
        {
            var jsoncart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessioncart = (List<CartItem>)Session[CartSession];
            foreach(var item in sessioncart)
            {
                var jsonitem = jsoncart.SingleOrDefault(x => x.food.id == item.food.id);
                if (jsonitem !=null)
                {
                    item.quantity = jsonitem.quantity;
                }
            }
            return Json(new
            {
                status = true
            });
        }
        public ActionResult Remove(int id)
        {
            
            food foods = db.foods.SingleOrDefault(x => x.id == id);
            var sessioncart = (List<CartItem>)Session[CartSession];
            var foodincart = sessioncart.SingleOrDefault(x => x.food.id == id);
            if (foodincart !=null)
            {
                sessioncart.RemoveAll(x => x.food.id == id);
            }
            //var jsoncart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            //var sessioncart = (List<CartItem>)Session[CartSession];
            //foreach (var item in sessioncart)
            //{
            //    var jsonitem = jsoncart.SingleOrDefault(x => x.food.id == item.food.id);
            //    if (jsonitem!=null)
            //    {
            //        sessioncart.RemoveAll(x => x.food.id == jsonitem.food.id);
            //    }

            //}
            //return Json(new
            //{
            //    status = true
            //});
            return RedirectToAction("Index");
        }
        public ActionResult AddItem(int id,int quantity)
        {
            var fooddetail = db.foods.Where(x => x.id == id).SingleOrDefault();
            var cart = Session[CartSession];
            if (cart != null)
            {
                var list = (List<CartItem>)cart;
                if (list.Exists(x=>x.food.id == id))
                {
                    foreach (var item in list)
                    {
                        if (item.food.id == id)
                        {
                            item.quantity += quantity;
                        }
                    }
                }
                else
                {
                    //tạo mới đối tượng cart item
                    var item = new CartItem();
                    item.food = fooddetail;
                    item.quantity = quantity;
                    list.Add(item);
                }

            }
            else
            {
                //tạo mới đối tượng cart item
                var item = new CartItem();
                item.food = fooddetail;
                item.quantity = quantity;
                var list = new List<CartItem>();
                list.Add(item);
                Session[CartSession] = list;
            }
            return RedirectToAction("Index");
        }
        //public ActionResult getAllIdFoodInMenu(int id)
        //{
        //    var id = db.
        //}
        //public ActionResult AddAllFoodInMenu(int id, int quantity)
        //{
        //    var menu = from f in db.foods
        //                           join md in db.menu_detail
        //                           on f.id equals md.id_food
        //                           join m in db.menus
        //                           on md.id_menu equals m.id
        //                           where md.id_menu == id
        //                           select new MenuView()
        //                           {
        //                               menuName = m.name,
        //                               image = m.image,
        //                               foodName = f.name,
        //                               price = f.price,
        //                               sumary = f.summary,
        //                               id = m.id
        //                           };
        //    var fooddetail = menu.SingleOrDefault();
        //    var cart = Session[CartSession];
        //    if (cart != null)
        //    {
        //        var list = (List<CartItem>)cart;
        //        if (list.Exists(x => x.food.id == id))
        //        {
        //            foreach (var item in list)
        //            {
        //                if (item.food.id == id)
        //                {
        //                    item.quantity += quantity;
        //                }
        //            }
        //        }
        //        else
        //        {
        //            //tạo mới đối tượng cart item
        //            var item = new CartItem();
        //            item.food = fooddetail;
        //            item.quantity = quantity;
        //            list.Add(item);
        //        }

        //    }
        //    else
        //    {
        //        //tạo mới đối tượng cart item
        //        var item = new CartItem();
        //        item.food = fooddetail;
        //        item.quantity = quantity;
        //        var list = new List<CartItem>();
        //        list.Add(item);
        //        Session[CartSession] = list;
        //    }
        //    return RedirectToAction("Index");
        //}
    }
}