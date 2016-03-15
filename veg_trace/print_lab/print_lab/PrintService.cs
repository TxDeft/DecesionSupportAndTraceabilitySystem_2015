using System;
using System.Collections.Generic;
using System.Text;

using System.IO;
using System.Drawing.Printing;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace print_lab
{
    class PrintService
    {
        #region 打印处理
        //declare the PrintDocument object
        private System.Drawing.Printing.PrintDocument docToPrint = new PrintDocument();
        private System.IO.Stream streamToPrint;
        string streamType;

        public PrintService()
        {
            this.docToPrint.PrintPage += new PrintPageEventHandler(docToPrint_PrintPage);
        }

        public void StartPrint(Stream streamToPrint, string streamType)
        {
            this.streamToPrint = streamToPrint;
            this.streamType = streamType;

            System.Windows.Forms.PrintDialog PrintDialog1 = new PrintDialog();
            PrintDialog1.AllowSomePages = true;  //set page item
            PrintDialog1.ShowHelp = true;   //set help button

            PrintDialog1.Document = docToPrint; //把配置好的PrintDocument实例附给PrintDialog
            if (PrintDialog1.ShowDialog() == DialogResult.OK)
            {
                docToPrint.Print(); //开始打印
            }
        }

        private void docToPrint_PrintPage(object sender, System.Drawing.Printing.PrintPageEventArgs e)
        {
            System.Drawing.Image image = System.Drawing.Image.FromStream(this.streamToPrint);
            int x = 5;
            int y = 5;
            int width = image.Width;
            int height = image.Height;
            System.Drawing.Rectangle destRect = new System.Drawing.Rectangle(x, y, width, height);
            e.Graphics.DrawImage(image, destRect, 0, 0, image.Width, image.Height, System.Drawing.GraphicsUnit.Pixel);
        }
        #endregion
    }
}
