using KitapSitesi.API.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KitapSitesi.API.Dtos
{
    public class BookForListDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Year { get; set; }
        public string Description { get; set; }
        public short Stock { get; set; }
        public List<CategoryForBookListDto> Categories { get; set; }
        public List<AuthorForBookListDto>  Authors { get; set; }        
    }
}
