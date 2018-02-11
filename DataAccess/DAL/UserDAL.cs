using DataAccess.Objects;
using DataAccess.ObjectsDump;
using Newtonsoft.Json;
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
                    new SqlParameter("@IsMale",user.IsMale),
                };
                db.ExecuteNonQuery("sp_User_Update", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void createUser(UserDump user)
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@Username", user.Username),
                    new SqlParameter("@Password", user.Password),
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
                    new SqlParameter("@IsMale",user.IsMale)

                };
                db.ExecuteNonQuery("sp_User_Insert", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public UserDump login(string username,string password)
        {
            DataTable dt = new DataTable();
            DBConnect db = new DBConnect();
            UserDump userDump = null ;
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                    new SqlParameter("@Username", username),
                    new SqlParameter("@Password",  this.CreateMD5(password)),
                 

                };
               dt= db.ExecuteDataSet("sp_User_Login", param).Tables[0];
                if (dt.Rows.Count > 0)
                {


                    String JSONresult = JsonConvert.SerializeObject(dt);

                    userDump = JsonConvert.DeserializeObject<List<UserDump>>(JSONresult)[0];
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return userDump;

        }
        private string CreateMD5(string input)
        {
            // Use input string to calculate MD5 hash
            using (System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create())
            {
                byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
                byte[] hashBytes = md5.ComputeHash(inputBytes);

                // Convert the byte array to hexadecimal string
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("X2"));
                }
                return sb.ToString().ToLower();
            }
        }
    }
}
