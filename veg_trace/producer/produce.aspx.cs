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

public partial class pages_producer_produce : System.Web.UI.Page
{
    private DropDownList ddl_worker;
    private DropDownList ddl_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        ddl_worker = (DropDownList)this.FormView1.FindControl("ddl_worker");
        ddl_id = (DropDownList)this.FormView1.FindControl("ddl_id");
        if (IsPostBack)
        {
            if (FormView1.CurrentMode == FormViewMode.Insert)
            {

                ddl_workerid_selectedindexchanged();//在插入模板中，加工人员与其ID的联动；
            }

        }
    }
    protected void  ddl_workerid_selectedindexchanged()
     {
        ddl_id.Items.Clear();
        this.SqlDataSource4.SelectParameters["worker_name"].DefaultValue = this.ddl_worker.SelectedValue;
        DataView datav = (DataView)this.SqlDataSource4.Select(DataSourceSelectArguments.Empty);
        foreach (DataRowView dr in datav)
        {
            ListItem li = new ListItem();
            li.Value = dr.Row["worker_id"].ToString();
            li.Text = dr.Row["worker_id"].ToString();
            ddl_id.Items.Add(li);
        }
     }

    protected void ddl1_DataBound(object sender, EventArgs e)//formview与gridview的联动；
    {
        ListItem item = new ListItem("全部", "");
        ddl1.Items.Insert(0, item);
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)//利用查询下拉菜单控制GridView显示全部表信息；
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
