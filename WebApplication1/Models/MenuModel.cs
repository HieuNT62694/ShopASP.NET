using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class MenuModel
    {
        public int id { get; set; }
        [Required(ErrorMessage = "Nhập Tên Của menu")]
        public string name { get; set; }
        [Required(ErrorMessage = "Nhập giá Của Menu")]
        public double price { get; set; }
        [Required(ErrorMessage = "Nhập giá giảm giá của menu")]
        public double proprice { get; set; }
        [Required(ErrorMessage = "Nhập chi tiết của menu")]
        public string detail { get; set; }
        public string image { get; set; }
    }
}