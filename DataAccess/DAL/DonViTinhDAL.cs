using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DAL
{
    public class DonViTinhDAL
    {
        DBConnect db = new DBConnect();
        public DataTable GetDonViTinh()
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                dt = db.ExecuteDataSet("sp_DonViTinh_Select", new SqlParameter[0]).Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }

        public void Insert(Objects.DonViTinh dv)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@DonVi", dv.TenDonVi)
                };
                db.ExecuteNonQuery("sp_DonViTinh_Insert", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Update(Objects.DonViTinh dv)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@IDDonVi", dv.IDDonVi),
                    new SqlParameter("@DonVi", dv.TenDonVi)
                };
                db.ExecuteNonQuery("sp_DonViTinh_Update", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Delete(int IDDonVi)
        {
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@IDDonVi", IDDonVi)
                };
                db.ExecuteNonQuery("sp_DonViTinh_Delete", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
