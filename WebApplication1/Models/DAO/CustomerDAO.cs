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
        public bool Update(customer entity)
        {
            try
            {
                var cus = db.customers.Find(entity.id);
                cus.name = entity.name;
                cus.note = entity.note;
                cus.phone = entity.phone;
                cus.gender = entity.gender;
                cus.address = entity.address;
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