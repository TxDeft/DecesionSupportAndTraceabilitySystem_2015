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

public partial class pages_purchaser_plantplan : System.Web.UI.Page
{
   
    //private DropDownList ddl_veg;
    //private DropDownList ddl_origin;
      
   protected void Page_Load(object sender, EventArgs e)
    {
        //付晓原来
        //ddl_veg = (DropDownList)this.FormView1.FindControl("ddl_veg");
        //ddl_origin = (DropDownList)this.FormView1.FindControl("ddl_origin");

        //if (IsPostBack)
        //{
        //    if (FormView1.CurrentMode == FormViewMode.Insert)//在插入模板中，计划种植的品种与其供应商的联动；
        //    {

        //        ddl_origin_selectedindexchanged();
        //    }
        //}
        

    }
   


    //protected void ddl_origin_selectedindexchanged()
    //{
    //    ddl_origin.Items.Clear();
    //    this.SqlDataSource5.SelectParameters["supp_item"].DefaultValue = this.ddl_veg.SelectedValue;
    //    DataView datav = (DataView)this.SqlDataSource5.Select(DataSourceSelectArguments.Empty);
    //    foreach (DataRowView dr in datav)
    //    {
    //        ListItem li = new ListItem();
    //        li.Value = dr.Row["supp_name"].ToString();
    //        li.Text = dr.Row["supp_name"].ToString();
    //        ddl_origin.Items.Add(li);
    //     }
    
    //}


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)//formview与gridview的联动；
    {
        
        FormView1.PageIndex = GridView1.SelectedIndex + GridView1.PageIndex * GridView1.PageSize;
        FormView1.DataBind();
       
    }

    protected void FormView1_ItemCreated(object sender, EventArgs e)//formview中自动生成当前时间；
    {
        //if (FormView1.CurrentMode == FormViewMode.Insert)
        //{
            
        //    ((Label)FormView1.Row.FindControl("lblDate")).Text = DateTime.Now.ToString("yyyyMMdd");
        //}
    }
    protected void ddl1_DataBound(object sender, EventArgs e)//利用查询下拉菜单控制GridView显示全部表信息；
    {
        ListItem item = new ListItem("全部", "");
        ddl1.Items.Insert(0, item);
    }

    protected void ddlEVegItem_SelectedIndexChanged(object sender, EventArgs e)//编辑模式下，种子名称和种子来源的联动
    {
        ((DropDownList)FormView1.Row.FindControl("ddlEVegOrign")).Items.Clear();

        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        //string cmdstr = "select distinct supp_name from supporter where supp_item=@supp_item";
        string cmdstr = "select distinct supp_name from supporter where supp_item=@supp_item or @supp_item is null";
        SqlConnection mycon = new SqlConnection(constr);
        
        mycon.Open();
        SqlCommand mycmd = new SqlCommand(cmdstr, mycon);
        mycmd.Parameters.Add("@supp_item", SqlDbType.VarChar);

        mycmd.Parameters["@supp_item"].Value = ((DropDownList)FormView1.Row.FindControl("ddlEVegItem")).SelectedValue.ToString();

        SqlDataReader dr = mycmd.ExecuteReader();
        while (dr.Read())
        {
            ((DropDownList)FormView1.Row.FindControl("ddlEVegOrign")).Items.Add((string)dr["supp_name"]);
        }
        dr.Close();

        //SqlDataAdapter da = new SqlDataAdapter(mycmd);
        //DataSet ds = new DataSet();
        //da.Fill(ds, "suppName");

        //((DropDownList)FormView1.Row.FindControl("ddlEVegOrign")).DataSource = ds.Tables["suppName"].DefaultView;
        //((DropDownList)FormView1.Row.FindControl("ddlEVegOrign")).DataTextField = "supp_name";
        //((DropDownList)FormView1.Row.FindControl("ddlEVegOrign")).DataValueField = "supp_name";
        //((DropDownList)FormView1.Row.FindControl("ddlEVegOrign")).DataBind();
        mycon.Close();
        mycon.Dispose();
    }
    protected void ddlEFarmerName_SelectedIndexChanged(object sender, EventArgs e)//插入模式下，
    {
        ((DropDownList)FormView1.Row.FindControl("ddlELandId")).Items.Clear();
        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        string cmdstr = "select land_id from landmanagement where farmer_name=@farmer_name";
        SqlConnection mycon = new SqlConnection(constr);
        try
        {
            mycon.Open();
            SqlCommand mycmd = new SqlCommand(cmdstr, mycon);
            mycmd.Parameters.Add("@farmer_name", SqlDbType.VarChar);

            mycmd.Parameters["@farmer_name"].Value = ((DropDownList)FormView1.Row.FindControl("ddlEFarmerName")).SelectedValue.ToString();

            SqlDataReader dr = mycmd.ExecuteReader();
            while (dr.Read())
            {
                ((DropDownList)FormView1.Row.FindControl("ddlELandId")).Items.Add((string)dr["land_id"]);
            }
            dr.Close();

            //SqlDataAdapter da = new SqlDataAdapter(mycmd);
            //DataSet ds = new DataSet();
            //da.Fill(ds, "landmanagement");

            //((DropDownList)FormView1.Row.FindControl("ddlELandId")).DataSource = ds.Tables["landmanagement"].DefaultView;
            //((DropDownList)FormView1.Row.FindControl("ddlELandId")).DataTextField = "land_id";
            //((DropDownList)FormView1.Row.FindControl("ddlELandId")).DataValueField = "land_id";
            //((DropDownList)FormView1.Row.FindControl("ddlELandId")).DataBind();
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
    protected void ddl_veg_SelectedIndexChanged(object sender, EventArgs e)
    {
        ((DropDownList)FormView1.Row.FindControl("ddlIVegOrigin")).Items.Clear();

        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        //string cmdstr = "select distinct supp_name from supporter where supp_item=@supp_item";
        string cmdstr = "select distinct supp_name from supporter where supp_item=@supp_item or @supp_item is null";
        SqlConnection mycon = new SqlConnection(constr);

        mycon.Open();
        SqlCommand mycmd = new SqlCommand(cmdstr, mycon);
        mycmd.Parameters.Add("@supp_item", SqlDbType.VarChar);

        mycmd.Parameters["@supp_item"].Value = ((DropDownList)FormView1.Row.FindControl("ddlIVegItem")).SelectedValue.ToString();

        SqlDataReader dr = mycmd.ExecuteReader();
        while (dr.Read())
        {
            ((DropDownList)FormView1.Row.FindControl("ddlIVegOrigin")).Items.Add((string)dr["supp_name"]);
        }
        dr.Close();
        mycon.Close();
        mycon.Dispose();
    }

    protected void ddlIVegItem_DataBound(object sender, EventArgs e)//插入模式下，初始载入绑定时，蔬菜品种添加一个“请选择”
    {
        ListItem item = new ListItem("请选择", "");
        ((DropDownList)this.FormView1.FindControl("ddlIVegItem")).Items.Insert(0, item);
    }
}
