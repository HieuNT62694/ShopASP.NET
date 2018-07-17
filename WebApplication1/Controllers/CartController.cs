using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using WebApplication1.Models;
using WebApplication1.Models.DAO;

namespace WebApplication1.Controllers
{
    public class CartController : Controller
    {
        project2Entities db = new project2Entities();
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
        public JsonResult Remove(int id)
        {
            
            var sessioncart = (List<CartItem>)Session[CartSession];
                sessioncart.RemoveAll(x => x.food.id == id);
            Session[CartSession] = sessioncart;
            return Json(new
            {
                status = true
            });
            
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

        public ActionResult Payment(string fullname,string email,string address,string phone,string message)
        {
            var customer = new customer();
            customer.name = fullname;
            customer.email = email;
            customer.address = address;
            customer.phone = phone;
            customer.note = message;

            try
            {
                var cart = (List<CartItem>)Session[CartSession];
                var id = new CustomerDAO().Insert(customer);
                var bills = new bill();
                bills.id_customer = id;
                bills.date_order = DateTime.Now;
                double total = 0;
                foreach (var item in cart)
                {
                    total =total + (item.food.price * item.quantity);
                }
                bills.total = total;
                bills.note = message;
                bills.payment_method = "Tiền Mặt";
                bills.deposit = total;
                bills.unpaid = 0;
                var idbill = new BillDAO().Insert(bills);
                
                var billdetaildao = new BillDetailDAO();
                foreach (var item in cart)
                {
                    var detail = new bill_detail();
                    detail.id_bill = idbill;
                    detail.id_food = item.food.id;
                    detail.quantity = item.quantity;
                    detail.price = item.food.price;
                    billdetaildao.Insert(detail);
                }
            }
            catch(Exception ex)
            {
                throw;
            }

            return Redirect("/");
        }

    }
}