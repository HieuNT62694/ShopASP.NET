using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
using WebApplication1.Models.DAO;

namespace WebApplication1.Controllers
{
    public class CreateController : BaseController
    {
        // GET: Create
        project2Entities db = new project2Entities();
        public ActionResult Index()
        {
            ViewBag.Type = new SelectList(db.food_type.ToList(), "id", "name");
            ViewBag.Menu = new SelectList(db.menus.ToList(), "id", "name");
            
            return View();
        }
        public ActionResult Create(AddFoodModel product, HttpPostedFileBase imageUpload,int Type,int Menu)
        {
            if(ModelState.IsValid) {
                if (imageUpload == null)
                {
                    ModelState.AddModelError("", "Nhập Hình Ảnh");
                    ViewBag.Type = new SelectList(db.food_type.ToList(), "id", "name");
                    ViewBag.Menu = new SelectList(db.menus.ToList(), "id", "name");
                    return View("Index");
                }
                else
                {
                    var fileName = Path.GetFileName(imageUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/assets/images/hinh_mon_an/"), fileName);
                    imageUpload.SaveAs(path);
                    product.Image = fileName;
                }
               
                var food = new food();
                food.id_type = Type;
                food.image = product.Image;
                food.name = product.Name;
                food.price = product.Price;
                food.promotion_price = product.ProPrice;
                food.promotion = product.Promotion;
                food.summary = product.Summary;
                food.update_at = DateTime.Now;
                food.unit = product.Unit;
                food.today = 1;
                food.detail = product.Detail;
                FoodDAO dao = new FoodDAO();
                int id = dao.Insert(food);
                var menudetail = new menu_detail();
                menudetail.id_food = id;
                menudetail.id_menu = Menu;
                menudetail.quantity = 1;
                MenuDAO mdao = new MenuDAO();
                bool result = mdao.Insert(menudetail);

                ViewBag.Type = new SelectList(db.food_type.ToList(), "id", "name");
                ViewBag.Menu = new SelectList(db.menus.ToList(), "id", "name");
                return RedirectToAction("Index", "Admin");
            }
            else
            {

                ModelState.AddModelError("", "Tạo Món Ăn Thất Bại");
                ViewBag.Type = new SelectList(db.food_type.ToList(), "id", "name");
                ViewBag.Menu = new SelectList(db.menus.ToList(), "id", "name");
                return View("Index");
            }

        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            food fo = db.foods.SingleOrDefault(n => n.id == id);
            if (fo == null)
            {
                
                return RedirectToAction("Index","Invalid");
            }
            FoodDAO dao = new FoodDAO();
            var selectedId = dao.getNameMenuById(id);
            var selectedId2 = dao.getNameTypeById(id);
            AddFoodModel af = new AddFoodModel();
            af.Name = fo.name;
            af.Price = fo.price;
            af.ProPrice = fo.promotion_price;
            af.Promotion = fo.promotion;
            af.Image = fo.image;
            af.Detail = fo.detail;
            af.Summary = fo.summary;
            af.Unit = fo.unit;
            ViewBag.Type = new SelectList(db.food_type.ToList(), "id", "name", selectedId2);
            ViewBag.Menu = new SelectList(db.menus.ToList(), "id", "name", selectedId);

            return View(af);
        }
        [HttpPost]
        public ActionResult Edit(AddFoodModel product, HttpPostedFileBase imageUpload, int Type, int Menu)
        {
            food fo = db.foods.SingleOrDefault(n => n.id == product.Id);
            if (ModelState.IsValid)
            {
                if (imageUpload == null)
                {
                    ModelState.AddModelError("", "Nhập Hình Ảnh");
                    ViewBag.Type = new SelectList(db.food_type.ToList(), "id", "name");
                    ViewBag.Menu = new SelectList(db.menus.ToList(), "id", "name");
                    return View("Index");
                }
                else
                {
                    var fileName = Path.GetFileName(imageUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/assets/images/hinh_mon_an/"), fileName);
                    imageUpload.SaveAs(path);
                    product.Image = fileName;
                }

                var food = new food();
                food.id = product.Id;
                food.id_type = Type;
                food.image = product.Image;
                food.name = product.Name;
                food.price = product.Price;
                food.promotion_price = product.ProPrice;
                food.promotion = product.Promotion;
                food.summary = product.Summary;
                food.update_at = DateTime.Now;
                food.unit = product.Unit;
                food.today = 1;
                food.detail = product.Detail;
                FoodDAO dao = new FoodDAO();
                bool result = dao.Update(food, Type, Menu);
                var menudetail = new menu_detail();
                menudetail.id_food = product.Id;
                menudetail.id_menu = Menu;
                menudetail.quantity = 1;
                MenuDAO mdao = new MenuDAO();
                bool result2 = mdao.Update(menudetail,product.Id);
                if (result == false || result2 == false)
                {
                    ModelState.AddModelError("", "Cập Nhật Món Ăn Thất Bại");
                    ViewBag.Type = new SelectList(db.food_type.ToList(), "id", "name");
                    ViewBag.Menu = new SelectList(db.menus.ToList(), "id", "name");
                    return View("Index");
                }
                ViewBag.Type = new SelectList(db.food_type.ToList(), "id", "name");
                ViewBag.Menu = new SelectList(db.menus.ToList(), "id", "name");
                return RedirectToAction("Index", "Admin");
            }
            else
            {

                ModelState.AddModelError("", "Cập Nhật Ăn Thất Bại");
                ViewBag.Type = new SelectList(db.food_type.ToList(), "id", "name");
                ViewBag.Menu = new SelectList(db.menus.ToList(), "id", "name");
                return View("Index");
            }

        }
        public ActionResult Delete(int id)
        {
            food product = db.foods.SingleOrDefault(n => n.id == id);
            db.foods.Remove(product);
            var menu = db.menu_detail.Where(n => n.id_food == id).ToList();
            foreach(var item in menu)
            {
                db.menu_detail.Remove(item);
            }
            
            db.SaveChanges();
            return RedirectToAction("Index", "Admin");
        }
    }

}