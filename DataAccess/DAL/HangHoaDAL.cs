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
                //if (dt.Rows.Count != 0)
                //{
                //    foreach (DataRow dr in dt.Rows)
                //    {
                //        Quyen quyen = new Quyen
                //        {
                //            IDQuyen = int.Parse(dr["IDUser"].ToString()),
                //            TenQuyen = dr["IDUser"].ToString()
                //        };
                //        User obj = new User
                //        {
                //            IDUser = int.Parse(dr["IDUser"].ToString()),
                //            Username = dr["Username"].ToString(),
                //            Ho = dr["Ho"].ToString(),
                //            Ten = dr["IDUser"].ToString(),
                //            SoDienThoai = dr["IDUser"].ToString(),
                //            CMND = dr["IDUser"].ToString(),
                //            QueQuan = dr["IDUser"].ToString(),
                //            DiaChi = dr["IDUser"].ToString(),
                //            LoaiTaiKhoan = quyen,
                //            IsMale = bool.Parse(dr["IDUser"].ToString()),
                //            NgaySinh = DateTime.Parse(dr["IDUser"].ToString()),
                //            NgayVaoLam = DateTime.Parse(dr["IDUser"].ToString())
                //        };
                //        temp.Add(obj);
                //    }
                //}
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }
    }
}
