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

public partial class pages_purchaser_irrigation : System.Web.UI.Page
{
   
    private DropDownList ddl_land;
    private DropDownList ddl_well;
   
    protected void Page_Load(object sender, EventArgs e)
    {
       
        ddl_land = (DropDownList)this.FormView1.FindControl("ddl_land");
        ddl_well = (DropDownList)this.FormView1.FindControl("ddl_well");
        
        if (IsPostBack)
        {
            //if (FormView1.CurrentMode == FormViewMode.Insert)//在插入模板中，农户种植地块和地块井源的联动；
            //{

               
            //    ddl_well_selectedindexchanged();
            // }

        }
    }
  
    protected void ddl_well_selectedindexchanged()
    {
        if (ddl_land.Text != "")
        {
            ddl_well.Items.Clear();
            this.SqlDataSource3.SelectParameters["farmer_name"].DefaultValue = this.ddl_land.SelectedValue;
            DataView datav = (DataView)this.SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView dr in datav)
            {
                ListItem li = new ListItem();
                li.Value = dr.Row["well"].ToString();
                li.Text = dr.Row["well"].ToString();
                ddl_well.Items.Add(li);
            }
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

        //if (FormView1.CurrentMode == FormViewMode.Insert)
        //{

        //    ((Label)FormView1.Row.FindControl("dateLabel")).Text = DateTime.Now.ToString("yyyyMMdd");
        //}
       
    }
    protected void ddlIFarmerName_Bound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("请选择","");
        ((DropDownList)FormView1.FindControl("ddlIFarmerName")).Items.Insert(0,item);

    }
    protected void ddlIFarmerName_SelectedIndexChanged(object sender, EventArgs e)//农户姓名改变时，地块编号联动
    {
        //((DropDownList)FormView1.Row.FindControl("ddlILandId")).Items.Clear();

        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
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

    protected void ddl_land_SelectedIndexChanged(object sender, EventArgs e)//地块编号改变时，自动载入水井号
    {
        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        string cmdstr = "select well from land where land_id=@land_id or @land_id is null";
        SqlConnection mycon = new SqlConnection(constr);

        try
        {
            mycon.Open();
            SqlCommand mycmd = new SqlCommand(cmdstr, mycon);
            mycmd.Parameters.Add("@land_id", SqlDbType.VarChar);

            mycmd.Parameters["@land_id"].Value = ((DropDownList)FormView1.Row.FindControl("ddlILandId")).SelectedValue.ToString();

            SqlDataReader dr = mycmd.ExecuteReader();
            while (dr.Read())
            {
                ((Label)FormView1.Row.FindControl("lblIWell")).Text = (string)dr["well"];
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
