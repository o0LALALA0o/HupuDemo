using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace NBANews
{
    public partial class NBANewsInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (this.Request.QueryString["NBANewsID"] == null)
            {
                Response.Redirect("Main.aspx");
                
            }
            if (!IsPostBack)
            {
                string NBANewsID = this.Request.QueryString["NBANewsID"].ToString();
                BLL.NBANews_BLL.updateClickRate(NBANewsID);

                DataTable dt = BLL.NBANews_BLL.getNBANewsByNBANewsID(NBANewsID);
                this.Label1.Text = dt.Rows[0]["NBANewsTitle"].ToString();
                this.Repeater1.DataSource = dt;
                this.Repeater1.DataBind();
                this.DataList1.DataSource = BLL.NBANews_BLL.getNBANewsTitleByTop();
                this.DataList1.DataBind();
            }            
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "lbtnT")
            {
                Response.Redirect("NBANewsInfo.aspx?NBANewsID=" + e.CommandArgument.ToString());

            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx");
        }
    }
}