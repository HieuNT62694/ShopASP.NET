using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class BillController : Controller
    {
        // GET: Bill
        project2Entities db = new project2Entities();
        public ActionResult Index()
        {
            //var listbill = listAllPaging(page, pagesize);
           var model = from b in db.bills
                        join cus in db.customers
                           on b.id_customer equals cus.id
                           where b.note.Equals("Chưa Giao")
                                       select new BillCusModel()
                                       {
                                           idbill = b.id,
                                           idcus = cus.id,
                                           namecus = cus.name,
                                           address = cus.address,
                                           date = b.date_order,
                                           phone = cus.phone,
                                           price = b.total,
                                           status = b.note
                                       };
            var listbill = model.ToList();
            return View(listbill);
        }
    }
}