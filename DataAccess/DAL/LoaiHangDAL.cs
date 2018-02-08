using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DAL
{
    public class LoaiHangDAL
    {
        DBConnect db = new DBConnect();
        public DataTable GetLoaiHang()
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                dt = db.ExecuteDataSet("sp_LoaiHang_Select", new SqlParameter[0]).Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }

        public void Insert(Objects.LoaiHang dv)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@TenLoai", dv.TenLoai),
                    new  SqlParameter("@GhiChu", dv.GhiChu)
                };
                db.ExecuteNonQuery("sp_LoaiHang_Insert", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Update(Objects.LoaiHang dv)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@IDLoaiHang", dv.IDLoaiHang),
                    new SqlParameter("@TenLoai", dv.TenLoai),
                    new SqlParameter("@GhiChu", dv.GhiChu)
                };
                db.ExecuteNonQuery("sp_LoaiHang_Update", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Delete(int IDLoaiHang)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@IDLoaiHang", IDLoaiHang)
                };
                db.ExecuteNonQuery("sp_LoaiHang_Delete", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
