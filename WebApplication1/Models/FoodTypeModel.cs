using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class FoodTypeModel
    {
        
        public int id { get; set; }
        [Required(ErrorMessage = "Nhập Tên Của Loại thức ăn")]
        public string name { get; set; }
        [Required(ErrorMessage = "Nhập Mô tả Của Loại thức ăn")]
        public string description { get; set; }
        public string image { get; set; }
    }
}