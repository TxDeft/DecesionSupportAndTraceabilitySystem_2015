using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;

using System.Data.SqlClient;
using System.IO;
using System.Runtime.InteropServices;
using System.Drawing.Text;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

namespace print_lab
{
    [Guid("312A657A-880F-4762-B9E0-CF8BE9E435F6")]
    public partial class UserControl1 : UserControl
    {
       public UserControl1()
        {
            InitializeComponent();
        } 
       private void btn_show_Click(object sender, EventArgs e)
        {

            DataTable objtable = new DataTable();
            DatabaseAccess objaccess = new DatabaseAccess();
            this.lbl_tishi.Text = "";
            if (this.txt_code.Text.ToString().Trim().Equals(string.Empty))
            {
                lbl_tishi.Text = "产品批次不能为空！";
                lbl_tishi.Visible = true;
                txt_trace.Text = "";
                pic_box.Visible = false;
            }
            else
            {

                HSPKCode();

                objtable = objaccess.GetPrinterDataByKeyCode(this.txt_code.Text.ToString().Trim());

                if (objtable.Rows.Count > 0)
                {

                    Bitmap bm = new Bitmap(330, 130);
                    Graphics g = Graphics.FromImage(bm);

                    g.SmoothingMode = SmoothingMode.AntiAlias;
                    g.TextRenderingHint = TextRenderingHint.AntiAlias;
                    g.Clear(Color.White);

                    g.DrawString("蔬菜追溯码： ", new Font("黑体", 15, FontStyle.Bold), Brushes.Black, new PointF(5, 5));

                    txt_trace.Text = "(01)" + txt_GTIN.Text + "(10)" + txt_code.Text;
                    txt_trace.Visible = true;
                    g.DrawString(this.txt_trace.Text.ToString().Trim(), new Font("Tahoma", 11, FontStyle.Bold), Brushes.Black, new PointF(5, 30));


                    g.DrawLine(new Pen(Color.Black, 2), new Point(2, 65), new Point(325, 65));

                    System.Drawing.Image img = System.Drawing.Image.FromFile("C:\\veg_code.BMP", false);

                    g.DrawImage(img, new Rectangle(70, 70, img.Width, img.Height), new Rectangle(0, 0, img.Width, img.Height), GraphicsUnit.Pixel);

                    bm.Save("C:\\" + "label.BMP", ImageFormat.Bmp);

                    bm.Dispose();
                    g.Dispose();

                    pic_box.Image = Image.FromFile("C:\\label.BMP", false);
                }
                else
                {
                    lbl_tishi.Text = "输入的产品批次不存在！";
                    lbl_tishi.Visible = true;
                    txt_trace.Text = "";
                    pic_box.Visible = false;
                }
            }

        } 
     
    unsafe private void HSPKCode()
    {
        try
        {
            string val = txt_code.Text;
            byte[] arr = new byte[val.Length];
            Encoding gb = Encoding.GetEncoding("GB18030");
            arr = gb.GetBytes(val);

            byte* bty;
            fixed (byte* p = arr)
            {
                bty = p;
            }
            string path = "C:" + "\\" + "veg_code.BMP";
            int ret = PEncode.HSEncode(0, bty, gb.GetByteCount(val), 1, 1, 4, 0, 100, 1, path);
        }
        catch (Exception ex)
        {
            string s = ex.Message;
        }

    }

        private void btn_print_Click(object sender, EventArgs e)
        {
            PrintService objprint = new PrintService();
            System.IO.Stream iStream = null;
            string filepath = @"c:\label.bmp";
            iStream = new System.IO.FileStream(filepath, System.IO.FileMode.Open, System.IO.FileAccess.Read, System.IO.FileShare.Read);
            objprint.StartPrint(iStream, "image");
        }

        private void txt_code_Click(object sender, EventArgs e)
        {
            txt_code.Text = DateTime.Now.ToString("yyyyMMdd");
        }
        
  }
}