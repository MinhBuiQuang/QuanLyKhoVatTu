using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DAL
{
    public class QuyenDAL
    {
        DBConnect db = new DBConnect();
        public DataTable GetQuyen()
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                dt = db.ExecuteDataSet("sp_Quyen_Select", new SqlParameter[0]).Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }

        public void Insert(Objects.Quyen dv)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@TenQuyen", dv.TenQuyen)
                };
                db.ExecuteNonQuery("sp_Quyen_Insert", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Update(Objects.Quyen dv)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@IDQuyen", dv.IDQuyen),
                    new SqlParameter("@TenQuyen", dv.TenQuyen)
                };
                db.ExecuteNonQuery("sp_Quyen_Update", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Delete(int IDQuyen)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@IDQuyen", IDQuyen)
                };
                db.ExecuteNonQuery("sp_Quyen_Delete", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
