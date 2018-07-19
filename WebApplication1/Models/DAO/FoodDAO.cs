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
        public int Insert(food fo)
        {

                db.foods.Add(fo);
                db.SaveChanges();
            return fo.id;

        }
        public bool Update(food entity,int type,int menu)
        {
            try
            {
                var food = db.foods.Find(entity.id);
                food.id_type = type;
                food.image = entity.image;
                food.name = entity.name;
                food.price = entity.price;
                food.promotion_price = entity.promotion_price;
                food.promotion = entity.promotion;
                food.summary = entity.summary;
                food.update_at = DateTime.Now;
                food.unit = entity.unit;
                food.today = 1;
                food.detail = entity.detail;
                db.SaveChanges();
            }
            catch(Exception ex)
            {
                return false;
            }
            return true;


        }
        public int getNameMenuById(int id)
        {
            var model = from f in db.foods
                        join md in db.menu_detail
                         on f.id equals md.id_food
                        join m in db.menus
                        on md.id_menu equals m.id
                        where f.id == id
                        select new MenuView()
                        {
                            menuName = m.name,
                            id = m.id
                        };
            return model.SingleOrDefault().id;
        }
        public int getNameTypeById(int id)
        {
            var model = from f in db.foods
                        join ft in db.food_type
                        on f.id_type equals ft.id
                        where f.id == id
                        select new FoodTypeView()
                        {
                            typeName = ft.name,
                            typeid = ft.id,
                            foodName = f.name,
                            image = f.image,
                            price = f.price,
                            sumary = f.summary,
                            id = f.id
                        };
            return model.SingleOrDefault().typeid;
        }
           
        }
        
}