using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class pages_purducer_exit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddl1_DataBound(object sender, EventArgs e)//利用查询下拉菜单控制GridView显示全部表信息；
    {
        ListItem item = new ListItem("全部", "");
        ddl1.Items.Insert(0, item);
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)//formview与gridview的联动；
    {
        FormView1.PageIndex = GridView1.SelectedIndex + GridView1.PageIndex * GridView1.PageSize;
        FormView1.DataBind();
       
    }
    protected void FormView1_ItemCreated(object sender, EventArgs e)//formview中自动生成当前时间；
    {
        if (FormView1.CurrentMode == FormViewMode.Insert)
        {

            ((Label)FormView1.Row.FindControl("dateLabel")).Text = DateTime.Now.ToString("yyyyMMdd");
        }
    }
}
