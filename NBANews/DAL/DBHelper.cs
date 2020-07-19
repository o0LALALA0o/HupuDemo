using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    class DBHelper
    {
        public static string str = "Data Source=.;Initial Catalog=NBANewsDB;Integrated Security=True";

        public static int ExecuteNonQuery(string sql)
        {
            int i = 0;
            SqlConnection sqlCon = new SqlConnection(str);
            sqlCon.Open();
            SqlCommand sqlCom = new SqlCommand(sql, sqlCon);
            i = sqlCom.ExecuteNonQuery();
            sqlCon.Close();
            return i;
        }

        public static DataTable getTable(string sql)
        { 
            SqlConnection sqlCon = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter(sql, sqlCon);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }
    }
}
