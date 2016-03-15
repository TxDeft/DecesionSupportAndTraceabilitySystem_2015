using System;
using System.Data;
using System.Configuration;
using System.Web.UI;
using ThoughtWorks.QRCode;
using ThoughtWorks.QRCode.Codec;
using ThoughtWorks.QRCode.Codec.Data;
using System.Data;
using System.Drawing;

using System.Text;

using System.Data.SqlClient;

public partial class qualityInfoVegetable : System.Web.UI.Page
{
    private string traceCode = "";
    private string gtin = "";
    private string traceNum = "";
    private string landId = "";
    private string date = "";
    private string sequence = "";
    private string plantDate = "";
    private string QRCode_Info="";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            traceCode = Request.QueryString["traceCode"].ToString();

            if (traceCode != "0")
            {
                //gtin = traceCode.Substring(4, 13);
                //traceNum = traceCode.Substring(21, 15);
                //date = traceCode.Substring(21, 8);
                //landId = traceCode.Substring(29, 4);
                //sequence = traceCode.Substring(33, 3);

                traceNum = traceCode;
                date = traceCode.Substring(0,8);
                landId = traceCode.Substring(8,4);
                sequence = traceCode.Substring(12,3);
                QRCode_Info = "";
                GetProductName();
                GetBaseInfo();
                GetSeedInfo();
                //GetCompanyInfo();
                GetPreventionInfo();
                GetIrrigationInfo();
                GetFertilize();
                QRCodeEncoder codeEncoder = new QRCodeEncoder();
                codeEncoder.QRCodeScale = 15;//每个小方格的宽度

                codeEncoder.QRCodeVersion = 15;//二维码版本号
                Bitmap bmp = codeEncoder.Encode(QRCode_Info, Encoding.UTF8);
                string path  = Server.MapPath("./")+"label.bmp" ;
                bmp.Save(path);
                Image1.ImageUrl = "~/label.bmp";
                this.lblWelcome.Text = "您好！欢迎使用食品质量安全信息平台！";
            }
        }

    }
    protected void ibtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        //lblMessage.Text = helper.TraceByCode(txtTraceCode.Text.Trim());

        this.lblMessage.Text = "";
        traceCode = txtTraceCode.Text.Trim().ToString();

        this.dtViewBaseInfo.DataSource = null;
        this.dtViewBaseInfo.DataBind();
        this.dtViewCompany.DataSource = null;
        this.dtViewCompany.DataBind();
        this.dtViewProductName.DataSource = null;
        this.dtViewProductName.DataBind();
        this.dtViewSeed.DataSource = null;
        this.dtViewSeed.DataBind();

        this.gdViewFertilize.DataSource = null;
        this.gdViewFertilize.DataBind();
        this.gdViewIrrigation.DataSource = null;
        this.gdViewIrrigation.DataBind();
        this.gdViewPrevention.DataSource = null;
        this.gdViewPrevention.DataBind();

        if (traceCode == "")
        {
            lblMessage.Text = "追溯码不能为空，请输入正确的追溯码！";
            //HttpContext.Current.Response.Redirect("qualityInfoCattle.aspx?traceCode=0&lblMessage="+lblMessage);
        }
        else if (traceCode.Length != 15)
        {
            lblMessage.Text = "追溯码位数不正确，请重新输入！";
            //HttpContext.Current.Response.Redirect("qualityInfoCattle.aspx?traceCode=0&lblMessage=" + lblMessage);
        }        
        else
        {
            //gtin = traceCode.Substring(4, 13);
            //traceNum = traceCode.Substring(21, 15);
            //date = traceCode.Substring(21, 8);
            //landId = traceCode.Substring(29, 4);
            //sequence = traceCode.Substring(33, 3);

            traceNum = traceCode;
            date = traceCode.Substring(0, 8);
            landId = traceCode.Substring(8, 4);
            sequence = traceCode.Substring(12, 3);

            try
            {
                QRCode_Info = "";
                string constr = System.Configuration.ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
                string cmdstr = "select * from enter where trace_num=@traceNum";
                SqlConnection mycon = new SqlConnection(constr);
                mycon.Open();

                SqlCommand mycmd = new SqlCommand();
                mycmd.Connection = mycon;
                mycmd.CommandText = cmdstr;
                mycmd.Parameters.Add("@traceNum", SqlDbType.VarChar);
                mycmd.Parameters["@traceNum"].Value = traceNum;

                SqlDataReader dr = mycmd.ExecuteReader();

                if (dr.Read())
                {
                    dr.Close();
                    mycon.Close();

                    GetProductName();
                    GetBaseInfo();
                    GetSeedInfo();
                    //GetCompanyInfo();
                    GetPreventionInfo();
                    GetIrrigationInfo();
                    GetFertilize();

                    this.lblWelcome.Text = "您好！欢迎使用食品质量安全信息平台！";
                    //HttpContext.Current.Response.Redirect("qualityInfoVegetable.aspx?traceCode=" + traceCode);
                }
                else
                {
                    this.lblMessage.Text = "追溯码错误,请重新输入!";
                    dr.Close();
                    mycon.Close();
                }

            }
            catch (Exception ex)
            {
                lblMessage.Text = "无法连接数据库，或追溯码输入错误，请稍后再试！";
            }
        }
    }

    //获得产品名称及追溯码
    protected void GetProductName()
    {
        string vegItem = "";

        string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        SqlConnection mycon = new SqlConnection(conStr);
        try
        {
            mycon.Open();
            SqlCommand mycmd = new SqlCommand();
            mycmd.Connection = mycon;
            mycmd.CommandType = CommandType.StoredProcedure;
            mycmd.CommandText = "selectVegitemFromEnterByTracenum";
            mycmd.Parameters.Add("@tracenum", SqlDbType.VarChar);
            mycmd.Parameters["@tracenum"].Value = traceNum;

            vegItem = mycmd.ExecuteScalar().ToString();
        }
        catch (Exception error)
        {
            //this.lblMessage.Text = "处理失败！原因为：" + error.ToString();
        }
        finally
        {
            mycon.Close();

            DataSet ds = new DataSet();
            DataTable mytable = new DataTable();
            ds.Tables.Add(mytable);

            DataColumn mycolumn01 = new DataColumn();
            mycolumn01.DataType = System.Type.GetType("System.String");
            //mycolumn01.Caption = "追溯码";
            mycolumn01.ColumnName = "追溯码";
            DataColumn mycolumn02 = new DataColumn();
            mycolumn02.DataType = System.Type.GetType("System.String");
            //mycolumn02.Caption = "产品名称";
            mycolumn02.ColumnName = "产品名称";

            mytable.Columns.Add(mycolumn01);
            mytable.Columns.Add(mycolumn02);

            DataRow row01;
            row01 = mytable.NewRow();
            row01["追溯码"] = traceCode;
            row01["产品名称"] = vegItem;
            mytable.Rows.Add(row01);
            QRCode_Info += "追溯码：" + traceCode + ' ' + "产品名称：" + vegItem + '\n';

            //绑定数据
            dtViewProductName.DataSource = ds;
            dtViewProductName.DataBind();
        }
    }

    //获取基本信息
    protected void GetBaseInfo()
    {
        string packDate = "";
        DateTime mydate = new DateTime(Convert.ToInt32(date.Substring(0, 4)), Convert.ToInt32(date.Substring(4, 2)), Convert.ToInt32(date.Substring(6, 2)));
        packDate = mydate.ToLongDateString();
        string plantStandard = "有机蔬菜生产标准";
        string checkStandard = "有机蔬菜检验标准";
        string checkResualt = "合格";

        DataSet ds = new DataSet();
        DataTable mytable = new DataTable();
        ds.Tables.Add(mytable);

        DataColumn mycolumn01 = new DataColumn();
        mycolumn01.DataType = System.Type.GetType("System.String");
        //mycolumn01.Caption="包装日期";
        mycolumn01.ColumnName = "包装日期";

        DataColumn mycolumn02 = new DataColumn();
        mycolumn02.DataType = System.Type.GetType("System.String");
        //mycolumn02.Caption="种植标准";
        mycolumn02.ColumnName = "种植标准";

        DataColumn mycolumn03 = new DataColumn();
        mycolumn03.DataType = System.Type.GetType("System.String");
        //mycolumn03.Caption="检验标准";
        mycolumn03.ColumnName = "检验标准";

        DataColumn mycolumn04 = new DataColumn();
        mycolumn04.DataType = System.Type.GetType("System.String");
        //mycolumn04.Caption="检验结果";
        mycolumn04.ColumnName = "检验结果";

        mytable.Columns.Add(mycolumn01);
        mytable.Columns.Add(mycolumn02);
        mytable.Columns.Add(mycolumn03);
        mytable.Columns.Add(mycolumn04);

        DataRow myrow01 = mytable.NewRow();
        myrow01["包装日期"] = packDate;
        myrow01["种植标准"] = plantStandard;
        myrow01["检验标准"] = checkStandard;
        myrow01["检验结果"] = checkResualt;
        mytable.Rows.Add(myrow01);

        dtViewBaseInfo.DataSource = ds;
        dtViewBaseInfo.DataBind();

    }

    //获取播种信息
    protected void GetSeedInfo()
    {
        string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        //string cmdStr = "select top 1 date as 播种日期,seed_origin as 种子来源 from seeding where land_id=@landId order by date";
        string cmdStr = "select date as 播种日期,seed_origin as 种子来源 from seeding where land_id=@landId";
        SqlConnection mycon = new SqlConnection(conStr);

        try
        {
            mycon.Open();
            SqlCommand mycmd = new SqlCommand();
            mycmd.Connection = mycon;
            mycmd.CommandText = cmdStr;
            mycmd.Parameters.Add("@landId", SqlDbType.VarChar);
            mycmd.Parameters["@landId"].Value = landId;

            SqlDataAdapter da = new SqlDataAdapter(mycmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "seeding");
            if (ds.Tables["seeding"].Rows.Count != 0)
            {
                QRCode_Info += "播种记录：";
                for (int i = 0; i < ds.Tables["seeding"].Rows.Count; i++)
                    QRCode_Info += "日期：" + ds.Tables["seeding"].Rows[0]["播种日期"] + " 来源：" + ds.Tables["seeding"].Rows[0]["种子来源"];
                QRCode_Info += '\n';
            }
            dtViewSeed.DataSource = ds;
            dtViewSeed.DataBind();

            //得到播种日期,
            //char[] trimChars ={ '-'};
            //string plantDate2 = (string)ds.Tables["seeding"].Rows[0]["播种日期"];

            //plantDate = plantDate2.Trim(trimChars);
        }
        catch (Exception error)
        {
            //this.lblMessage.Text = "处理失败！原因为：" + error.ToString();
        }
        finally
        {
            mycon.Close();
        }

    }

    //获取生产商信息
    //protected void GetCompanyInfo()
    //{
    //    string constr = ConfigurationManager.ConnectionStrings["QualityInfoConStr"].ConnectionString;
    //    SqlConnection mycon = new SqlConnection(constr);
    //    try
    //    {
    //        mycon.Open();
    //        string cmdstr = "select companyName as '企业名称',companyAddress as '企业地址',companyTel as '联系电话' from produceCompany where gtin='" + gtin + "'";
    //        SqlDataAdapter da = new SqlDataAdapter(cmdstr, mycon);
    //        DataSet ds = new DataSet();
    //        da.Fill(ds, "produceCompany");

    //        this.dtViewCompany.DataSource = ds.Tables["produceCompany"];
    //        this.dtViewCompany.DataBind();
    //    }
    //    catch (Exception e)
    //    {
    //        //this.lblMessage.Text = "处理失败！原因为：" + e.ToString();
    //    }
    //    finally
    //    {
    //        mycon.Close();
    //    }
    //}

    //获取病虫害防治记录

    protected void GetPreventionInfo()
    {
        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        //string cmdstr = "select date as 防治日期,reason as 防治原因,prevent_way as 采取措施 from prevention where land_id=@landId and date>@plantDate";
        string cmdstr = "select date_begin as 开始防治日期,date_end as 结束日期,reason as 防治原因,prevent_way as 采取措施 from prevention where land_id=@landId";
        SqlConnection mycon = new SqlConnection(constr);
        try
        {
            mycon.Open();
            SqlCommand mycmd = new SqlCommand();
            mycmd.Connection = mycon;
            mycmd.CommandText = cmdstr;
            mycmd.Parameters.Add("@landId", SqlDbType.VarChar);
            //mycmd.Parameters.Add("@plantDate", SqlDbType.VarChar);
            mycmd.Parameters["@landId"].Value = landId;
            //mycmd.Parameters["@plantDate"].Value = plantDate;

            SqlDataAdapter da = new SqlDataAdapter(mycmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "prevention");
            if (ds.Tables["prevention"].Rows.Count != 0)
            {
                QRCode_Info += "防治记录：";
                for (int i = 0; i < ds.Tables["prevention"].Rows.Count; i++)
                    QRCode_Info += "日期：" + ds.Tables["prevention"].Rows[0]["开始防治日期"] + "    防治原因：" + ds.Tables["prevention"].Rows[0]["防治原因"] + "    采取措施：" + ds.Tables["prevention"].Rows[0]["采取措施"];
                QRCode_Info += '\n';
            }
            this.gdViewPrevention.DataSource = ds.Tables["prevention"];
            this.gdViewPrevention.DataBind();

            //this.gdViewPrevention.Columns[0].HeaderText = "防治日期";
            //this.gdViewPrevention.Columns[1].HeaderText = "病虫害";
            //this.gdViewPrevention.Columns[2].HeaderText = "方法";

        }
        catch (Exception e)
        {
            //this.lblMessage.Text = "处理失败！原因为：" + e.ToString();
        }
        finally
        {
            mycon.Close();
        }
    }

    //灌溉记录
    protected void GetIrrigationInfo()
    {
        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        string cmdstr = "select date as 灌溉日期,irrigate_amount as 灌溉水量 from irrigation where land_Id=@landId and date>@plantDate";
        SqlConnection mycon = new SqlConnection(constr);
        try
        {
            mycon.Open();
            SqlCommand mycmd = new SqlCommand();
            mycmd.Connection = mycon;
            mycmd.CommandText = cmdstr;
            mycmd.Parameters.Add("@landId", SqlDbType.VarChar);
            mycmd.Parameters.Add("@plantDate", SqlDbType.VarChar);
            mycmd.Parameters["@landId"].Value = landId;
            mycmd.Parameters["@plantDate"].Value = plantDate;

            SqlDataAdapter da = new SqlDataAdapter(mycmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Irrigation");
            if (ds.Tables["Irrigation"].Rows.Count != 0)
            {
                QRCode_Info += "灌溉记录：";
                for (int i = 0; i < ds.Tables["Irrigation"].Rows.Count; i++)
                    QRCode_Info += "日期：" + ds.Tables["Irrigation"].Rows[0]["灌溉日期"] + " 灌溉水量：" + ds.Tables["Irrigation"].Rows[0]["灌溉水量"];
                QRCode_Info += '\n';
            }
            this.gdViewIrrigation.DataSource = ds.Tables["Irrigation"];
            this.gdViewIrrigation.DataBind();

        }
        catch (Exception e)
        {
            //this.lblMessage.Text = "处理失败！原因为：" + e.ToString();
        }
        finally
        {
            mycon.Close();
        }
    }

    //施肥记录
    protected void GetFertilize()
    {
        string constr = ConfigurationManager.ConnectionStrings["vegetableConnectionString"].ConnectionString;
        string cmdstr = "select date as 施肥日期,fertilizer as 肥料名称,ferti_amount as 施肥量,ferti_origin as 肥料来源 from fertilize where land_id=@landId and date>@plantDate";
        SqlConnection mycon = new SqlConnection(constr);
        try
        {
            mycon.Open();
            SqlCommand mycmd = new SqlCommand();
            mycmd.Connection = mycon;
            mycmd.CommandText = cmdstr;
            mycmd.Parameters.Add("@landId", SqlDbType.VarChar);
            mycmd.Parameters.Add("@plantDate", SqlDbType.VarChar);
            mycmd.Parameters["@landId"].Value = landId;
            mycmd.Parameters["@plantDate"].Value = plantDate;

            SqlDataAdapter da = new SqlDataAdapter(mycmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "fertilize");
            if (ds.Tables["fertilize"].Rows.Count != 0)
            {
                QRCode_Info += "施肥记录：";
                for (int i = 0; i < ds.Tables["fertilize"].Rows.Count; i++)
                    QRCode_Info += "日期：" + ds.Tables["fertilize"].Rows[0]["施肥日期"] + " 肥料名称：" + ds.Tables["fertilize"].Rows[0]["肥料名称"] + " 施肥量：" + ds.Tables["fertilize"].Rows[0]["施肥量"];
                QRCode_Info += '\n';
            }
            this.gdViewFertilize.DataSource = ds.Tables["fertilize"];
            this.gdViewFertilize.DataBind();

        }
        catch (Exception e)
        {
            //this.lblMessage.Text = "处理失败！原因为：" + e.ToString();
        }
        finally
        {
            mycon.Close();
        }
    }

}
