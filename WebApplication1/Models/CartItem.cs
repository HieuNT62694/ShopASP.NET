using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    [Serializable]
    public class CartItem
    {
        public food food { get; set; }
        public int quantity { get; set; }
    }
}