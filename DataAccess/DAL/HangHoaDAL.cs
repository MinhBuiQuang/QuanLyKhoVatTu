using DataAccess.Objects;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DAL
{
    public class HangHoaDAL
    {
        public DataTable GetHangHoa()
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                dt = db.ExecuteDataSet("sp_HangHoa_Select", new SqlParameter[0]).Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }

        public void Insert(HangHoa hangHoa)
        {
            try
            {
                DBConnect db = new DBConnect();
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@TenHangHoa", hangHoa.TenHangHoa),
                    new SqlParameter("@DonGia", hangHoa.DonGia),
                    new SqlParameter("@GhiChu", hangHoa.GhiChu),
                    new SqlParameter("@IDNhaCungCap", hangHoa.NguonCungCap.IDNhaCungCap),
                    new SqlParameter("@IDDonVi", hangHoa.DonVi.IDDonVi),
                    new SqlParameter("@IDViTri",  hangHoa.ViTriHangHoa.IDViTri),
                    new SqlParameter("@IDLoaiHang", hangHoa.LoaiHangHoa.IDLoaiHang)
                };
                db.ExecuteNonQuery("sp_HangHoa_Insert", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void NhapKho(LichSuKho lsk)
        {
            try
            {
                DBConnect db = new DBConnect();
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@ThoiGian", lsk.ThoiGian),
                    new SqlParameter("@SoLuong", lsk.SoLuong),
                    new SqlParameter("@IDUser", lsk.NguoiThucHien.IDUser),
                    new SqlParameter("@IDHangHoa", lsk.HangHoaXuLy.IDHangHoa),
                    new SqlParameter("@HaveSub", false)
                };
                db.ExecuteNonQuery("sp_LichSuKho_NhapKho", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void NhapKho(LichSuKho lsk,  float donGiaSub, float soLuongSub, int idDonViSub)
        {
            try
            {
                DBConnect db = new DBConnect();
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@ThoiGian", lsk.ThoiGian),
                    new SqlParameter("@SoLuong", lsk.SoLuong),
                    new SqlParameter("@IDUser", lsk.NguoiThucHien.IDUser),
                    new SqlParameter("@IDHangHoa", lsk.HangHoaXuLy.IDHangHoa),
                    new SqlParameter("@HaveSub", true),
                    new SqlParameter("@DonGiaSub", donGiaSub),
                    new SqlParameter("@SoLuongSub", soLuongSub),
                    new SqlParameter("@IDDonViSub", idDonViSub)
                };
                db.ExecuteNonQuery("sp_LichSuKho_NhapKho", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
