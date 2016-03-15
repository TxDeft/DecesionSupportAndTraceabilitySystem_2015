using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class SFA_DataFill : System.Web.UI.Page
{
    private int RowsNum=0;
    string path, path_Org; 
    protected void Page_Load(object sender, EventArgs e)
    {
        path= Server.MapPath("./") + "Frontier\\tjny.DTA";//输入绝对路径
        path_Org = Server.MapPath("./") + "Frontier\\org.DTA";//输入绝对路径
        LoadDataFile();
    }

    private void LoadDataFile()
    {
        Table1.Rows.Clear();
        
        string[][] a = new string[200][];
       
        if (File.Exists(path))
        {
            StreamReader sr = new StreamReader(path);
            int num=0;
            while (sr.Peek() > 0)
            {
                string strline = sr.ReadLine();
                if (strline.Length != 0)
                {
                    a[num] = strline.Split('\t');
                    num++;
                }
            }   //存入数组a
           

            RowsNum = num;
            for (int i = 0; i < RowsNum; i++)
            {
                TableRow tb = new TableRow();
                for (int j = 2; j < a[0].Length; j++)
                {
                    TableCell tc = new TableCell();
                    tc.Text = a[i][j];
                    tb.Cells.Add(tc);
                }
                Table1.Rows.Add(tb);
            }

                sr.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if(TextBox1.Text.Length!=0&&TextBox2.Text.Length!=0&&TextBox3.Text.Length!=0&&TextBox4.Text.Length!=0&&TextBox5.Text.Length!=0)
        {
            StreamWriter sw = File.AppendText(path);
            RowsNum++;
            string w = RowsNum.ToString()+'\t'+"1" + '\t' + TextBox5.Text + '\t' + TextBox1.Text + '\t' + TextBox2.Text + '\t' + TextBox3.Text + '\t' + TextBox4.Text+'\n';
            sw.Write(w);
            sw.Close();
           
            LoadDataFile();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        StreamWriter sw = new StreamWriter(path);
        string w = "";
        sw.Write(w);
        sw.Close();

        LoadDataFile();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        StreamWriter sw = new StreamWriter(path);
        StreamReader srOrg = new StreamReader(path_Org);
        string org = srOrg.ReadToEnd();
        sw.Write(org);

        sw.Close();
        LoadDataFile();

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect(".//Setting.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect(".//SFA_result.aspx");
    }
}