//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplication1.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class bill_detail
    {
        public int id_bill { get; set; }
        public int id_food { get; set; }
        public int quantity { get; set; }
        public double price { get; set; }
    
        public virtual bill bill { get; set; }
        public virtual food food { get; set; }
    }
}
