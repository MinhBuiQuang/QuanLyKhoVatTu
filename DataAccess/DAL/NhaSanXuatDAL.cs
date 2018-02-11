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
    public class NhaSanXuatDAL
    {

        public DataTable getAllNhaSanXuat()
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                dt = db.ExecuteDataSet("sp_NhaSanXuat_Select", new SqlParameter[0]).Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;

        }
        public DataTable getNhaSanXuatByID(String id)
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                dt = db.ExecuteDataSet("sp_NhaSanXuat_Select", new SqlParameter("@IDNhaSanXuat", id)).Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;

        }
        public DataTable getNhaSanXuatByID(int id)
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                dt = db.ExecuteDataSet("sp_NhaSanXuat_Select", new SqlParameter("@IDNhaSanXuat", id)).Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;

        }
        public void updateNhaSanXuat(NhaSanXuatDump nsx)
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {

                    new SqlParameter("@TenNhaSanXuat", nsx.TenNhaSanXuat),
                    new SqlParameter("@IDNhaSanXuat", nsx.IDNhaSanXuat),
                    new SqlParameter("@GhiChu", nsx.GhiChu),

                };
                db.ExecuteNonQuery("sp_NhaSanXuat_Update", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public void insertNhaSanXuat(NhaSanXuatDump nsx)
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {

                    new SqlParameter("@TenNhaSanXuat", nsx.TenNhaSanXuat),
                    new SqlParameter("@GhiChu", nsx.GhiChu),

                };
                db.ExecuteNonQuery("sp_NhaSanXuat_Insert", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

    }
}
