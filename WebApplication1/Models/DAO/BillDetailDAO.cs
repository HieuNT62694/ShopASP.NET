using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models.DAO
{
    public class BillDetailDAO
    {
        project2Entities db = null;
        public BillDetailDAO()
        {
            db = new project2Entities();
        }
        public bool Insert(bill_detail detail)
        {
            try
            {
                db.bill_detail.Add(detail);
                db.SaveChanges();
            }
            catch
            {
                return false;
            }
            return true;
           
        }
    }
}