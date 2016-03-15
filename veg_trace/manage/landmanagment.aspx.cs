using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class manage_landmanagment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource3.SelectParameters["land_id"].DefaultValue = DropDownList1.Text.ToString().Trim();
        DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
       
        SqlDataSource4.SelectParameters["farmer_name"].DefaultValue = ddl.Text.ToString().Trim();
        DataView dv1 = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
        

        string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);
        con.Open();
        string str = "select count(*) from landmanagement where land_id='" + DropDownList1.Text.ToString().Trim() + "'";
        SqlCommand com = new SqlCommand(str, con);
        int intcont = Convert.ToInt32(com.ExecuteScalar());
        if (intcont > 0)//判断数据库中是否有相同的录 
        {
            Response.Write("<script>alert('对不起!不允许填写相同记录！!')</script>"); 
        }
        else
        {
            try
            {
                //插入命令 
                string sqlstr = "insert into landmanagement (land_id,farmer_id,farmer_name,area,address,well) values(@land_id,@farmer_id,@farmer_name,@area,@address,@well)";
                SqlCommand mycom = new SqlCommand(sqlstr, con);
                //添加参数 
                mycom.Parameters.Add(new SqlParameter("@land_id", SqlDbType.VarChar, 20));
                mycom.Parameters.Add(new SqlParameter("@farmer_id", SqlDbType.VarChar, 20));
                mycom.Parameters.Add(new SqlParameter("@farmer_name", SqlDbType.VarChar, 20));
                mycom.Parameters.Add(new SqlParameter("@area", SqlDbType.Money, 20));
                mycom.Parameters.Add(new SqlParameter("@address", SqlDbType.Char, 20));
                mycom.Parameters.Add(new SqlParameter("@well", SqlDbType.Char, 20));
                //给参数赋值 
                mycom.Parameters["@land_id"].Value = DropDownList1.Text.ToString().Trim();
                mycom.Parameters["@farmer_id"].Value = dv1.Table.Rows[0][0].ToString().Trim();
                mycom.Parameters["@farmer_name"].Value = ddl.Text.ToString().Trim();
                mycom.Parameters["@area"].Value = dv.Table.Rows[0][1].ToString().Trim();
                mycom.Parameters["@address"].Value = dv.Table.Rows[0][2].ToString().Trim();
                mycom.Parameters["@well"].Value = dv.Table.Rows[0][3].ToString().Trim();
                //执行添加语句 
                mycom.ExecuteNonQuery();
                con.Close();
                //BindData();
                
                Response.Write("<script>alert('添加成功')</script>");
                GridView1.DataBind();
                ddl.DataBind();
                DropDownList1.DataBind();
            }
            catch (Exception ex)
            {
                //Response.Write(ex.Messgae.ToString());
            }
        }   
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        GridView1.DataBind();
    }
}