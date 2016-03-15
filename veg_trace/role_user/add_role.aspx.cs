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

public partial class role_user_add_role : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            gvRoles.DataSource = Roles.GetAllRoles();
            gvRoles.DataBind();
        }
    }

    protected void linkbuttonclick(object sender, CommandEventArgs e)
    {
        //处理角色删除
        if (e.CommandName.Equals("deleterole"))
        {
            string delrole = e.CommandArgument.ToString();
            int temp = Roles.GetUsersInRole(delrole).Length;
            //如果角色中包含有用户，则不能删除
            if (temp != 0)
            {
                lbmessage.Text = "该角色中还包含有用户，因此不能删除！";
                return;
            }
            //调用deleterole方法进行删除
            if (Roles.DeleteRole(delrole))
            {
                gvRoles.DataSource = Roles.GetAllRoles();
                gvRoles.DataBind();
                lbmessage.Text = "删除成功！";
            }
            else
            {
                lbmessage.Text = "未能删除成功！";
            }
        }
    }

    
      protected void  Button1_Click(object sender, EventArgs e)
      {
          string createrole = txt_role.Text;
          //如果角色为空，则要求输入角色名
          if (txt_role.Text == string.Empty)
          {
              lb_role.Text = "请输入角色名";
              return;
          }
          //如果角色不存在，则调用CreateRole方法创建角色；否则显示提示信息
          if (!Roles.RoleExists(createrole))
          {
              Roles.CreateRole(createrole);
              gvRoles.DataSource = Roles.GetAllRoles();
              gvRoles.DataBind();
              lb_role.Text = "添加成功！";
          }
          else
          {
              lb_role.Text = "此角色名已存在。";
          }
      }
}
