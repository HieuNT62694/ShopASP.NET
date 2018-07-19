using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace WebApplication1.Areas.Admin.Models
{
    public class AddFoodModel
    {
        [Required(ErrorMessage = "Nhập Id Loại Của Thức Ăn")]
        public int Id_Type { get; set; }
        [Required(ErrorMessage = "Nhập Tên Của Thức Ăn")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Nhập Mô Tả Của Thức Ăn")]
        public string Summary { get; set; }
        [Required(ErrorMessage = "Nhập Chi Tiết Của Thức Ăn")]
        public string Detail { get; set; }
        [Required(ErrorMessage = "Nhập Giá Của Thức Ăn")]
        public float Price { get; set; }
        public float ProPrice { get; set; }
        public string Promotion { get; set; }
        public string Image { get; set; }
        [Required(ErrorMessage = "Nhập Đơn Vị Của Thức Ăn")]
        public string Unit { get; set; }
        public int Today { get; set; }
    }
}