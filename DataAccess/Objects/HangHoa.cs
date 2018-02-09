using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Objects
{
    public class HangHoa
    {
        public HangHoa()
        {
            NguonCungCap = new NhaCungCap();
            DonVi = new DonViTinh();
            ViTriHangHoa = new ViTri();
            LoaiHangHoa = new LoaiHang();
        }
        public int IDHangHoa { get; set; }
        public string MaHangHoa { get; set; }
        public NhaCungCap NguonCungCap { get; set; }
        public string TenHangHoa { get; set; }
        public float SoLuongTonKho { get; set; }
        public float DonGia { get; set; }
        public DonViTinh DonVi { get; set; }
        public ViTri ViTriHangHoa { get; set; }
        public LoaiHang LoaiHangHoa { get; set; }
        public string GhiChu { get; set; }
        public string Image { get; set; }
    }
}
