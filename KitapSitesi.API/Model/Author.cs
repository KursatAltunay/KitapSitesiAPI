using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KitapSitesi.API.Model
{
    public class Author
    {
        public Author()
        {
            BookAuthors = new List<BookAuthors>();
        }
        public int Id { get; set; }
        public string Name { get; set; }

        public List<BookAuthors> BookAuthors { get; set; }

    }
}
