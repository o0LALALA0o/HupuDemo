using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NBANews
{
    public partial class publishNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.DropDownList1.DataSource = BLL.NBASort_BLLL.getNBASort();
            this.DropDownList1.DataValueField = "NBASortID";
            this.DropDownList1.DataTextField = "NBASortName";
            this.DropDownList1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string NBANewsTitle = this.TextBox1.Text;
            string NBANewsInfo = this.TextBox2.Text;
            string Picture = this.FileUpload1.FileName;
            string NBASortID = this.DropDownList1.SelectedValue;

            if (NBANewsTitle == "" || NBANewsInfo == "")
            {
                this.Label1.Text = "请将信息填写完整！";
            }
            if (!(Picture.EndsWith(".jpg") || Picture.EndsWith(".png")))
            {
                Response.Write("<script>alert('上传图片格式不正确！')</script>");
                return;
            }
            else
            {
                Entity.NBANews NBANews = new Entity.NBANews();
                NBANews.NBANewsTitle = NBANewsTitle;
                NBANews.NBANewsInfo = NBANewsInfo;
                NBANews.Picture = Picture;
                NBANews.NBASortID = NBASortID;
                NBANews.ClickRate = "0";
                NBANews.UserID = Session["UserID"].ToString();
               

                if (BLL.NBANews_BLL.insertNBANews(NBANews) > 0)
                {
                    string strPath = Server.MapPath(@"\img\newsImg\" + Picture);
                    this.FileUpload1.SaveAs(strPath);
                    Response.Write("<script>alert('发布成功！');window.location.href='Main.aspx';</script>");
                }

            }
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx");
        }
    }
}