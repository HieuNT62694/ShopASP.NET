using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models.DAO
{
    public class BillDAO
    {
        project2Entities db = null;
        public BillDAO()
        {
            db = new project2Entities();
        }
        public int Insert(bill order)
        {
            db.bills.Add(order);
            db.SaveChanges();
            return order.id;
        }
        public bool Update(bill entity)
        {
            try
            {
                var b = db.bills.Find(entity.id);
                b.total = entity.total;
                b.id_customer = entity.id_customer;
                b.note = entity.note;
                b.payment_method = entity.payment_method;
                b.unpaid = entity.unpaid;
                b.deposit = entity.deposit;
                b.note = entity.note;
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;


        }
    }
}