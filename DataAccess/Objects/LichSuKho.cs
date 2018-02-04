using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Objects
{
    public class LichSuKho
    {
        public LichSuKho()
        {
            ThoiGian = new DateTime();
            NguoiThucHien = new User();
            HangHoaXuLy = new HangHoa();
        }
        public int IDLichSuKho { get; set; }
        public DateTime ThoiGian { get; set; }
        public int SoLuong { get; set; }
        public User NguoiThucHien { get; set; }
        public HangHoa HangHoaXuLy { get; set; }
        public bool IsXuat { get; set; }
    }
}
