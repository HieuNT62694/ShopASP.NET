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
    public class AddTypeController : Controller
    {

        // GET: AddType
        project2Entities db = new project2Entities();
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(FoodTypeModel product, HttpPostedFileBase imageUpload)
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
                    var path = Path.Combine(Server.MapPath("~/assets/images/hinh_loai_mon_an"), fileName);
                    imageUpload.SaveAs(path);
                    product.image = fileName;
                }

                var type = new food_type();
                type.name = product.name;
                type.description = product.description;
                type.image = product.image;
                try
                {
                    db.food_type.Add(type);
                    db.SaveChanges();
                }catch(Exception ex)
                {
                    return RedirectToAction("Index", "Invalid");
                }               
                return RedirectToAction("Edit");
            }
            else
            {

                ModelState.AddModelError("", "Tạo Món Ăn Thất Bại");
                return View("Index");
            }
        }
        [HttpGet]
        public ActionResult Edit(int page = 1, int pagesize = 6)
        {

            var listtype = listAllPaging(page, pagesize);
            return View(listtype);
        }
        public IEnumerable<food_type> listAllPaging(int page, int pagesize)
        {
            return db.food_type.OrderByDescending(x => x.id).ToPagedList(page, pagesize);
        }
        [HttpGet]
        public ActionResult ViewDetail(int id)
        {

            food_type fo = db.food_type.SingleOrDefault(n => n.id == id);
            if (fo == null)
            {

                return RedirectToAction("Index", "Invalid");
            }
            var type = new FoodTypeModel();
            type.id = fo.id;
            type.name = fo.name;
            type.image = fo.image;
            type.description = fo.description;
            return View(type);
        }
        [HttpPost]
        public ActionResult Edit(FoodTypeModel product, HttpPostedFileBase imageUpload)
        {
            if (ModelState.IsValid)
            {
                if(imageUpload!=null)
                {
                    var fileName = Path.GetFileName(imageUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/assets/images/hinh_loai_mon_an"), fileName);
                    imageUpload.SaveAs(path);
                    product.image = fileName;
                }
                                else
                {
                    var model = db.food_type.SingleOrDefault(x => x.id == product.id);
                    product.image = model.image;
                }
                var type = new food_type();
                type.id = product.id;
                type.name = product.name;
                type.description = product.description;
                type.image = product.image;
                FoodTypeDAO dao = new FoodTypeDAO();
                bool result = dao.Update(type);
                if (result)
                {
                    return RedirectToAction("Edit");
                }
                return View("Edit");
            }
            else
            {

                ModelState.AddModelError("", "Tạo Món Ăn Thất Bại");
                return View("Index");
            }
          
        }
        public ActionResult Delete(int id)
        {
            food_type type = db.food_type.SingleOrDefault(n => n.id == id);
            db.food_type.Remove(type);

            db.SaveChanges();
            return RedirectToAction("Edit");
        }
    }


}