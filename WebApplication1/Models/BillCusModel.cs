using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class BillCusModel
    {
        public int idbill { get; set; }
        public int idcus { get; set; }
        [Required(ErrorMessage = "Nhập Tên Của Khách hàng")]
        public string namecus { get; set; }
        [Required(ErrorMessage = "Nhập Số Điện Thoại Của Khách hàng")]
        public string phone { get; set; }
        [Required(ErrorMessage = "Nhập Số Điạ chỉ Của Khách hàng")]
        public string address { get; set; }
        public DateTime date { get; set; }
        [Required(ErrorMessage = "Nhập Số tiền thanh toán")]
        public double price { get; set; }
        [Required(ErrorMessage = "Nhập tình trạng đơn hàng")]
        public string status { get; set; }
        public List<food> foodbill { get; set; }
    }
}