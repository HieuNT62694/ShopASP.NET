using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
using WebApplication1.Models.DAO;

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
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var model = from b in db.bills
                        join cus in db.customers
                           on b.id_customer equals cus.id
                        where b.id == id
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
            BillCusModel bi = model.SingleOrDefault();
            if (bi == null)
            {

                return RedirectToAction("Index", "Invalid");
            }           


            return View(bi);
        }
        //public ActionResult BillDetail(int id)
        //{
        //    FoodDAO dao = new FoodDAO();
        //    var listfood = dao.getFoodInBill(id);
        //    var model = from b in db.bills
        //                join cus in db.customers
        //                on b.id_customer equals cus.id
        //                join bd in db.bill_detail
        //                on b.id equals bd.id_bill
        //                where b.id == id
        //                select new BillCusModel()
        //                {
        //                    idbill = b.id,
        //                    idcus = cus.id,
        //                    namecus = cus.name,
        //                    address = cus.address,
        //                    date = b.date_order,
        //                    phone = cus.phone,
        //                    price = b.total,
        //                    status = b.note,
        //                    foodbill = listfood,

        //                };
        //    return View(model.ToList());
        //}
        [HttpPost]
        public ActionResult Edit(BillCusModel bill)
        {
            bill b = db.bills.SingleOrDefault(x => x.id == bill.idbill);



            if (b == null)
            {

                return RedirectToAction("Index", "Invalid");
            }
            var bil = new bill();
            bil.id = bill.idbill;
            bil.id_customer = bill.idcus;
            bil.note = bill.status;
            bil.payment_method = "Tiền Mặt";
            bil.total = bill.price;
            bil.unpaid = 0;
            bil.date_order = bill.date;
            bil.deposit = bill.price;
            BillDAO dao = new BillDAO();
            bool result = dao.Update(bil);
            var cus = new customer();
            cus.id = bill.idcus;
            cus.name = bill.namecus;
            cus.phone = bill.phone;
            cus.address = bill.address;
            cus.gender = "Nam";
            cus.note = "aadddsdsd";
            CustomerDAO cdao = new CustomerDAO();
            bool result2 = cdao.Update(cus);
            if (result == false || result2 == false)
            {
                return RedirectToAction("Index", "Invalid");
            }
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int id)
        {
            bill product = db.bills.SingleOrDefault(n => n.id == id);
            db.bills.Remove(product);
            var billdetail = db.bill_detail.Where(n => n.id_bill == id).ToList();
            foreach (var item in billdetail)
            {
                db.bill_detail.Remove(item);
            }

            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}