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

        public DataTable GetHangHoa(int IDHangHoa)
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                dt = db.ExecuteDataSet("sp_HangHoa_Select", new SqlParameter("@IDHangHoa", IDHangHoa)).Tables[0];
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
                    new SqlParameter("@IDNhaCungCap", hangHoa.NguonCungCap.IDNhaCungCap == 0 ? (object)DBNull.Value : hangHoa.NguonCungCap.IDNhaCungCap),
                    new SqlParameter("@IDDonVi", hangHoa.DonVi.IDDonVi),
                    new SqlParameter("@IDViTri",  hangHoa.ViTriHangHoa.IDViTri == 0 ? (object)DBNull.Value : hangHoa.ViTriHangHoa.IDViTri),
                    new SqlParameter("@IDLoaiHang", hangHoa.LoaiHangHoa.IDLoaiHang),
                    new SqlParameter("@Image", hangHoa.Image)
                };
                db.ExecuteNonQuery("sp_HangHoa_Insert", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Update(HangHoa hangHoa)
        {
            try
            {
                DBConnect db = new DBConnect();
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@IDHangHoa", hangHoa.IDHangHoa),
                    new SqlParameter("@TenHangHoa", hangHoa.TenHangHoa),
                    new SqlParameter("@DonGia", hangHoa.DonGia),
                    new SqlParameter("@GhiChu", hangHoa.GhiChu),
                    new SqlParameter("@IDNhaCungCap", hangHoa.NguonCungCap.IDNhaCungCap == 0 ? (object)DBNull.Value : hangHoa.NguonCungCap.IDNhaCungCap),
                    new SqlParameter("@IDDonVi", hangHoa.DonVi.IDDonVi),
                    new SqlParameter("@IDViTri",  hangHoa.ViTriHangHoa.IDViTri == 0 ? (object)DBNull.Value : hangHoa.ViTriHangHoa.IDViTri),
                    new SqlParameter("@IDLoaiHang", hangHoa.LoaiHangHoa.IDLoaiHang),
                    new SqlParameter("@Image", hangHoa.Image)
                };
                db.ExecuteNonQuery("sp_HangHoa_Update", param);
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

        public void XuatKho(int? IDUser, int IDKhachHang, string GhiChu, DataTable TableHangHoa)
        {
            try
            {
                DBConnect db = new DBConnect();
                SqlParameter dtParam = new SqlParameter("@ListHangHoa", TableHangHoa);
                dtParam.SqlDbType = SqlDbType.Structured;
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@IDUser", IDUser),
                    new SqlParameter("@IDKhachHang", IDKhachHang == 0 ? DBNull.Value : (object)IDKhachHang),
                    new SqlParameter("@GhiChu", GhiChu),
                    dtParam
                };
                db.ExecuteNonQuery("sp_HangHoa_TaoHoaDon", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable LichSuKho()
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                dt = db.ExecuteDataSet("sp_LichSuKho_Select", new SqlParameter[0]).Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }
    }
}
