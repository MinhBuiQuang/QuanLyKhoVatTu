using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class DBConnect
    {
        public static string chuoiketnoi = "";
        public DataSet ExecuteDataSet(string procName, params SqlParameter[] procParams)
        {
            SqlConnection conn = null;
            SqlDataAdapter adapter = null;
            DataSet ds = new DataSet();
            SqlCommand cmd = null;
            string paramName = "";
            try
            {
                conn = new SqlConnection(chuoiketnoi);
                cmd = new SqlCommand(procName, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 300;
                if (procParams != null)
                {
                    for (int i = 0; i < procParams.Length; i++)
                    {
                        cmd.Parameters.Add(procParams[i]);
                        paramName += procParams[i].ParameterName + ":" + procParams[i].Value + "|";
                    }
                }
                adapter = new SqlDataAdapter(cmd);
                adapter.Fill(ds);
            }
            catch (Exception ex)
            {
                //log.Error("Command:" + cmd.CommandText + ",Command Parameter:" + paramName);
                //log.Error(ex);

                throw ex;
            }
            finally
            {
                if (cmd != null)
                {
                    cmd.Dispose();
                }
                if (adapter != null)
                {
                    adapter.Dispose();

                }
                if (conn != null && conn.State != ConnectionState.Closed)
                {
                    conn.Close();
                    conn.Dispose();
                }
            }

            return ds;
        }

        public int ExecuteNonQuery(string procName, params SqlParameter[] procParams)
        {
            SqlCommand cmd = null;
            SqlConnection conn = null;
            int affectedRows = 0;
            string paramName = "";
            try
            {
                conn = new SqlConnection(chuoiketnoi);
                conn.Open();
                cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = procName;
                cmd.CommandType = CommandType.StoredProcedure;
                if (procParams != null)
                {
                    for (int i = 0; i < procParams.Length; i++)
                    {
                        cmd.Parameters.Add(procParams[i]);
                        paramName += procParams[i].ParameterName + ":" + procParams[i].Value + "|";
                    }
                }
                affectedRows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                //log.Error("Command:" + cmd.CommandText + ",Command Parameter:" + paramName);
                //log.Error(ex);

                throw ex;
            }
            finally
            {
                if (cmd != null)
                {
                    cmd.Dispose();
                }
                if (conn != null && conn.State != ConnectionState.Closed)
                {
                    conn.Close();
                    conn.Dispose();
                }
            }
            return affectedRows;
        }
    }
}
