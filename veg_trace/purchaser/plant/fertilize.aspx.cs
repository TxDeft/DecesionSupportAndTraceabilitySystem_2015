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

public partial class pages_purchaser_fertilize : System.Web.UI.Page
{
   
    private DropDownList ddl_ferti;
    private DropDownList ddl_origin;
    private DropDownList ddl_use;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        ddl_ferti = (DropDownList)this.FormView1.FindControl("ddl_ferti");
        ddl_origin = (DropDownList)this.FormView1.FindControl("ddl_origin");
        ddl_use = (DropDownList)this.FormView1.FindControl("ddl_use");
        if (IsPostBack)
        {
            //if (FormView1.CurrentMode == FormViewMode.Insert)//在插入模板中，肥料与其来源和用途的联动；
            //{

               
            //    ddl_origin_selectedindexchanged();
            //    ddl_use_selectedindexchanged();
            //}

        }
    
    }
   

     protected void  ddl_origin_selectedindexchanged()
     {
         ddl_origin.Items.Clear();
         this.SqlDataSource6.SelectParameters["supp_item"].DefaultValue = this.ddl_ferti.SelectedValue;
         DataView datav = (DataView)this.SqlDataSource6.Select(DataSourceSelectArguments.Empty);
         foreach (DataRowView dr in datav)
         {
             ListItem li = new ListItem();
             li.Value = dr.Row["supp_name"].ToString();
             li.Text = dr.Row["supp_name"].ToString();
             ddl_origin.Items.Add(li);
         }
     }
    protected void ddl_use_selectedindexchanged()
    {
        ddl_use.Items.Clear();
        this.SqlDataSource6.SelectParameters["supp_item"].DefaultValue = this.ddl_ferti.SelectedValue;
        DataView data = (DataView)this.SqlDataSource6.Select(DataSourceSelectArguments.Empty);
        foreach (DataRowView dr in data)
        {
            ListItem li = new ListItem();
            li.Value = dr.Row["useful"].ToString();
            li.Text = dr.Row["useful"].ToString();
            ddl_use.Items.Add(li);
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
    protected void FormView1_ItemCreated(object sender, EventArgs e)//formview中自动生成当前时间；
    {
        //if (FormView1.CurrentMode == FormViewMode.Insert)
        //{

        //    ((Label)FormView1.Row.FindControl("dateLabel")).Text = DateTime.Now.ToString("yyyyMMdd");
        //}
    }

    protected void ddlIFarmerName_Bound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("请选择","");
        ((DropDownList)FormView1.Row.FindControl("ddlIFarmerName")).Items.Insert(0,item); 
    }
    protected void ddlIFarmerName_SelectedIndexChanged(object sender, EventArgs e)
    {
        ((DropDownList)FormView1.Row.FindControl("ddlILandId")).Items.Clear();

        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        //string cmdstr = "select distinct supp_name from supporter where supp_item=@supp_item";
        string cmdstr = "select land_id from seeding where farmer_name=@farmer_name or @farmer_name is null";
        SqlConnection mycon = new SqlConnection(constr);

        try
        { 
            mycon.Open();
            SqlCommand mycmd = new SqlCommand(cmdstr, mycon);
            mycmd.Parameters.Add("@farmer_name", SqlDbType.VarChar);

            mycmd.Parameters["@farmer_name"].Value = ((DropDownList)FormView1.Row.FindControl("ddlIFarmerName")).SelectedValue.ToString();

            SqlDataReader dr = mycmd.ExecuteReader();
            while (dr.Read())
            {
                ((DropDownList)FormView1.Row.FindControl("ddlILandId")).Items.Add((string)dr["land_id"]);
            }
            dr.Close();
        }
        catch(Exception error)
        {
            throw error;
        }
        finally
        {
            mycon.Close();
            mycon.Dispose();
        }
    }
    protected void ddlIFertilizer_Bound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("请选择", "");
        ((DropDownList)FormView1.Row.FindControl("ddlIFertilizer")).Items.Insert(0, item); 
    }
    protected void ddlIFertilizer_SelectedIndexChanged(object sender, EventArgs e)
    {
        ((DropDownList)FormView1.Row.FindControl("ddlIFertiOrigin")).Items.Clear();

        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        //string cmdstr = "select distinct supp_name from supporter where supp_item=@supp_item";
        string cmdstr = "select distinct supp_name from supporter where supp_item=@supp_item or @supp_item is null";
        SqlConnection mycon = new SqlConnection(constr);

        try
        {
            mycon.Open();
            SqlCommand mycmd = new SqlCommand(cmdstr, mycon);
            mycmd.Parameters.Add("@supp_item", SqlDbType.VarChar);

            mycmd.Parameters["@supp_item"].Value = ((DropDownList)FormView1.Row.FindControl("ddlIFertilizer")).SelectedValue.ToString();

            SqlDataReader dr = mycmd.ExecuteReader();
            while (dr.Read())
            {
                ((DropDownList)FormView1.Row.FindControl("ddlIFertiOrigin")).Items.Add((string)dr["supp_name"]);
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
