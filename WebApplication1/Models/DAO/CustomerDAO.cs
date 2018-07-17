using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models.DAO
{
    public class CustomerDAO
    {
        project2Entities db = null;
        public CustomerDAO()
        {
            db = new project2Entities();
        }
        public int Insert(customer customer)
        {
            db.customers.Add(customer);
            db.SaveChanges();
            return customer.id;
        }
    }
}