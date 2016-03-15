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

public partial class pages_purducer_order_total : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ddl1_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("全部", "");
        ddl1.Items.Insert(0, item);
    }
}
