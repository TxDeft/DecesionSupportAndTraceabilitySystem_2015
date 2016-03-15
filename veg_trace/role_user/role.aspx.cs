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

public partial class role_user_role : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            gvUserList.DataSource = Membership.GetAllUsers();
            gvUserList.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string username = txt_name.Text.Trim();
        string password = txt_pwd.Text.Trim();
        string userEmail = txt_email.Text.Trim();
        string userPwdQuestion = txt_pwdquestion.Text.Trim();
        string userPwdAnswer = txt_pwdanswer.Text.Trim();
        MembershipCreateStatus result;

        Membership.CreateUser(username, password, userEmail, userPwdQuestion, userPwdAnswer, true, out result);
        lblUserCreateMessage.Visible = true;
        gvUserList.DataSource = Membership.GetAllUsers();
        gvUserList.DataBind();
        switch (result)
        {
            case MembershipCreateStatus.Success:
                txt_name.Text = "";
                txt_pwd.Text = "";
                txt_email.Text = "";
                txt_pwdquestion.Text ="";
                txt_pwdanswer.Text = "";
                lblUserCreateMessage.Text = "用户创建成功！";
                break;
            case MembershipCreateStatus.InvalidUserName:
                lblUserCreateMessage.Text = "无效的用户名！";
                break;
            case MembershipCreateStatus.DuplicateUserName:
                lblUserCreateMessage.Text = "重复的用户名！";
                break;
            case MembershipCreateStatus.InvalidPassword:
                lblUserCreateMessage.Text = "无效的密码！";
                break;
            case MembershipCreateStatus.DuplicateEmail:
                lblUserCreateMessage.Text = "重复的电子邮件地址！";
                break;
            case MembershipCreateStatus.InvalidEmail:
                lblUserCreateMessage.Text = "无效的电子邮件地址！";
                break;
            case MembershipCreateStatus.InvalidQuestion:
                lblUserCreateMessage.Text = "无效的密码问题";
                break;
            case MembershipCreateStatus.InvalidAnswer:
                lblUserCreateMessage.Text = "无效的密码答案！";
                break;
            default:
                lblUserCreateMessage.Text = "在创建用户过程中发生错误，请重试！";
                break;

        }
    
    }
    protected void linkbuttonclick(object sender, CommandEventArgs e)
    {
        if (e.CommandName.Equals("edituser")) //如果进行“编辑”，则转到user.aspx页面
        {
            //Response.Redirect("/veg_trace-management/role_user/user.aspx");
            Response.Redirect("~/role_user/user.aspx");
        }

        else if (e.CommandName.Equals("deleteuser"))//如果删除
        {
            if (e.CommandArgument.ToString() == "admin") //如果删除的是admin用户，则提示不能删除
            {
                Response.Write("<script language=javascript>alert('不能删除管理员！')</script>");
            }

            else
            {

                if (Membership.DeleteUser(e.CommandArgument.ToString()))  //如果进行“删除”，则调用deleteuser方法
                {
                    //如果删除的是当前（正在使用的）用户，则退出系统
                    if (e.CommandArgument.ToString() == User.Identity.Name)
                    {
                        FormsAuthentication.SignOut();
                        Response.Write("<script language=javascript>alert('删除你正在使用的用户！')</script>");
                        Response.Redirect("/veg_trace-management/Login.aspx");
                    }
                    else
                    {
                        gvUserList.DataSource = Membership.GetAllUsers();
                        gvUserList.DataBind();
                        lbMessage.Text = "删除成功。";
                    }
                }
                else
                {
                    lbMessage.Text = "未能删除成功。";
                }
            }
        }
        //else //如果查看详细信息
        //{
        //    Response.Redirect("~/role_user/user_detail.aspx");
        //}

    }
    protected void CheckBox_Click(object sender, EventArgs e)
    {
        try
        {
            //更新用户并重新绑定
            CheckBox cbisapproved = (CheckBox)sender;
            string name = cbisapproved.ToolTip;
            MembershipUser mu = Membership.GetUser (name);
            mu.IsApproved = cbisapproved.Checked;
            Membership.UpdateUser(mu);
            gvUserList.DataSource = Membership.GetAllUsers();
            gvUserList.DataBind() ;
            lbMessage .Text  = "更新成功";
        }
        catch (System.Configuration.Provider.ProviderException ex)
        {
            //抛出异常
            lblUserCreateMessage.Text = ex.Message;
        }
    }
    
}
