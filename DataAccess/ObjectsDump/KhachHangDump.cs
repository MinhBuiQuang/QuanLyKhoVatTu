using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ObjectsDump
{
    public class KhachHangDump
    {
        public KhachHangDump()
        {

        }
        public KhachHangDump(int iDKhachHang,string maKh,string tenkh,string congty,string sdt,string diachi,string mst,string ghichu)
        {
            IDKhachHang = iDKhachHang;
            TenKhachHang = tenkh;
            MaKhachHang = maKh;
            TenCongTy = congty;
            SoDienThoai = sdt;
            DiaChi = diachi;
            MaSoThue = mst;
            GhiChu = ghichu;
        }
        public KhachHangDump( string tenkh, string congty, string sdt, string diachi, string mst, string ghichu)
        {
            TenKhachHang = tenkh;
            TenCongTy = congty;
            SoDienThoai = sdt;
            DiaChi = diachi;
            MaSoThue = mst;
            GhiChu = ghichu;
        }

        public int IDKhachHang { get; set; }
        public string MaKhachHang { get; set; }
        public string TenKhachHang { get; set; }
        public string TenCongTy { get; set; }
        public string SoDienThoai { get; set; }
        public string DiaChi { get; set; }
        public string MaSoThue { get; set; }
        public string GhiChu { get; set; }
    }
}
