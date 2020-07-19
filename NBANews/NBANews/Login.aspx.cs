using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace NBANews
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.Cookies["info"] != null)
            {
                this.TextBox1.Text = Request.Cookies["info"]["uname"];
                this.TextBox2.Attributes["value"] = Request.Cookies["info"]["upwd"];
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string UserName = this.TextBox1.Text;
            string UserPwd = this.TextBox2.Text;

            if (UserName == "" || UserPwd == "")
            {
                this.Label4.Text = "请将信息填写完整！";
            }
            else if (UserPwd.Length < 6 || UserPwd.Length > 20)
            {
                this.Label4.Text = "密码长度不得小于6位数或大于20位数！";
            }
            else 
            {
                Entity.UserInfo UserInfo = new Entity.UserInfo();
                UserInfo.UserName = UserName;
                UserInfo.UserPwd = UserPwd;

                DataTable dt = BLL.UserInfo_BLL.uLogin(UserInfo);
                if (dt.Rows.Count>0)
                {
                    if (this.CheckBox1.Checked == true)
                    {
                        HttpCookie uinfo = new HttpCookie("info");
                        uinfo.Values["uname"] = UserName;
                        uinfo.Values["upwd"] = UserPwd;
                        uinfo.Expires = DateTime.Now.AddDays(7);
                        Response.Cookies.Add(uinfo);
                    }
                    Session["UserID"] = dt.Rows[0][0].ToString();

                    if (dt.Rows[0][1].ToString() == "1")
                    {
                        Session["permission"] = "true";
                    }

                   
                    Response.Redirect("Main.aspx");
                }
                else
                {
                    this.Label4.Text = "用户名或密码有误！";
                }
            }
        }
    }
}