using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Please Input Username")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Please Input Password")]
        public string Password { get; set; }
        public bool Remember { get; set; }
    }
}