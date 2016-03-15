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

public partial class pages_purducer_enter : System.Web.UI.Page
{   
    private DropDownList ddl_land;
    private DropDownList ddl_veg;

    protected void Page_Load(object sender, EventArgs e)
    {
        ddl_land = (DropDownList)this.FormView1.FindControl("ddl_land");
        ddl_veg = (DropDownList)this.FormView1.FindControl("ddl_veg");
        if (IsPostBack)
        {
            if (FormView1.CurrentMode == FormViewMode.Insert)
            {

                ddl_veg_selectedindexchanged();//在插入模板中,地块编号与种植品种的联动；
            }

        }
    }
    protected void ddl_veg_selectedindexchanged()
    {
        ddl_veg.Items.Clear();
        SqlDataSource4.SelectParameters["land_id"].DefaultValue = ddl_land.SelectedValue;
        DataView datav = (DataView)this.SqlDataSource4.Select(DataSourceSelectArguments.Empty);
        foreach (DataRowView dr in datav)
        {
            ListItem li = new ListItem();
            li.Value = dr.Row["veg_item"].ToString();
            li.Text = dr.Row["veg_item"].ToString();
            ddl_veg.Items.Add(li);
        }
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

    protected void Button1_Click(object sender, EventArgs e)//自动形成追溯码；
    {
        Random rd = new Random();
        int num = rd.Next(0, 10);
        ((TextBox)FormView1.Row.FindControl("trace_numTextBox")).Text = ((Label)FormView1.Row.FindControl("dateLabel")).Text + ((DropDownList)FormView1.Row.FindControl("ddl_land")).SelectedValue + num;
        num = rd.Next(0, 10);
        ((TextBox)FormView1.Row.FindControl("trace_numTextBox")).Text += num;
        num = rd.Next(0, 10);
        ((TextBox)FormView1.Row.FindControl("trace_numTextBox")).Text += num;
        
    }
}
