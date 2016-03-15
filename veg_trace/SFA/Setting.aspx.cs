using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class SFA_Setting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect(".//DataFill.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string path = Server.MapPath("./") + "Frontier\\tjny.INS";
        if (File.Exists(path))
        {
            StreamWriter sw = new StreamWriter(path);

            string w =
                DropDownList_CalMode.SelectedValue + '\n' +
                "tjny.dta\n"+
                "tjny.out\n"+
                DropDownList_funMode.SelectedValue + '\n' +
                DropDownList_logged.SelectedValue + '\n' +
                TextBox_crossSections.Text + '\n' +
                TextBox_period.Text + '\n' +
                TextBox_observations.Text + '\n' +
                TextBox_varNum.Text + '\n' +
                DropDownList_mu.SelectedValue + '\n' +
                DropDownList_oneSetData.SelectedValue + '\n' +
                DropDownList_defaltData.SelectedValue;

            sw.Write(w);
            sw.Close();
            Response.Write("<script>alert('设置成功!')</script>");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect(".//SFA_result.aspx");
    }
}