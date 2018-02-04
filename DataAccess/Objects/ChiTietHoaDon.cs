using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Objects
{
    public class ChiTietHoaDon
    {
        public int IDChiTiet { get; set; }
        public HoaDon HoaDonChinh { get; set; }
        public HangHoa HangHoaChon { get; set; }
        public int SoLuong { get; set; }
    }
}
