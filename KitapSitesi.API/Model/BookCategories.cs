﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KitapSitesi.API.Model
{
    public class BookCategories
    {
        public int Id { get; set; }
        public int BookId { get; set; }
        public int CategoryId { get; set; }

    }
}