using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KitapSitesi.API.Model
{
    public class OrderDetail
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int BookId { get; set; }
        public DateTime OrderDate { get; set; }
        public int Count { get; set; }
        public decimal Price { get; set; }

    }
}
