using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace BLL
{
    public class UserInfo_BLL
    {
        public static bool insertUserInfo(Entity.UserInfo UserInfo)
        {
            if (DAL.UserInfo_DAL.insertUserInfo(UserInfo) > 0)
                return true;
            else
                return false;
        }

        public static DataTable uLogin(Entity.UserInfo UserInfo)
        {
            return DAL.UserInfo_DAL.uLogin(UserInfo);
        }

        public static DataTable getUserName(string UserID)
        {
            return DAL.UserInfo_DAL.getUserName(UserID);
        }
    }
}
