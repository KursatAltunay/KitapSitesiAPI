using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using KitapSitesi.API.Data;
using KitapSitesi.API.Dtos;
using KitapSitesi.API.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace KitapSitesi.API.Controllers
{
    [Route("api/adminAuth")]
    [ApiController]
    public class AdminAuthController : ControllerBase
    {
        private IAdminAuthRepository _adminAuthRepository;
        private IConfiguration _configuration;

        public AdminAuthController(IAdminAuthRepository adminAuthRepository, IConfiguration configuration)
        {
            _adminAuthRepository = adminAuthRepository;
            _configuration = configuration;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody]AdminForRegisterDto adminForRegisterDto)
        {
            if (await _adminAuthRepository.UserExists(adminForRegisterDto.Username))
            {
                ModelState.AddModelError("UserName", "Username already exists");
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var adminToCreate = new Admin
            {
                Username = adminForRegisterDto.Username
            };

            var createdUser = await _adminAuthRepository.Register(adminToCreate, adminForRegisterDto.Password);
            return StatusCode(201);
        }


        [HttpPost("login")]
        public async Task<ActionResult> Login([FromBody] AdminForLoginDto adminForLoginDto)
        {
            var admin = await _adminAuthRepository.Login(adminForLoginDto.Username, adminForLoginDto.Password);

            if (admin == null)
            {
                return Unauthorized();

            }

            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_configuration.GetSection("AppSettings:Token").Value);


            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.NameIdentifier,admin.Id.ToString()),
                    new Claim(ClaimTypes.Name,admin.Username)
                }),
                Expires = DateTime.Now.AddDays(1),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha512Signature)
            };



            var token = tokenHandler.CreateToken(tokenDescriptor);
            var tokenString = tokenHandler.WriteToken(token);
            return Ok(tokenString);

        }
    }
}