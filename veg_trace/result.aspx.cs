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

public partial class result : System.Web.UI.Page
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
        
    }
  
}
