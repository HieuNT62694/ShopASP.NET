using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Common;
using WebApplication1.Models;
using WebApplication1.Models.DAO;

namespace WebApplication1.Controllers
{

    public class LoginController : Controller
    {
        // GET: Login
        project2Entities db = new project2Entities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult CheckLogin(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDAO();
                var result = dao.checklogin(model.UserName, model.Password);
                if (result == 1)
                {
                    var user = dao.GetUserById(model.UserName);
                    var usersession = new UserLogin();
                    usersession.UserName = user.username;
                    usersession.UserId = user.id;
                    Session.Add(CommonConstrants.ADMIN_SESSION, usersession);
                    return RedirectToAction("Index", "Admin", new { area = "Admin" });
                }else if(result == 3){
                    var user = dao.GetUserById(model.UserName);
                    var usersession = new UserLogin();
                    usersession.UserName = user.username;
                    usersession.UserId = user.id;
                    Session.Add(CommonConstrants.USER_SESSION, usersession);
                    return RedirectToAction("Index", "Home");
                }
                else if(result == 0)
                {
                    ModelState.AddModelError("", "Tài Khoản Không Tồn Tại");
                }
                else if (result == 2)
                {
                    ModelState.AddModelError("", "Mật Khẩu Không Đúng");
                }
                else if (result == 2)
                {
                    ModelState.AddModelError("", "Đăng nhập không đúng");
                }
            }
            return View("Index");
            

        }
        public ActionResult Logout()
        {
            Session[CommonConstrants.USER_SESSION] = null;
            return Redirect("/");
        }
       
    }
}