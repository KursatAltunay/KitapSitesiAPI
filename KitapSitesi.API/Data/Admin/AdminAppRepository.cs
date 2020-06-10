using KitapSitesi.API.Model;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KitapSitesi.API.Data
{
    public class AdminAppRepository : IAdminAppRepository
    {
        DataContext _context;

        public AdminAppRepository(DataContext dataContext)
        {
            _context = dataContext;
        }

        public void Add<T>(T entity) where T : class
        {
            _context.Add(entity);
        }

        public void Delete<T>(T entity) where T : class
        {
            _context.Remove(entity);
        }

        public Author GetAuthor(int id)
        {
            var author = _context.Authors.FirstOrDefault(x => x.Id == id);
            return author;
        }

        public List<Author> GetAuthors()
        {
            var authors = _context.Authors.ToList();
            return authors;
        }

        public Book GetBook(int id)
        {
            var book = _context.Books.FirstOrDefault(x => x.Id == id);
            return book;
        }

        public List<Book> GetBooks()
        {
            var books = _context.Books.Include(d => d.BookCategories).Include(c => c.BookAuthors)/*.Include(a => a.Categories).Include(b => b.Authors)*/.ToList();
                        
            return books;
        }

        public List<Category> GetCategories()
        {
            var categories = _context.Categories.ToList();
            return categories;
        }

        public Category GetCategory(int id)
        {
            var category = _context.Categories.FirstOrDefault(x => x.Id == id);
            return category;
        }

        public List<User> GetUsers()
        {
            var users = _context.Users.ToList();
            return users;
        }

        public bool SaveAll()
        {
            return _context.SaveChanges() > 0;
        }

        public void UpdateAuthor(int id, Author author)
        {
            Author oldAuthor = _context.Authors.FirstOrDefault(x => x.Id == id);
            oldAuthor.Name = author.Name;

        }

        public void UpdateBook(int id, Book book)
        {
            Book oldBook = _context.Books.FirstOrDefault(x => x.Id == id);
            oldBook.Name = book.Name;
            oldBook.Price = book.Price;
            oldBook.Stock = book.Stock;
            oldBook.Year = book.Year;
            oldBook.Description = book.Description;
        }

        public void UpdateCategory(int id, Category category)
        {
            Category oldCategory = _context.Categories.FirstOrDefault(x => x.Id == id);
            oldCategory.Name = category.Name;
        }
    }
}
