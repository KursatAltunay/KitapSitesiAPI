using AutoMapper;
using KitapSitesi.API.Dtos;
using KitapSitesi.API.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KitapSitesi.API.Helpers
{
    public class AutoMapperProfiles : Profile
    {
        public AutoMapperProfiles()
        {
            CreateMap<Book, BookForListDto>()
                  //.ForMember(d => d.Categories, opt => opt.MapFrom(s => s.BookCategories.Select(x=>x.Category)))
                  //.ForMember(d => d.Authors, opt => opt.MapFrom(s => s.BookAuthors.Select(x=>x.Author)))
                  ;

            CreateMap<BookAuthors, AuthorForBookListDto>()
                .ForMember(d => d.Id, opt => opt.MapFrom(s => s.AuthorId))
                .ForMember(d => d.Books, opt => opt.MapFrom(s => s.Book))
                .ForMember(d => d.Name, opt => opt.MapFrom(s => s.Author.Name));


            CreateMap<BookCategories, CategoryForBookListDto>()
                .ForMember(d => d.Id, opt => opt.MapFrom(s => s.CategoryId))
                .ForMember(d => d.Books, opt => opt.MapFrom(s => s.Book))
                .ForMember(d => d.Name, opt => opt.MapFrom(s => s.Category.Name));


        }
    }
}
