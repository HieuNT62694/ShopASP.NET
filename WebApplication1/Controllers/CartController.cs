using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
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
    }
}