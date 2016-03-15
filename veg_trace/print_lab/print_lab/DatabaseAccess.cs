using System;
using System.Collections.Generic;
using System.Text;

using System.Data;
using System.Data.SqlClient;

namespace print_lab
{
    class DatabaseAccess
    {
        private static string constring = "server=" + SConfigure.mydatasource + "; database=" + SConfigure.mydatabase + "; uid=" + SConfigure.username + "; pwd=" + SConfigure.password + "; pooling=true";
        private SqlConnection myconn = new SqlConnection(constring);

       
        /// <summary>
        /// 获取打印信息
        /// </summary>
        /// <param name="trace_num">批次号</param>
        /// <returns>返回数据表</returns>
        public DataTable GetPrinterDataByKeyCode(string keycode)
        {
            string sqlstring = "select * from enter where trace_num=@trace_num";
            SqlCommand mycom = new SqlCommand(sqlstring, myconn);
            DataTable mytable = new DataTable();
            SqlParameter trace_code = new SqlParameter("@trace_num", SqlDbType.NVarChar, 20);
            trace_code.Value = keycode;
            mycom.Parameters.Add(trace_code);
            try
            {
                myconn.Open();
                SqlDataAdapter myda = new SqlDataAdapter(mycom);
                myda.Fill(mytable);
            }
            catch (SqlException myex)
            {
                Console.WriteLine("提交错误类型：{0}", myex.GetType());
                Console.WriteLine("错误信息：{0}", myex.Message);
            }
            finally
            {
                myconn.Close();
            }
            return mytable;
        }
    }
}
