using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.IO;

public partial class SFA_SFA_result : System.Web.UI.Page
{
    string outputFilePath;
    public string data_1992;
    public double[] te;
    protected void Page_Load(object sender, EventArgs e)
    {
        double[] v = new double[5];
        te = new double[18];
        string tempStr;
        ExeCommand();
        outputFilePath = Server.MapPath("./") + "Frontier\\tjny.OUT";//输入绝对路径
        if (File.Exists(outputFilePath))
        {
            StreamReader sr = new StreamReader(outputFilePath);
            
            while (sr.Peek() > 0)
            {
                string strline = sr.ReadLine();
                if (strline.Equals("the final mle estimates are :"))
                {
                    for (int i = 0; i < 3; i++)
                        sr.ReadLine();
                    for (int i = 0; i < 5; i++)
                    {
                        tempStr = sr.ReadLine().Substring(16, 16);
                        v[i] = Convert.ToDouble(tempStr);
                    }
                }
                else if (strline.Equals("technical efficiency estimates :"))
                {
                    for (int i = 0; i < 4; i++)
                        sr.ReadLine();
                    for (int i = 0; i < 18; i++)
                    {
                        tempStr = sr.ReadLine().Substring(18, 15);
                        te[i] = Convert.ToDouble(tempStr);
                    }
                }
                
            }   //存入数组a
            
            sr.Close();
            StreamReader sr1 = new StreamReader(outputFilePath);
            

            Label2.Text = sr1.ReadToEnd().Replace("\r\n ", " <br/> ");
            sr1.Close();
        }
        Label1.Text += "ln(Y)=" + v[0] + "+" + v[1] + "ln(X1)+" + v[2] + "ln(X2)+" + v[3] + "ln(X3)+" + v[4] + "X(4)";

        StreamWriter sw = new StreamWriter(outputFilePath);
        string w = "";
        sw.Write(w);
        sw.Close();
        
       
    }
    private string ExeCommand()
    {
        Process p = new Process();  //创建并实例化一个操作进程的类：Process  
        p.StartInfo.FileName = "cmd.exe";    //设置要启动的应用程序  
        p.StartInfo.UseShellExecute = false;   //设置是否使用操作系统shell启动进程  
        p.StartInfo.RedirectStandardInput = true;  //指示应用程序是否从StandardInput流中读取  
        p.StartInfo.RedirectStandardOutput = true; //将应用程序的输入写入到StandardOutput流中  
        p.StartInfo.RedirectStandardError = true;  //将应用程序的错误输出写入到StandarError流中  
        p.StartInfo.CreateNoWindow = true;    //是否在新窗口中启动进程  
        string strOutput = null;
        try
        {
            p.Start();
            p.StandardInput.WriteLine("D:");    //将CMD命令写入StandardInput流中
            p.StandardInput.WriteLine("cd D:\\veg_trace\\SFA\\Frontier");    //将CMD命令写入StandardInput流中
            p.StandardInput.WriteLine("1.vbs");    //将CMD命令写入StandardInput流中  
            p.StandardInput.WriteLine("exit");         //将 exit 命令写入StandardInput流中  
            strOutput = p.StandardOutput.ReadToEnd();   //读取所有输出的流的所有字符  
            p.WaitForExit();                           //无限期等待，直至进程退出  
            p.Close();                                  //释放进程，关闭进程  
        }
        catch (Exception e)
        {
            strOutput = e.Message;
        }
        return strOutput;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       Response.Redirect(".//Detail.aspx");
    }
}