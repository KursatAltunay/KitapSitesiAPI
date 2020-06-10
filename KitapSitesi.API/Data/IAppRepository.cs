using KitapSitesi.API.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KitapSitesi.API.Data
{
  public  interface IAppRepository
    {
        List<Book> GetBooks();
        List<Author> GetAuthors();
        List<Category> GetCategories();

        Book GetBook(int id);
        Author GetAuthor(int id);
        Category GetCategory(int id);
    }
}
