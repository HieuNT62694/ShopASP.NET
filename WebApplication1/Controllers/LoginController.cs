using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{

    public class LoginController : Controller
    {
        // GET: Login
        projectEntities db = new projectEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult CheckLogin(string username, string password)
        {
           
            var newpasswrod = GetMD5(password);
            var model = db.users.FirstOrDefault(x => x.username == username || x.password == newpasswrod);
            if (model != null)
            {
                return RedirectToAction("Index", "Admin",new {area = "Admin" });
            }
            else
            {
               return  RedirectToAction("Index", "Login");
            }
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