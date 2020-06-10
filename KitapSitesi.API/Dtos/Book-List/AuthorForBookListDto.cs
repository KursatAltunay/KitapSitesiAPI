using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KitapSitesi.API.Dtos
{
    public class AuthorForBookListDto
    {
        public int Id { get; set; } //authorId
        public string Name { get; set; } //authorName
       
        public List<BookForListDto> Books { get; set; }
    }
}
