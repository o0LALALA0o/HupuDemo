using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DAL
{
    public class UserInfo_DAL
    {
        public static int insertUserInfo(Entity.UserInfo UserInfo) 
        {
            string sql = string.Format("insert into UserInfo(UserName,UserPwd,registerDay,Email,permission) values('{0}','{1}','{2}','{3}',3)",UserInfo.UserName,UserInfo.UserPwd,DateTime.Now.ToString(),UserInfo.Email);
            return DBHelper.ExecuteNonQuery(sql);
        }

        public static DataTable uLogin(Entity.UserInfo UserInfo)
        {
            string sql = string.Format("select UserID,permission from UserInfo where UserName='{0}' and UserPwd = '{1}'", UserInfo.UserName, UserInfo.UserPwd);
            return DBHelper.getTable(sql);
        }

        public static DataTable getUserName(string UserID)
        {
            string sql = "select UserName from UserInfo where UserID = " + UserID;
            return DBHelper.getTable(sql);
        }
    }
}
