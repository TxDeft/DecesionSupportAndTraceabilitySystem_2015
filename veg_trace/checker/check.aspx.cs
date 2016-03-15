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

public partial class checker_check : System.Web.UI.Page
{

    //private DropDownList ddl_land;
    //private DropDownList ddl_veg;
    private DropDownList ddl_worker;
    private DropDownList ddl_wid;

    protected void Page_Load(object sender, EventArgs e)
    {
        //ddl_land = (DropDownList)this.FormView1.FindControl("ddl_land");
        //ddl_veg = (DropDownList)this.FormView1.FindControl("ddl_veg");
        ddl_worker = (DropDownList)this.FormView1.FindControl("ddl_worker");
        ddl_wid = (DropDownList)this.FormView1.FindControl("ddl_wid");
        if (IsPostBack)
        {
            if (FormView1.CurrentMode == FormViewMode.Insert)//在插入模板中，地块与其种植的蔬菜品种、检测人员姓名与其工作ID的联动；
            {

                //ddl_veg_selectedindexchanged();
                ddl_wid_selectedindexchanged();
            }

        }
    }

    //protected void ddl_veg_selectedindexchanged()
    //{
    //    ddl_veg.Items.Clear();
    //    this.SqlDataSource3.SelectParameters["land_id"].DefaultValue = this.ddl_land.SelectedValue;
    //    DataView datar = (DataView)this.SqlDataSource3.Select(DataSourceSelectArguments.Empty);
    //    foreach (DataRowView dr in datar)
    //    {
    //        ListItem li = new ListItem();
    //        li.Value = dr.Row["veg_item"].ToString();
    //        li.Text = dr.Row["veg_item"].ToString();
    //        ddl_veg.Items.Add(li);
    //    }
    //}
    
    protected void ddl_wid_selectedindexchanged()
    {
        ddl_wid.Items.Clear();
        this.SqlDataSource6.SelectParameters["worker_name"].DefaultValue = this.ddl_worker.SelectedValue;
        DataView datav = (DataView)this.SqlDataSource6.Select(DataSourceSelectArguments.Empty);
        foreach (DataRowView dr in datav)
        {
            ListItem li = new ListItem();
            li.Value = dr.Row["worker_id"].ToString();
            li.Text = dr.Row["worker_id"].ToString();
            ddl_wid.Items.Add(li);
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


   
}
