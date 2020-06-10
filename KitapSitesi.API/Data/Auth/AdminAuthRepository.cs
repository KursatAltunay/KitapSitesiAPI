using KitapSitesi.API.Model;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KitapSitesi.API.Data
{
    public class AdminAuthRepository : IAdminAuthRepository
    {
        private DataContext _context;

        public AdminAuthRepository(DataContext context)
        {
            _context = context;
        }

        public async Task<Admin> Login(string username, string password)
        {
            var user = await _context.Admins.FirstOrDefaultAsync(x => x.Username == username);
            if (user == null)
            {
                return null;
            }

            if (!VerifyPasswordHash(password, user.PasswordHash, user.PasswordSalt))
            {
                return null;
            }
            return user;
        }

        private bool VerifyPasswordHash(string password, byte[] userPasswordHash, byte[] userPasswordSalt)
        {
            using (var hmac = new System.Security.Cryptography.HMACSHA512(userPasswordSalt))
            {
                var computedHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                for (int i = 0; i < computedHash.Length; i++)
                {
                    if (computedHash[i] != userPasswordHash[i])
                    {
                        return false;
                    }
                }

                return true;
            }
        }

        public async Task<Admin> Register(Admin user, string password)
        {
            byte[] passwordHash, passwordSalt;
            CreatePasswordHash(password, out passwordHash, out passwordSalt);

            user.PasswordHash = passwordHash;
            user.PasswordSalt = passwordSalt;

            await _context.Admins.AddAsync(user);
            await _context.SaveChangesAsync();

            return user;
        }

        private void CreatePasswordHash(string password, out byte[] passwordHash, out byte[] passwordSalt)
        {
            using (var hmac = new System.Security.Cryptography.HMACSHA512())
            {
                passwordSalt = hmac.Key;
                passwordHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));

            }
        }

        public async Task<bool> UserExists(string username)
        {
            if (await _context.Admins.AnyAsync(x => x.Username == username))
            {
                return true;
            }

            return false;
        }
    }
}
