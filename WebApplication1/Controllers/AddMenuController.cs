using PagedList;
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
    public class AddMenuController : Controller
    {
        // GET: AddMenu
        project2Entities db = new project2Entities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Create(MenuModel product, HttpPostedFileBase imageUpload)
        {
            if (ModelState.IsValid)
            {
                if (imageUpload == null)
                {
                    ModelState.AddModelError("", "Nhập Hình Ảnh");
                    return View("Index");
                }
                else
                {
                    var fileName = Path.GetFileName(imageUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/assets/images/thuc_don/"), fileName);
                    imageUpload.SaveAs(path);
                    product.image = fileName;
                }


                var menu = new menu();
                menu.name = product.name;
                menu.price = product.price;
                menu.promotion_price = product.proprice;
                menu.image = product.image;
                menu.detail = product.detail;
                MenuDAO dao = new MenuDAO();
                bool result = dao.Create(menu);
                if (result == false)
                {
                    return RedirectToAction("Index", "Invalid");
                }
                return RedirectToAction("Edit");
            }
            else
            {

                ModelState.AddModelError("", "Tạo Menu Thất Bại");
                return View("Index");
            }
        }
        [HttpGet]
        public ActionResult Edit(int page = 1, int pagesize = 6)
        {

            var listmenu = listAllPaging(page, pagesize);
            return View(listmenu);
        }
        public IEnumerable<menu> listAllPaging(int page, int pagesize)
        {
            return db.menus.OrderByDescending(x => x.id).ToPagedList(page, pagesize);
        }
        [HttpGet]
        public ActionResult ViewDetail(int id)
        {

            menu me = db.menus.SingleOrDefault(n => n.id == id);
            if (me == null)
            {

                return RedirectToAction("Index", "Invalid");
            }
            var men = new MenuModel();
            men.id = me.id;
            men.name = me.name;
            men.image = me.image;
            men.detail = me.detail;
            men.price = me.price;
            men.proprice = me.promotion_price;
            return View(men);
        }
        [HttpPost]
        public ActionResult Edit(MenuModel product, HttpPostedFileBase imageUpload)
        {
            if (ModelState.IsValid)
            {

                if(imageUpload!=null)
                {
                    var fileName = Path.GetFileName(imageUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/assets/images/thuc_don/"), fileName);
                    imageUpload.SaveAs(path);
                    product.image = fileName;
                }
                else
                {
                    var model = db.menus.SingleOrDefault(x => x.id == product.id);
                    product.image = model.image;
                }

                var me = new menu();
                me.id = product.id;
                me.name = product.name;
                me.detail = product.detail;
                me.image = product.image;
                me.price = product.price;
                me.promotion_price = product.proprice;
                MenuDAO dao = new MenuDAO();
                bool result = dao.UpdateMenu(me);
                if (result)
                {
                    return RedirectToAction("Edit");
                }
                return RedirectToAction("Index","Invalid");
            }
            else
            {

                ModelState.AddModelError("", "Tạo Món Ăn Thất Bại");
                return View("Index");
            }

        }
        public ActionResult Delete(int id)
        {
            menu menu = db.menus.SingleOrDefault(n => n.id == id);
            db.menus.Remove(menu);

            var listid = db.menu_detail.Where(x => x.id_menu == id).ToList();
            foreach(var item in listid)
            {
                menu_detail de = db.menu_detail.SingleOrDefault(x => x.id_menu == item.id_menu);
                db.menu_detail.Remove(de);
            }

            db.SaveChanges();
            return RedirectToAction("Edit");
        }
    }
}