using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class AddFoodModel
    {
        public int Id { get; set; }
        public int Id_Type { get; set; }
        public int Id_Menu { get; set; }
        [Required(ErrorMessage = "Nhập Tên Của Thức Ăn")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Nhập Mô Tả Của Thức Ăn")]
        public string Summary { get; set; }
        [Required(ErrorMessage = "Nhập Chi Tiết Của Thức Ăn")]
        public string Detail { get; set; }
        [Required(ErrorMessage = "Nhập Giá Của Thức Ăn")]
        public double Price { get; set; }
        public double ProPrice { get; set; }
        public string Promotion { get; set; }
        public string Image { get; set; }
        [Required(ErrorMessage = "Nhập Đơn Vị Của Thức Ăn")]
        public string Unit { get; set; }
        public int Today { get; set; }
        
    }
}