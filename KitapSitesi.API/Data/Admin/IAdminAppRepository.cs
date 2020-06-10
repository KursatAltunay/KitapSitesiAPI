using KitapSitesi.API.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KitapSitesi.API.Data
{
    public interface IAdminAppRepository : IAppRepository
    {
        void Add<T>(T entity) where T : class;
        void UpdateBook(int id, Book book);
        void UpdateAuthor(int id, Author author);
        void UpdateCategory(int id, Category category);

        void Delete<T>(T entity) where T : class;
        bool SaveAll();
        List<User> GetUsers();

    }
}
