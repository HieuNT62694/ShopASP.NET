using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Common;

namespace WebApplication1.Areas.Admin.Controllers
{
    public class AdminController : BaseController
    {

        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Logout()
        {
            Session[CommonConstrants.ADMIN_SESSION] = null;
            return Redirect("/");
        }
    }
}