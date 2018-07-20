using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class BillCusModel
    {
        public int idbill { get; set; }
        public int idcus { get; set; }
        public string namecus { get; set; }
        public string phone { get; set; }
        public string address { get; set; }
        public DateTime date { get; set; }
        public double price { get; set; }
        public string status { get; set; }
    }
}