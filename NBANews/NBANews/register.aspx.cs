using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace NBANews
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx");
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (this.CheckBox1.Checked == true)
            {
                this.Button1.Enabled = true;
            }
            else
            {
                this.Button1.Enabled = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string UserName = this.TextBox1.Text;
            string UserPwd = this.TextBox2.Text;
            string Email = this.TextBox3.Text; ;

            if (UserName == "" || UserPwd == "" || Email == "")
            {
                this.Label4.Text = "请将信息填写完整！";
            }
            else if (UserPwd.Length < 6 || UserPwd.Length > 20)
            {
                this.Label4.Text = "密码长度不得小于6位数或大于20位数！";
            }
            else if (UserPwd != this.TextBox5.Text)
            {
                this.Label4.Text = "第二次输入的密码与第一次不相同！";
            }
            else if (Regex.IsMatch(Email, "^[a-zA-Z0-9]+@[a-zA-Z0-9]+[\'.']com$") == false)
            {
                this.Label4.Text = "电子邮箱格式不正确！";
            }
            else
            {
                Entity.UserInfo UserInfo = new Entity.UserInfo();
                UserInfo.UserName = UserName;
                UserInfo.UserPwd = UserPwd;
                UserInfo.Email = Email;

                if(BLL.UserInfo_BLL.insertUserInfo(UserInfo))
                    Response.Write("<script>alert('注册成功！');window.location.href='Login.aspx';</script>");
                else
                    Response.Write("<script>alert('注册失败！')</script>");
            }
        }
    }
}