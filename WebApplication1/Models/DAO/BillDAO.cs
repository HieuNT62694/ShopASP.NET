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
    }
}