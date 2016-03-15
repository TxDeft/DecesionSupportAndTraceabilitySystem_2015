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

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Membership.CreateUser("ls", "1234@");
        //string[] a={"ls"};
        //Roles.AddUsersToRole(a, "admin");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        
        string username = txt_name.Text;
        string password = txt_pwd.Text;

        //MembershipUser m_User = Membership.GetUser(username);
        //if (m_User == null)
        //{
        //    lbl_result.Visible = true;
        //    lbl_result.Text = "用户不存在";
        //}
        //else
        //{
        //    //lbl_result.Text = "邮箱为："+m_User.Email;
        //    m_User.UnlockUser();
        //    string newPwd = m_User.ResetPassword();
        //    m_User.ChangePassword(newPwd, password);
        //    lbl_result.Text = "密码为：" + newPwd;
        //}


        if (Membership.ValidateUser(username, password))
        {
            if (Request.QueryString["returnUrl"] != null)
            {
                FormsAuthentication.RedirectFromLoginPage(username, false);
            }
            else
            {
                this.ImageButton1.Enabled = false;
                FormsAuthentication.SetAuthCookie(username, false);

                Response.Redirect("~/logined/welcome.aspx");
            }

        }
        else
        {
            lbl_result.Visible = true;
            lbl_result.Text = "!无效的用户名或密码，请重新输入";
        }
    }
    // 页面登录框


   
    protected void ImageButton2_Click1(object sender, ImageClickEventArgs e)
    {

        string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        SqlConnection mycon = new SqlConnection(conStr);
        try 
        { 
            mycon.Open();
            String strsql = "select * from enter where trace_num='" + this.txt_code.Text.Trim() + "'";
            SqlCommand mycom = new SqlCommand(strsql, mycon);
            SqlDataReader rd = mycom.ExecuteReader();
            if (rd.Read())
            {                
                HttpContext.Current.Response.Redirect("qualityInfoVegetable.aspx?traceCode=" + this.txt_code.Text.Trim());
            }
            else
            {
                this.lbl_tishi.Text = "此追溯码不存在";
            }
            //追溯条码查询框
        }
        catch(Exception ex)
        {
            Response.Write("无法连接数据库，请与管理员联系！");
        }
        finally
        {
            mycon.Close();
        }
        
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/SFA/Setting.aspx");
    }
}
