using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ObjectsDump
{
    public class NhaSanXuatDump
    {
        public NhaSanXuatDump()
        {

        }
        public NhaSanXuatDump(string name,string ghichu)
        {
            TenNhaSanXuat = name;
            GhiChu = ghichu;
        }
        public NhaSanXuatDump(int id,string name,string ghichu)
        {
            TenNhaSanXuat = name;
            GhiChu = ghichu;
            IDNhaSanXuat = id;
        }
        public string TenNhaSanXuat { get; set; }
        public int IDNhaSanXuat { get; set; }
        public string GhiChu { get; set; }
    }
}
