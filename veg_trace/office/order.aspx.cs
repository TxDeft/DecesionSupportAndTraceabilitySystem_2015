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

public partial class office_order : System.Web.UI.Page
{


    private DropDownList ddl_super;
    private DropDownList ddl_sp;

    protected void Page_Load(object sender, EventArgs e)
    {
        //ddl_super = (DropDownList)this.FormView1.Row.FindControl("ddl_super");
        //ddl_sp = (DropDownList)this.FormView1.Row.FindControl("ddl_sp");


        //if (IsPostBack)
        //{
        //    if (FormView1.CurrentMode == FormViewMode.Insert)//在插入模板中，超市名称与超市简写的联动；
        //    {

        //        ddl_super_selectedindexchanged();
        //    }
        //}

    }

    //protected void ddl_super_selectedindexchanged()
    //{

    //    ddl_sp.Items.Clear();
    //    this.SqlDataSource5.SelectParameters["super_name"].DefaultValue = this.ddl_super.SelectedValue;
    //    DataView datav = (DataView)this.SqlDataSource5.Select(DataSourceSelectArguments.Empty);
    //    foreach (DataRowView dr in datav)
    //    {
    //        ListItem li = new ListItem();
    //        li.Value = dr.Row["super"].ToString();
    //        li.Text = dr.Row["super"].ToString();
    //        ddl_sp.Items.Add(li);
    //    }
    //}        




    protected void ddl1_DataBound(object sender, EventArgs e)//利用查询下拉菜单控制GridView显示表全部信息；
    {
        ListItem item = new ListItem("全部", "");
        ddl1.Items.Insert(0, item);
    }



    protected void FormView1_ItemCreated(object sender, EventArgs e)//formview中自动生成当前时间；
    {
        if (FormView1.CurrentMode == FormViewMode.Insert)
        {

            ((TextBox)FormView1.Row.FindControl("txtIDate")).Text = DateTime.Now.ToString("yyyyMMdd");
        }
       
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)//formview与gridview的联动；
    {
        FormView1.PageIndex = GridView1.SelectedIndex + GridView1.PageIndex * GridView1.PageSize;
        FormView1.DataBind();
        
    }
    
    protected void ddlISuperName_Bound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("请选择","");
        ((DropDownList)FormView1.FindControl("ddlISuperName")).Items.Insert(0,item);
    }
    protected void ddlISuperName_SelectedIndexChanged(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        string cmdstr = "select super from supermarket where super_name=@super_name";
        SqlConnection mycon = new SqlConnection(constr);

        try
        {
            mycon.Open();
            SqlCommand mycmd = new SqlCommand(cmdstr, mycon);
            mycmd.Parameters.Add("@super_name", SqlDbType.VarChar);
            mycmd.Parameters["@super_name"].Value = ((DropDownList)FormView1.Row.FindControl("ddlISuperName")).SelectedValue.ToString();

            SqlDataReader dr = mycmd.ExecuteReader();
            while (dr.Read())
            {
                //将日期格式变化后，生成订单
                string date1 = ((TextBox)FormView1.Row.FindControl("txtIDate")).Text;
                ((TextBox)FormView1.Row.FindControl("txtIOrderId")).Text = (string)dr["super"] + date1.Replace("-", "");
                //((TextBox)FormView1.Row.FindControl("txtIOrderId")).Text = (string)dr["super"] +date1.Substring(0,4)+date1.Substring(5,2)+date1.Substring(8,2);

            }
            dr.Close();
        }
        catch (Exception error)
        {
            throw error;
        }
        finally
        {
            mycon.Close();
            mycon.Dispose();
        }
    }
}
