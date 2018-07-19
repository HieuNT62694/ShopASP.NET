using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models.DAO
{
    public class FoodDAO
    {
        project2Entities db = null;
        public FoodDAO()
        {
            db = new project2Entities();
        }
        public List<MenuView> getAllFoodInMenu(int idmenu)
        {
            var model =from f in db.foods
                       join md in db.menu_detail
                        on f.id equals md.id_food
                        join m in db.menus
                        on md.id_menu equals m.id
                        where md.id_menu == idmenu
                        select new MenuView()
                {
                foodid = f.id
            };
            var listid = model.ToList();
            return listid;
        }
    }
}