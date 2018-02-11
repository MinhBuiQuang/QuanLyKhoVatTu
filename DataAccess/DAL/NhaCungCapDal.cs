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
    public class NhaCungCapDAL
    {
        public DataTable getAllNhaCungCap()
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                dt = db.ExecuteDataSet("sp_NhaCungCap_Select", new SqlParameter[0]).Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;

        }
        public DataTable getNhaCungCapByID(string id)
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                dt = db.ExecuteDataSet("sp_NhaCungCap_Select", new SqlParameter("@IdNhaCungCap", id)).Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;

        }
        public DataTable getNhaCungCapByID(int id)
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                dt = db.ExecuteDataSet("sp_NhaCungCap_Select", new SqlParameter("@ID", id)).Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;

        }
        public void insertNhaCungCap(NhaCungCapDump ncc)
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                   
                    new SqlParameter("@TenNhaCungCap", ncc.TenNhaCungCap),
                    new SqlParameter("@SoDienThoai", ncc.SoDienThoai),
                    new SqlParameter("@GhiChu", ncc.GhiChu),

                };
                db.ExecuteNonQuery("sp_NhaCungCap_Insert", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void updateNhaCungCap(NhaCungCapDump ncc)
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@IDNhaCungCap", ncc.IDNhaCungCap),
                    new SqlParameter("@TenNhaCungCap", ncc.TenNhaCungCap),
                    new SqlParameter("@SoDienThoai", ncc.SoDienThoai),
                    new SqlParameter("@GhiChu", ncc.GhiChu),

                };
                db.ExecuteNonQuery("sp_NhaCungCap_Update", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
