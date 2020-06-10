using System;
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
            OrderDetails = new List<OrderDetail>();
            BookAuthors = new List<BookAuthors>();
            Picture = new Picture();
            Comments = new List<Comment>();
            
        }
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Year { get; set; }
        public string Description { get; set; }
        public short Stock { get; set; }

        public List<BookCategories> BookCategories { get; set; }
        public List<OrderDetail> OrderDetails { get; set; }
        public List<BookAuthors> BookAuthors { get; set; }
        public Picture Picture { get; set; }
        public List<Comment> Comments { get; set; }




    }
}
