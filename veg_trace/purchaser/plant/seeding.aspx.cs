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

public partial class pages_purchaser_seeding : System.Web.UI.Page
{

    private DropDownList ddl_land;
    private DropDownList ddl_seed;
    private DropDownList ddl_origin;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        //ddl_land = (DropDownList)this.FormView1.FindControl("ddl_land");
        //ddl_seed = (DropDownList)this.FormView1.FindControl("ddl_seed");
        //ddl_origin = (DropDownList)this.FormView1.FindControl("ddl_origin");
        if (IsPostBack)
        {
            //if (FormView1.CurrentMode == FormViewMode.Insert)//在插入模板中，种植的地块与其蔬菜品种、种子来源的联动；
            //{

            //    ddl_seed_selectedindexchanged();
            //    ddl_orignin_selectedindexchanged();
            //}
          
        }

    }
  
    protected void ddl_seed_selectedindexchanged()
    {
        if(ddl_land.Text !="")
        {
           ddl_seed.Items.Clear();
           this.SqlDataSource4.SelectParameters["land_id"].DefaultValue = this.ddl_land.SelectedValue;
           DataView datar = (DataView)this.SqlDataSource4.Select(DataSourceSelectArguments.Empty);
           foreach (DataRowView dr in datar)
           {
              ListItem li = new ListItem();
              li.Value = dr.Row["veg_item"].ToString();
              li.Text = dr.Row["veg_item"].ToString();
              ddl_seed.Items.Add(li);
           }
        }
    }
    protected void ddl_orignin_selectedindexchanged()
    {
        if (ddl_land.Text != "")
        {
            ddl_origin.Items.Clear();
            this.SqlDataSource4.SelectParameters["land_id"].DefaultValue = this.ddl_land.SelectedValue;
            DataView datar = (DataView)this.SqlDataSource4.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView dr in datar)
            {
                ListItem li = new ListItem();
                li.Value = dr.Row["veg_origin"].ToString();
                li.Text = dr.Row["veg_origin"].ToString();
                ddl_origin.Items.Add(li);
            }
        }
    }



    protected void ddl1_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("全部", "");
        ddl1.Items.Insert(0, item);
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        FormView1.PageIndex = GridView1.SelectedIndex + GridView1.PageIndex * GridView1.PageSize;
        FormView1.DataBind();
        
    }
    protected void FormView1_ItemCreated(object sender, EventArgs e)
    {
        //if (FormView1.CurrentMode == FormViewMode.Insert)
        //{

        //    ((DropDownList)FormView1.Row.FindControl("ddlIFarmerName"))_DataBound();
        //    //((Label)FormView1.Row.FindControl("dateLabel")).Text = DateTime.Now.ToString("yyyyMMdd");
        //}
    }


    protected void ddlIFarmerName_SelectedIndexChanged(object sender, EventArgs e)
    {
        ((DropDownList)FormView1.Row.FindControl("ddlILandId")).Items.Clear();
        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        string cmdstr = "select land_id,veg_item,veg_origin from plantplan where farmer_name=@farmer_name";
        SqlConnection mycon = new SqlConnection(constr);
        try
        {
            mycon.Open();
            SqlCommand mycmd = new SqlCommand(cmdstr, mycon);
            mycmd.Parameters.Add("@farmer_name", SqlDbType.VarChar);

            mycmd.Parameters["@farmer_name"].Value = ((DropDownList)FormView1.Row.FindControl("ddlIFarmerName")).SelectedValue.ToString();

            SqlDataReader dr = mycmd.ExecuteReader();
            int i = 0;
            while (dr.Read())
            {
                ((DropDownList)FormView1.Row.FindControl("ddlILandId")).Items.Add((string)dr["land_id"]);

                if(i==0)
                {
                    ((Label)FormView1.Row.FindControl("lblIVegItem")).Text = (string)dr["veg_item"];
                    ((Label)FormView1.Row.FindControl("lblISeedOrigin")).Text = (string)dr["veg_origin"];
                }
                i++;
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
    protected void ddlILandId_SelectedIndexChanged(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        string cmdstr = "select veg_item,veg_origin from plantplan where farmer_name=@farmer_name and land_id=@land_id";
        SqlConnection mycon = new SqlConnection(constr);
        try
        {
            mycon.Open();
            SqlCommand mycmd = new SqlCommand(cmdstr, mycon);
            mycmd.Parameters.Add("@farmer_name", SqlDbType.VarChar);
            mycmd.Parameters["@farmer_name"].Value = ((DropDownList)FormView1.Row.FindControl("ddlIFarmerName")).SelectedValue.ToString();
            mycmd.Parameters.Add("@land_id", SqlDbType.VarChar);
            mycmd.Parameters["@land_id"].Value = ((DropDownList)FormView1.Row.FindControl("ddlIlandId")).SelectedValue.ToString();

            SqlDataReader dr = mycmd.ExecuteReader();
            while (dr.Read())
            {
                ((Label)FormView1.Row.FindControl("lblIVegItem")).Text=(string)dr["veg_item"];
                ((Label)FormView1.Row.FindControl("lblISeedOrigin")).Text = (string)dr["veg_origin"];
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
    protected void  ddlIFarmerName_databound(object sender, EventArgs e)//插入模板中，农户姓名ddl绑定前加入初始列
    {
        ListItem item = new ListItem("请选择", "");
        ((DropDownList)FormView1.Row.FindControl("ddlIFarmerName")).Items.Insert(0, item);
    }
}
