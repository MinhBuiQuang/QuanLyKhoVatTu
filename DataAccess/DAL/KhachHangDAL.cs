using DataAccess.ObjectsDump;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DAL
{
    public  class KhachHangDAL
    {
       public DataTable getAllKhachHang()
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                dt = db.ExecuteDataSet("sp_KhachHang_Select", new SqlParameter[0]).Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;

        }
        public DataTable getKhachHangByID(String id)
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                dt = db.ExecuteDataSet("sp_KhachHang_Select", new SqlParameter("@IDKh", id)).Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        
        }
        public DataTable getKhachHangByID(int id)
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                dt = db.ExecuteDataSet("sp_KhachHang_Select", new SqlParameter("@IDKh", id)).Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;

        }
        public void insertKhachHang(KhachHangDump kh)
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@TenKhachHang", kh.TenKhachHang),
                    new SqlParameter("@TenCongTy", kh.TenCongTy),
                    new SqlParameter("@SoDienThoai", kh.SoDienThoai),
                    new SqlParameter("@DiaChi", kh.DiaChi),
                    new SqlParameter("@Masothue", kh.MaSoThue),
                    new SqlParameter("@GhiChu", kh.GhiChu),
                    
                };
                db.ExecuteNonQuery("sp_KhachHang_Insert", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public void updateKhachHang(KhachHangDump kh)
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@IDKh", kh.IDKhachHang),
                    new SqlParameter("@TenKhachHang", kh.TenKhachHang),
                    new SqlParameter("@TenCongTy", kh.TenCongTy),
                    new SqlParameter("@SoDienThoai", kh.SoDienThoai),
                    new SqlParameter("@DiaChi", kh.DiaChi),
                    new SqlParameter("@Masothue", kh.MaSoThue),
                    new SqlParameter("@GhiChu", kh.GhiChu),

                };
                db.ExecuteNonQuery("sp_KhachHang_Update", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
