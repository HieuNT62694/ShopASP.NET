using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace WebApplication1.Models.DAO
{
    public class UserDAO
    {
        project2Entities db = null;
        public UserDAO()
        {
            db = new project2Entities();
        }

        public int checklogin(string username,string password)
        {
            var newpasswrod = GetMD5(password);
            var model = db.users.SingleOrDefault(x => x.username == username && x.password == newpasswrod);
            if (model == null)
            {
                return 0;

                    
            }
            else
            {
                if (model.password == newpasswrod)
                {
                    if (model.role == "admin")
                    {
                        return 1;
                    }
                    else
                    {
                        return 3;
                    }
                    
                }
                else
                {
                    return 2;
                }
            }
        }
        public user GetUserById(string username)
        {
            return db.users.SingleOrDefault(x=>x.username == username);
        }
        public bool checkUserName(string username)
        {
            return db.users.Count(x => x.username == username) > 0;
        }
        public bool checkEmail(string Email)
        {
            return db.users.Count(x => x.email == Email) > 0;
        }
        public int Insert(user user)
        {
            db.users.Add(user);
            db.SaveChanges();
            return user.id;
        }
        public static string GetMD5(string str)
        {

            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();

            byte[] bHash = md5.ComputeHash(Encoding.UTF8.GetBytes(str));

            StringBuilder sbHash = new StringBuilder();

            foreach (byte b in bHash)
            {

                sbHash.Append(String.Format("{0:x2}", b));

            }

            return sbHash.ToString();

        }
    }
}