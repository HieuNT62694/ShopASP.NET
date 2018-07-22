using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Models;
namespace WebApplication1.Models.DAO
{
    public class FoodTypeDAO
    {
        project2Entities db = new project2Entities();
        public bool Update(food_type entity)
        {
            try
            {
                var t = db.food_type.Find(entity.id);
                t.name = entity.name;
                t.description = entity.name;
                t.image = entity.image;
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