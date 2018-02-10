using DataAccess.Objects;
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
    public class UserDAL
    {
        public DataTable GetUser()
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                dt = db.ExecuteDataSet("sp_User_Select", new SqlParameter[0]).Tables[0];
              
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }
        public DataTable GetUser(String id)
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                dt = db.ExecuteDataSet("sp_User_Select", new SqlParameter("@IDUser", id)).Tables[0];

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }
        public void UpdateUser(UserDump user)
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@IdUser", user.IDUser),
                    new SqlParameter("@Username", user.Username),
                    new SqlParameter("@Ho", user.Ho),
                    new SqlParameter("@Ten", user.Ten),
                    new SqlParameter("@SoDienThoai", user.SoDienThoai),
                    new SqlParameter("@CMND", user.CMND),
                    new SqlParameter("@NgaySinh", user.NgaySinh),
                    new SqlParameter("@NgayVaoLam", user.NgayVaoLam),
                    new SqlParameter("@QueQuan",user.QueQuan),
                    new SqlParameter("@DiaChi", user.DiaChi),
                    new SqlParameter("@IDQuyen",user.IDQuyen),
                    new SqlParameter("@Avatar",user.Avatar),
                };
                db.ExecuteNonQuery("sp_User_Update", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
