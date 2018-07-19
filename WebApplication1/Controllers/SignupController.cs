using BotDetect.Web.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
using WebApplication1.Models.DAO;

namespace WebApplication1.Controllers
{
    public class SignupController : Controller
    {
        // GET: Signup
        public ActionResult Index()
        {

            return View();
        }
        [CaptchaValidation("CaptchaCode", "registerCaptcha", "Mã Xác nhận Không Đúng")]
        public ActionResult Register(RegisterModel model)
        {

            if (ModelState.IsValid)
            {
                var dao = new UserDAO();
                if (dao.checkUserName(model.UserName))
                {
                    ModelState.AddModelError("", "Tên Đăng Nhập Đã Tồn Tại");
                }
                else if (dao.checkEmail(model.Email))
                {
                    ModelState.AddModelError("", "Email Đã Tồn Tại");
                }
                else
                {
                    var user = new user();
                    user.username = model.UserName;
                    user.password = GetMD5(model.Password);
                    user.phone = model.Phone;
                    user.fullname = model.Fullname;
                    user.address = model.Address;
                    user.birthdate = DateTime.Now;
                    user.gender = "Nam";
                    user.email = model.Email;
                    user.role = "User";
                    var result = dao.Insert(user);
                    if (result>0)
                    {
                        ViewBag.Success = "Đăng Ký thành Công";
                        model = new RegisterModel();
                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng Ký Không Thành Công");
                    }
                }
            }
            return View("Index");
        }
        
        public static string GetMD5(string str)
        {

            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();

            byte[] bHash = md5.ComputeHash(Encoding.UTF8.GetBytes(str));

            StringBuilder sbHash = new StringBuilder();

            foreach (byte b in bHash)
            {

                sbHash.Append(String.Format("{0:x2}", b));

            }

            return sbHash.ToString();

        }
    }
}