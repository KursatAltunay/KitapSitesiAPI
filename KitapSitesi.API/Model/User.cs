﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KitapSitesi.API.Model
{
    public class User
    {
        public User()
        {
            Comments = new List<Comment>();
            OrderDetails = new List<OrderDetail>();
        }
        public int Id { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public byte[] PasswordHash { get; set; }
        public byte[] PasswordSalt { get; set; }
        public string Address { get; set; }
        public int Phone { get; set; }

        public List<Comment> Comments { get; set; }
        public List<OrderDetail> OrderDetails { get; set; }

    }
}
