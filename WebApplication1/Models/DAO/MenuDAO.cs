using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models.DAO
{
    public class MenuDAO
    {
        project2Entities db = null;
        public MenuDAO()
        {
            db = new project2Entities();
        }
        public bool Insert(menu_detail me)
        {
            try
            {
                db.menu_detail.Add(me);
                db.SaveChanges();
            }
            catch
            {
                return false;
            }
            
            return true;
        }

        public bool Create(menu me)
        {
            try
            {
                db.menus.Add(me);
                db.SaveChanges();
            }
            catch
            {
                return false;
            }

            return true;
        }
        public bool Update(menu_detail me,int id)
        {
            try
            {
                var menu = db.menu_detail.Where(x => x.id_food == id).ToList();
                foreach(var item in menu)
                {
                    item.id_menu = me.id_menu;
                }
                db.SaveChanges();
            }
            catch
            {
                return false;
            }

            return true;
        }
        public bool UpdateMenu(menu entity)
        {
            try
            {
                var menu = db.menus.Find(entity.id);
                menu.name = entity.name;
                menu.image = entity.image;              
                menu.price = entity.price;
                menu.promotion_price = entity.promotion_price;
                menu.detail = entity.detail;
                db.SaveChanges();
            }
            catch(Exception ex)
            {
                return false;
            }
            return true;
        }
    }
}