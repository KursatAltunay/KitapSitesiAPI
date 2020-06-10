﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KitapSitesi.API.Model
{
    public class Book
    {
        public Book()
        {
            BookCategories = new List<BookCategories>();
            
        }
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Year { get; set; }
        public string Description { get; set; }
        public short Stock { get; set; }

        public List<BookCategories> BookCategories { get; set; }
        



    }
}
