using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class FoodTypeView
    {
        public string typeName { get; set; }
        public int typeid { get; set; }
        public string image { get; set; }
        public string foodName { get; set; }
        public double price { get; set; }
        public string sumary { get; set; }
        public int id { get; set; }
    }
}