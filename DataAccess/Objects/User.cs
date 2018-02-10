using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Objects
{
    public class User
    {
        public User()
        {
            LoaiTaiKhoan = new Quyen();
        }
        public int? IDUser { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Avatar { get; set; }
        public string Ho { get; set; }
        public string Ten { get; set; }
        public string SoDienThoai { get; set; }
        public string CMND { get; set; }
        public string QueQuan { get; set; }
        public string DiaChi { get; set; }
        public DateTime NgaySinh { get; set; }
        public DateTime NgayVaoLam { get; set; }
        public bool? IsMale { get; set; }
        public Quyen LoaiTaiKhoan { get; set; }
    }
}
