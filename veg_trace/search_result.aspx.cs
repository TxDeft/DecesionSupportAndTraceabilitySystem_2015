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

public partial class search_result : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string a = Request.QueryString["a"];
        //Response.Write(a);
        lbl_code.Text = a;

        string s1 = a.Substring(8, 4);
        lbl_land.Text = s1;


        string s2 = a.Substring(0, 8);
        lbl_date.Text = s2; 


        this.Panel1.Visible = false;
        this.Panel2.Visible = false;
        this.Panel3.Visible = false;
        this.Panel4.Visible = false;
        this.Panel5.Visible = false;
        this.Panel6.Visible = false;
        this.Panel7.Visible = false;
    }
    protected void btn_look_Click(object sender, EventArgs e)
    {
        string tag = this.ddl_select.SelectedValue.ToString();
        if (tag == "种植信息")
        {
            this.Panel1.Visible = true;
            this.Panel2.Visible = true;
            this.Panel3.Visible = true;
        }
        else
        　　　{
               　if (tag == "检测信息")
            　　{
            　　　this.Panel4.Visible = true;
             　　}
            　　else 
                {
                    if (tag == "加工信息")
                    {
                      this.Panel5.Visible =true;
                    }
                    else 
                    {
                        this.Panel6.Visible=true;
                    }
                }
       　　　 }
    }
}
