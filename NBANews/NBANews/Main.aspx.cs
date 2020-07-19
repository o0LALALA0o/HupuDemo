using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace NBANews
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                if (Session["permission"] != null)
                {
                    this.Label2.Text = "欢迎您," + BLL.UserInfo_BLL.getUserName(Session["UserID"].ToString()).Rows[0][0].ToString();
                    this.Label3.Text = "";
                    this.LinkButton2.Visible = false;
                    this.LinkButton3.Visible = false;
                    this.LinkButton4.Visible = true;
                    this.LinkButton5.Visible = true;
                    this.LinkButton6.Visible = true;
                }
                else
                {
                    this.Label2.Text = "欢迎您," + BLL.UserInfo_BLL.getUserName(Session["UserID"].ToString()).Rows[0][0].ToString();
                    this.Label3.Text = "";
                    this.LinkButton2.Visible = false;
                    this.LinkButton3.Visible = false;
                    this.LinkButton6.Visible = true;
                }
                
            }

            DataTable dt = BLL.NBANews_BLL.getNBANewsTitle(1);
           

            this.Repeater1.DataSource = dt;
            this.Repeater1.DataBind();
            this.DataList1.DataSource =BLL.NBANews_BLL.getNBANewsTitleByTop();
            this.DataList1.DataBind();
            this.Label1.Text = "NBA新闻";

        }

     
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {            
            if (e.CommandName == "lbtnT")
            {
                Response.Redirect("NBANewsInfo.aspx?NBANewsID=" + e.CommandArgument.ToString());

            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "lbtnT")
            {
                Response.Redirect("NBANewsInfo.aspx?NBANewsID=" + e.CommandArgument.ToString());

            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            string Search = this.TextBox1.Text;
            DataTable dt = BLL.NBANews_BLL.getNBANewsTitleBySearch(Search);
            if (dt.Rows.Count<1)
            {
                Response.Write("<script>alert('抱歉，没有找到关于"+Search+"的新闻!')</script>");
            }
            else
            {
                this.Label1.Text = "关于“" + Search + "”的新闻";
                this.Repeater1.DataSource = dt;
                this.Repeater1.DataBind();
            }
            
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("publishNews.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageNews.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.Label4.Text = (Convert.ToInt16(this.Label4.Text) - 1).ToString();
            DataTable dt = BLL.NBANews_BLL.getNBANewsTitle(Convert.ToInt16(this.Label4.Text));
            if (dt.Rows.Count == 10)
            {
                this.Button2.Enabled =  true;
            }
            this.Repeater1.DataSource = dt;
            this.Repeater1.DataBind();

            if (Convert.ToInt16(this.Label4.Text) == 1)
            {
                this.Button1.Enabled = false;
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            this.Label4.Text = (Convert.ToInt16(this.Label4.Text) + 1).ToString();
            DataTable dt = BLL.NBANews_BLL.getNBANewsTitle(Convert.ToInt16(this.Label4.Text));
            if (dt.Rows.Count<10)
            {
                this.Button2.Enabled = false;
            }
            this.Repeater1.DataSource = dt;
            this.Repeater1.DataBind();

            if (Convert.ToInt16(this.Label4.Text) != 1)
            {
                this.Button1.Enabled = true;
            }

            
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Main.aspx");
            Page_Load(null, null);
        }


 

        
       

        
    }
}