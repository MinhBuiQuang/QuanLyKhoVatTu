using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Objects
{
    public class HoaDon
    {
        public HoaDon()
        {
            ThoiGian = new DateTime();
            NhanVienBan = new User();
            KhachHangMua = new KhachHang();
        }
        public int IDHoaDon { get; set; }
        public string MaHoaDon { get; set; }
        public double GiaTien { get; set; }
        public DateTime ThoiGian { get; set; }
        public User NhanVienBan { get; set; }
        public KhachHang KhachHangMua { get; set; }
        public bool IsDebt{ get; set; }
        public string GhiChu { get; set; }
    }
}
