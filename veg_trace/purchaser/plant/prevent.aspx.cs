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

public partial class pages_purchaser_prevent : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
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

    protected void FormView1_ItemCreated(object sender, EventArgs e)//formview中自动生成当前时间；
    {
        //if (FormView1.CurrentMode == FormViewMode.Insert)
        //{

        //    ((Label)FormView1.Row.FindControl("dateLabel")).Text = DateTime.Now.ToString("yyyyMMdd");
        //}
    }
    protected void ddlIFarmerName_SelectedIndexChanged(object sender, EventArgs e)//插入模块中，选择农户姓名，地块和蔬菜名联动
    {
        GetLandIdByFarmer();
        GetVegItemByFarmer();

    }

    protected void GetLandIdByFarmer()//农户姓名和地块编号联动 
    {
        ((DropDownList)FormView1.Row.FindControl("ddlILandId")).Items.Clear();
        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        string cmdstr = "select land_id from seeding where farmer_name=@farmer_name";
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

    protected void GetVegItemByFarmer() //农户姓名和蔬菜名联动
    {
        ((DropDownList)FormView1.Row.FindControl("ddlIVegItem")).Items.Clear();

        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        string cmdstr = "select veg_item from seeding where farmer_name=@farmer_name";
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
                ((DropDownList)FormView1.Row.FindControl("ddlIVegItem")).Items.Add((string)dr["veg_item"]);
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

    protected void ddlILandId_SelectedIndexChanged(object sender, EventArgs e)//地块名和蔬菜名联动
    {
        ((DropDownList)FormView1.Row.FindControl("ddlIVegItem")).Items.Clear();

        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        string cmdstr = "select veg_item from seeding where land_id=@land_id";
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
                ((DropDownList)FormView1.Row.FindControl("ddlIVegItem")).Items.Add((string)dr["veg_item"]);
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


    protected void ddlIVegItem_SelectedIndexChanged(object sender, EventArgs e)//蔬菜名和地块联动
    {
        ((DropDownList)FormView1.Row.FindControl("ddlILandId")).Items.Clear();
        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        string cmdstr = "select land_id from seeding where farmer_name=@farmer_name and veg_item=@veg_item";
        SqlConnection mycon = new SqlConnection(constr);
        try
        {
            mycon.Open();
            SqlCommand mycmd = new SqlCommand(cmdstr, mycon);
            mycmd.Parameters.Add("@farmer_name", SqlDbType.VarChar);
            mycmd.Parameters["@farmer_name"].Value = ((DropDownList)FormView1.Row.FindControl("ddlIFarmerName")).SelectedValue.ToString();
            mycmd.Parameters.Add("@veg_item", SqlDbType.VarChar);
            mycmd.Parameters["@veg_item"].Value = ((DropDownList)FormView1.Row.FindControl("ddlIVegItem")).SelectedValue.ToString();


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
    protected void ddlIFarmerName_Bound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("请选择", "");
        ((DropDownList)FormView1.FindControl("ddlIFarmerName")).Items.Insert(0, item);
    }
}
