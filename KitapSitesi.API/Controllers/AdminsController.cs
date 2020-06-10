using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using KitapSitesi.API.Data;
using KitapSitesi.API.Dtos;
using KitapSitesi.API.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace KitapSitesi.API.Controllers
{
    [Route("api/admin")]
    [ApiController]
    public class AdminsController : ControllerBase
    {
        private IAdminAppRepository _adminAppRepository;
        IMapper _mapper;

        public AdminsController(IAdminAppRepository adminAppRepository, IMapper mapper)
        {
            _adminAppRepository = adminAppRepository;
            _mapper = mapper;
        }

        [Route("Books")]
        public ActionResult GetBooks()
        {
            var books = _adminAppRepository.GetBooks();
            var booksToReturn = _mapper.Map<List<BookForListDto>>(books);
            return Ok(booksToReturn);
        }
        [Route("Categories")]
        public ActionResult GetCategories()
        {
            var categories = _adminAppRepository.GetCategories();
            return Ok(categories);
        }
        [Route("Authors")]
        public ActionResult GetAuthors()
        {
            var authors = _adminAppRepository.GetAuthors();
            return Ok(authors);
        }

        [Route("Users")]
        public ActionResult GetUsers()
        {
            var users = _adminAppRepository.GetUsers();
            return Ok(users);
        }

        [HttpPost]
        [Route("addCategory")]
        public ActionResult AddCategory([FromBody] Category category)
        {
            _adminAppRepository.Add(category);
            _adminAppRepository.SaveAll();
            return Ok(category);
        }

        [HttpPost]
        [Route("addAuthor")]
        public ActionResult AddAuthor([FromBody] Author author)
        {
            _adminAppRepository.Add(author);
            _adminAppRepository.SaveAll();
            return Ok(author);
        }

        [HttpPost]
        [Route("updateCategory/{categoryId}")]
        public ActionResult UpdateCategory(int categoryId, [FromBody] Category category)
        {
            _adminAppRepository.UpdateCategory(categoryId, category);
            _adminAppRepository.SaveAll();
            return Ok();
        }

        [HttpPost]
        [Route("updateAuthor/{authorId}")]
        public ActionResult UpdateAuthor(int authorId, [FromBody] Author author)
        {
            _adminAppRepository.UpdateAuthor(authorId, author);
            _adminAppRepository.SaveAll();
            return Ok();
        }




    }
}