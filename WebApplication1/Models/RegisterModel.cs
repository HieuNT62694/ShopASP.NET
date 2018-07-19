using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class RegisterModel
    {
        [Required(ErrorMessage ="Yêu Cầu Nhập Tên Đăng Nhập")]
        public string UserName { get; set; }
        [StringLength(20,MinimumLength =6,ErrorMessage ="Độ dài Password ít nhất 6 ký tự")]
        [Required(ErrorMessage = "Yêu Cầu Nhập Mật Khẩu")]
        public string Password { get; set; }

        [Compare("Password",ErrorMessage ="Xác nhận Mật Khẩu Không đúng")]
        public string Cofirm { get; set; }
        [Required(ErrorMessage = "Yêu Cầu Nhập Tên Đầy Đủ")]
        public string Fullname { get; set; }
        [Required(ErrorMessage = "Yêu Cầu Nhập Ngày Sinh")]
        public string BirthDate { get; set; }
        
        public string Gender { get; set; }
        [Required(ErrorMessage = "Yêu Cầu Nhập Địa Chỉ")]
        public string Address { get; set; }
        [Required(ErrorMessage = "Yêu Cầu Nhập Email")]
        //[RegularExpression("^[a - zA - Z0 - 9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Yêu Cầu Nhập Số Điện thoại")]
        public string Phone { get; set; }
    }
}