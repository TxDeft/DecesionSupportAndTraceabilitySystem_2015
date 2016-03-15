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

public partial class pages_purchaser_purchase : System.Web.UI.Page
{
    private DropDownList ddl_item;
    private DropDownList ddl_supper;
    private DropDownList ddl_worker;
    private DropDownList ddl_id;
    protected void Page_Load(object sender, EventArgs e)
    {

        ddl_item = (DropDownList)this.FormView1.FindControl("ddl_item");
        ddl_supper = (DropDownList)this.FormView1.FindControl("ddl_supper");
        ddl_worker = (DropDownList)this.FormView1.FindControl("ddl_worker");
        ddl_id =(DropDownList )this .FormView1 .FindControl ("ddl_id");
        if (IsPostBack)
        {
            //if (FormView1.CurrentMode == FormViewMode.Insert)//在插入模板中，采购物品与供应商的联动，采购人员与其ID的联动，
            //{

            //    ddl_veg_selectedindexchanged();
            //    ddl_id_selectedindexchanged();
            //}
        
        }
    }
    //protected void ddl_veg_selectedindexchanged()
    //{
    //    ddl_supper.Items.Clear();
    //    this.SqlDataSource5.SelectParameters["supp_item"].DefaultValue = this.ddl_item.SelectedValue;
    //    DataView datar = (DataView)this.SqlDataSource5.Select(DataSourceSelectArguments.Empty);
    //    foreach (DataRowView dr in datar)
    //    {
    //        ListItem li = new ListItem();
    //        li.Value = dr.Row["supp_name"].ToString();
    //        li.Text = dr.Row["supp_name"].ToString();
    //        ddl_supper.Items.Add(li);
    //    }
    //}

    //protected void ddl_id_selectedindexchanged()
    //{
    //    ddl_id.Items.Clear();
    //    this.SqlDataSource6.SelectParameters["worker_name"].DefaultValue = this.ddl_worker.SelectedValue;
    //    DataView datav = (DataView)this.SqlDataSource6.Select(DataSourceSelectArguments.Empty);
    //    foreach (DataRowView dr in datav)
    //    {
    //        ListItem li = new ListItem();
    //        li.Value = dr.Row["worker_id"].ToString();
    //        li.Text = dr.Row["worker_id"].ToString();
    //        ddl_id.Items.Add(li);
    //    }
    //}

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
    protected void FormView1_ItemCreated(object sender, EventArgs e)//formview中自动生成当前时间；
    {
        //if (FormView1.CurrentMode == FormViewMode.Insert)
        //{

        //    ((Label)FormView1.Row.FindControl("dateLabel")).Text = DateTime.Now.ToString("yyyyMMdd");
        //}
    }
    protected void ddlIItem_Bound(object sender, EventArgs e)//插入模板中，给采购物品下拉菜单添加首项“请选择”
    {
        ListItem item = new ListItem("请选择","");
        ((DropDownList)FormView1.FindControl("ddlIItem")).Items.Insert(0,item);
    }
    protected void ddlIItem_SelectedIndexChanged(object sender, EventArgs e)//采购物品和采购公司联动
    {
        ((DropDownList)FormView1.Row.FindControl("ddlISuppName")).Items.Clear();

        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        string cmdstr = "select supp_name from supporter where supp_item=@supp_item";
        SqlConnection mycon = new SqlConnection(constr);

        try
        {
            mycon.Open();
            SqlCommand mycmd = new SqlCommand(cmdstr, mycon);
            mycmd.Parameters.Add("@supp_item", SqlDbType.VarChar);
            mycmd.Parameters["@supp_item"].Value = ((DropDownList)FormView1.Row.FindControl("ddlIItem")).SelectedValue.ToString();

            SqlDataReader dr = mycmd.ExecuteReader();
            while (dr.Read())
            {
                ((DropDownList)FormView1.Row.FindControl("ddlISuppName")).Items.Add((string)dr["supp_name"]);
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

    protected void ddlIWorker_Bound(object sender, EventArgs e)//插入模板中，给采购人下拉菜单添加首项“请选择”
    {
        ListItem item = new ListItem("请选择","");
        ((DropDownList)FormView1.FindControl("ddlIWorker")).Items.Insert(0, item);
    }

    protected void ddlIWorker_SelectedIndexChanged(object sender, EventArgs e)//采购人姓名和采购人id联动
    {
        ((DropDownList)FormView1.Row.FindControl("ddlIWorkerId")).Items.Clear();

        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        string cmdstr = "select worker_id from worker where worker_name=@worker_name";
        SqlConnection mycon = new SqlConnection(constr);

        try
        {
            mycon.Open();
            SqlCommand mycmd = new SqlCommand(cmdstr, mycon);
            mycmd.Parameters.Add("@worker_name", SqlDbType.VarChar);
            mycmd.Parameters["@worker_name"].Value = ((DropDownList)FormView1.Row.FindControl("ddlIWorker")).SelectedValue.ToString();

            SqlDataReader dr = mycmd.ExecuteReader();
            while (dr.Read())
            {
                ((DropDownList)FormView1.Row.FindControl("ddlIWorkerId")).Items.Add((string)dr["worker_id"]);
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


    protected void ddlIWorkerId_SelectedIndexChanged(object sender, EventArgs e)
    {
        ((DropDownList)FormView1.Row.FindControl("ddlIWorker")).Items.Clear();

        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        string cmdstr = "select worker_name from worker where worker_id=@worker_id";
        SqlConnection mycon = new SqlConnection(constr);

        try
        {
            mycon.Open();
            SqlCommand mycmd = new SqlCommand(cmdstr, mycon);
            mycmd.Parameters.Add("@worker_id", SqlDbType.VarChar);
            mycmd.Parameters["@worker_id"].Value = ((DropDownList)FormView1.Row.FindControl("ddlIWorkerId")).SelectedValue.ToString();

            SqlDataReader dr = mycmd.ExecuteReader();
            while (dr.Read())
            {
                ((DropDownList)FormView1.Row.FindControl("ddlIWorker")).Items.Add((string)dr["worker_name"]);
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
    protected void ddlIWorkerId_Bound(object sender, EventArgs e)//工作人员代码下拉列，添加 请选择项
    {
        ListItem item = new ListItem("请选择","");
        ((DropDownList)FormView1.FindControl("ddlIWorkerId")).Items.Insert(0,item);
    }
}
