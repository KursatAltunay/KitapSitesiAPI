using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KitapSitesi.API.Model
{
    public class Picture
    {
        public int Id { get; set; }
        public int BookId { get; set; }
        public string PictureUrl { get; set; }
    }
}
