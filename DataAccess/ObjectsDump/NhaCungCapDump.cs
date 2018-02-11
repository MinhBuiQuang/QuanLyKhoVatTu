using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ObjectsDump
{
    public class NhaCungCapDump
    {
        public NhaCungCapDump()
        {

        }
        public NhaCungCapDump(int Id,string ten,string sdt,string ghichu)
        {
            IDNhaCungCap = Id;
            TenNhaCungCap = ten;
            SoDienThoai = sdt;
            GhiChu = ghichu;
        }
        public NhaCungCapDump( string ten, string sdt, string ghichu)
        {
            TenNhaCungCap = ten;
            SoDienThoai = sdt;
            GhiChu = ghichu;
        }
        public int IDNhaCungCap { get; set; }
        public string TenNhaCungCap { get; set; }
        public string SoDienThoai { get; set; }
        public string GhiChu { get; set; }
    }
}
