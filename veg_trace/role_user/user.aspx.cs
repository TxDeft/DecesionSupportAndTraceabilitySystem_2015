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

public partial class role_user_user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvUser.DataSource = Membership.GetAllUsers();
            gvUser.DataBind();
            gvRole.DataSource = Roles.GetAllRoles();
            gvRole.DataBind();
        }
    }

    protected void linkbuttonclick(object sender, CommandEventArgs e)
    {
        //处理添加角色
        //if (e.CommandArgument.Equals("addrole"))
        if (e.CommandName.Equals("addrole"))
        {
            //如果当前没有角色，则重定向创建新角色
            if (Roles.GetAllRoles().Length == 0)
            {
                //Response.Redirect("/veg_trace-management/role_user/add_role.aspx");
                Response.Redirect("~/role_user/add_role.aspx");
                return;
            }

            //显示角色信息，主要设置CheckBox的选中状态
            string username = e.CommandArgument.ToString();
            gvRole.Caption = "设置用户<b>" + username + "<b>的角色";
            for (int i = 0; i < Roles.GetAllRoles().Length; i ++ )
            {
                CheckBox cb = (CheckBox)gvRole.Rows[i].FindControl("cbaddRoletoUser");
                string rolename = cb.ToolTip;
                cb.Checked = Roles.IsUserInRole(username, rolename);
                //将用户信息传递到显示角色信息的列表中
                cb.Attributes["user"] = username;
            }
                pllistrole.Visible =true ;
        }
    }

    protected void addroletousercheckbox_click(object sender, EventArgs e)
    {
        try
        {
            //为用户分配角色
            CheckBox cbaddaddRoletoUser = (CheckBox)sender;
            string username = cbaddaddRoletoUser.Attributes["user"];
            string rolename = cbaddaddRoletoUser.ToolTip;
            //如果用户已经分配角色，点击CheckBox后为去掉勾（表示删除分配）；反之为添加角色
            if (!cbaddaddRoletoUser.Checked)
            {
                Roles.RemoveUserFromRole(username, rolename);
            }
            else
            {
                for (int i = 0; i < Roles.GetAllRoles().Length; i++)
                {
                    
                    CheckBox cb = (CheckBox)gvRole.Rows[i].FindControl("cbaddRoletoUser");
                    string rolename1 = cb.ToolTip;
                    if(rolename1!=rolename&&cb.Checked==true)
                    {
                        cb.Checked = false;
                        Roles.RemoveUserFromRole(username, rolename1);
                    }
                }

                Roles.AddUserToRole(username, rolename);
            }        
                 lbMessage.Text = "更新成功！";
        }
        catch (System.Configuration.Provider.ProviderException ex)
        {
            //抛出异常
            lbMessage.Text = ex.Message ;
        }
    }
}
