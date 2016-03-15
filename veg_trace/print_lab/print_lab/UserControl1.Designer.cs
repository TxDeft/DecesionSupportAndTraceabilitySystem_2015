namespace print_lab
{
    partial class UserControl1
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region 组件设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.panel1 = new System.Windows.Forms.Panel();
            this.lbl_tishi = new System.Windows.Forms.Label();
            this.txt_trace = new System.Windows.Forms.TextBox();
            this.btn_print = new System.Windows.Forms.Button();
            this.btn_show = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txt_GTIN = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txt_code = new System.Windows.Forms.TextBox();
            this.pic_box = new System.Windows.Forms.PictureBox();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pic_box)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.lbl_tishi);
            this.panel1.Controls.Add(this.txt_trace);
            this.panel1.Controls.Add(this.btn_print);
            this.panel1.Controls.Add(this.btn_show);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.txt_GTIN);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.txt_code);
            this.panel1.Controls.Add(this.pic_box);
            this.panel1.Location = new System.Drawing.Point(12, 17);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(637, 300);
            this.panel1.TabIndex = 0;
            // 
            // lbl_tishi
            // 
            this.lbl_tishi.AutoSize = true;
            this.lbl_tishi.ForeColor = System.Drawing.Color.Red;
            this.lbl_tishi.Location = new System.Drawing.Point(269, 55);
            this.lbl_tishi.Name = "lbl_tishi";
            this.lbl_tishi.Size = new System.Drawing.Size(0, 12);
            this.lbl_tishi.TabIndex = 10;
            this.lbl_tishi.Visible = false;
            // 
            // txt_trace
            // 
            this.txt_trace.Location = new System.Drawing.Point(32, 166);
            this.txt_trace.Name = "txt_trace";
            this.txt_trace.Size = new System.Drawing.Size(209, 21);
            this.txt_trace.TabIndex = 9;
            this.txt_trace.Visible = false;
            // 
            // btn_print
            // 
            this.btn_print.Location = new System.Drawing.Point(155, 228);
            this.btn_print.Name = "btn_print";
            this.btn_print.Size = new System.Drawing.Size(63, 32);
            this.btn_print.TabIndex = 8;
            this.btn_print.Text = "打印";
            this.btn_print.UseVisualStyleBackColor = true;
            this.btn_print.Click += new System.EventHandler(this.btn_print_Click);
            // 
            // btn_show
            // 
            this.btn_show.Location = new System.Drawing.Point(32, 228);
            this.btn_show.Name = "btn_show";
            this.btn_show.Size = new System.Drawing.Size(66, 32);
            this.btn_show.TabIndex = 2;
            this.btn_show.Text = "预览";
            this.btn_show.UseVisualStyleBackColor = true;
            this.btn_show.Click += new System.EventHandler(this.btn_show_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label3.Location = new System.Drawing.Point(28, 110);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(83, 12);
            this.label3.TabIndex = 5;
            this.label3.Text = "公司标识符：";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label2.Location = new System.Drawing.Point(28, 58);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(70, 12);
            this.label2.TabIndex = 4;
            this.label2.Text = "产品批次：";
            // 
            // txt_GTIN
            // 
            this.txt_GTIN.Location = new System.Drawing.Point(117, 101);
            this.txt_GTIN.Name = "txt_GTIN";
            this.txt_GTIN.Size = new System.Drawing.Size(124, 21);
            this.txt_GTIN.TabIndex = 3;
            this.txt_GTIN.Text = "1234567890";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label1.Location = new System.Drawing.Point(28, 151);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(83, 12);
            this.label1.TabIndex = 2;
            this.label1.Text = "蔬菜追溯码：";
            // 
            // txt_code
            // 
            this.txt_code.Location = new System.Drawing.Point(117, 55);
            this.txt_code.Name = "txt_code";
            this.txt_code.Size = new System.Drawing.Size(124, 21);
            this.txt_code.TabIndex = 1;
            this.txt_code.Click += new System.EventHandler(this.txt_code_Click);
            // 
            // pic_box
            // 
            this.pic_box.Location = new System.Drawing.Point(271, 76);
            this.pic_box.Name = "pic_box";
            this.pic_box.Size = new System.Drawing.Size(327, 184);
            this.pic_box.TabIndex = 0;
            this.pic_box.TabStop = false;
            // 
            // UserControl1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.panel1);
            this.Name = "UserControl1";
            this.Size = new System.Drawing.Size(661, 346);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pic_box)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txt_code;
        private System.Windows.Forms.PictureBox pic_box;
        private System.Windows.Forms.TextBox txt_GTIN;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btn_print;
        private System.Windows.Forms.Button btn_show;
        private System.Windows.Forms.TextBox txt_trace;
        private System.Windows.Forms.Label lbl_tishi;
    }
}
