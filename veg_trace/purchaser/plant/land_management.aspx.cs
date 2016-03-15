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
using System.Data.SqlClient;

public partial class pages_purchaser_land_management : System.Web.UI.Page
{
    private DropDownList ddl_land;
    private DropDownList ddl_area;
    private DropDownList ddl_address;
    private DropDownList ddl_well;
    protected void Page_Load(object sender, EventArgs e)
    {

        ddl_land = (DropDownList)this.FormView1.FindControl("ddl_land");
        ddl_area = (DropDownList)this.FormView1.FindControl("ddl_area");
        ddl_address = (DropDownList)this.FormView1.FindControl("ddl_address");
        ddl_well = (DropDownList)this.FormView1.FindControl("ddl_well");
        if (IsPostBack)
        {
            if (FormView1.CurrentMode == FormViewMode.Insert)//在插入模板中，农户与其种植的地块、蔬菜品种、种子来源的联动；
            {

                ddl_area_selectedindexchanged();
                ddl_address_selectedindexchanged();
                ddl_well_selectedindexchanged();
            }
           
        }

    }
    protected void ddl_area_selectedindexchanged()
    {
        ddl_area.Items.Clear();
        this.SqlDataSource6.SelectParameters["land_id"].DefaultValue = this.ddl_land.SelectedValue;
        DataView datav = (DataView)this.SqlDataSource6.Select(DataSourceSelectArguments.Empty);
        foreach (DataRowView dr in datav)
        {
            ListItem li = new ListItem();
            li.Value = dr.Row["area"].ToString();
            li.Text = dr.Row["area"].ToString();
            ddl_area.Items.Add(li);
        }
    }
    protected void ddl_address_selectedindexchanged()
    {
        ddl_address.Items.Clear();
        this.SqlDataSource6.SelectParameters["land_id"].DefaultValue = this.ddl_land.SelectedValue;
        DataView datar = (DataView)this.SqlDataSource6.Select(DataSourceSelectArguments.Empty);
        foreach (DataRowView dr in datar)
        {
            ListItem li = new ListItem();
            li.Value = dr.Row["address"].ToString();
            li.Text = dr.Row["address"].ToString();
            ddl_address.Items.Add(li);
        }
    }
    protected void ddl_well_selectedindexchanged()
    {
        ddl_well.Items.Clear();
        this.SqlDataSource6.SelectParameters["land_id"].DefaultValue = this.ddl_land.SelectedValue;
        DataView datar = (DataView)this.SqlDataSource6.Select(DataSourceSelectArguments.Empty);
        foreach (DataRowView dr in datar)
        {
            ListItem li = new ListItem();
            li.Value = dr.Row["well"].ToString();
            li.Text = dr.Row["well"].ToString();
            ddl_well.Items.Add(li);
        }
    }
   
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)//formview与gridview的联动；
    {
        
        FormView1.PageIndex = GridView1.SelectedIndex + GridView1.PageIndex * GridView1.PageSize;
        FormView1.DataBind();
      
    }

    protected void ddl1_DataBound(object sender, EventArgs e)//利用查询下拉菜单控制GridView显示全部表信息；
    {
        ListItem item = new ListItem("全部", "");
        ddl1.Items.Insert(0, item);
    }
    protected void ddl1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
