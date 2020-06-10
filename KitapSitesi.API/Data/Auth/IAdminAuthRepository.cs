using KitapSitesi.API.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KitapSitesi.API.Data
{
    public interface IAdminAuthRepository
    {
        Task<Admin> Register(Admin user, string password);
        Task<Admin> Login(string username, string password);
        Task<bool> UserExists(string username);
    }
}
