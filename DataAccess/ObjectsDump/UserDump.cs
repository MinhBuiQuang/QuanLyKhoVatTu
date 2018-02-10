using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ObjectsDump
{
    public class UserDump
    {
        public UserDump(int idUser,String username,String ho,String ten,String sdt, String cmt,String queQuan,String diaChi,int idQuyen,DateTime ngaysinh,DateTime ngayvaolam,String avatar,int isMale)
        {
            this.IDUser = idUser;
            Username = username;
            Ho = ho;
            Ten = ten;
            SoDienThoai = sdt;
            CMND = cmt;
            QueQuan = queQuan;
            DiaChi = diaChi;
            IDQuyen = idQuyen;
            NgaySinh = ngaysinh;
            NgayVaoLam = ngayvaolam;
            Avatar = avatar;
            IsMale = isMale == 0 ? false : true;
        }
        public UserDump( String username, String ho, String ten, String sdt, String cmt, String queQuan, String diaChi, int idQuyen, DateTime ngaysinh, DateTime ngayvaolam, String avatar,int isMale)
        {
            Username = username;
            Ho = ho;
            Ten = ten;
            SoDienThoai = sdt;
            CMND = cmt;
            QueQuan = queQuan;
            DiaChi = diaChi;
            IDQuyen = idQuyen;
            NgaySinh = ngaysinh;
            NgayVaoLam = ngayvaolam;
            Avatar = avatar;
            IsMale = isMale==0?false:true;
        }
        public UserDump()
        {

        }
        public int IDUser { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Ho { get; set; }
        public string Ten { get; set; }
        public string SoDienThoai { get; set; }
        public string CMND { get; set; }
        public string QueQuan { get; set; }
        public string DiaChi { get; set; }
        public int IDQuyen { get; set; }
        public string TenQuyen { get; set; }
        public bool IsMale { get; set; }
        public DateTime NgaySinh { get; set; }
        public DateTime NgayVaoLam { get; set; }
        public String Avatar { get; set; }
    }
}
