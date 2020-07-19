using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class UserInfo
    {
        //用户ID
        public string UserID { get; set; }

        //用户名
        public string UserName { get; set; }

        //用户密码
        public string UserPwd { get; set; }

        //注册时间
        public string registerDay { get; set; }

        //电子邮箱
        public string Email { get; set; }

        //权限
        public string  permission{ get; set; }
    }
}
