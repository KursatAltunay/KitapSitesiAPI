using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KitapSitesi.API.Model
{
    public class Category
    {
        public Category()
        {
            BookCategories = new List<BookCategories>();
        }
        public int Id { get; set; }
        public string Name { get; set; }

        public List<BookCategories> BookCategories { get; set; }

    }
}
