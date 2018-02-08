namespace QuanLyKho
{
    partial class FormSubNhapKho
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.layoutControl1 = new DevExpress.XtraLayout.LayoutControl();
            this.layoutControlGroup1 = new DevExpress.XtraLayout.LayoutControlGroup();
            this.emptySpaceItem1 = new DevExpress.XtraLayout.EmptySpaceItem();
            this.ceHaveSub = new DevExpress.XtraEditors.CheckEdit();
            this.layoutControlItem3 = new DevExpress.XtraLayout.LayoutControlItem();
            this.txtSLChiTiet = new DevExpress.XtraEditors.TextEdit();
            this.layoutControlItem2 = new DevExpress.XtraLayout.LayoutControlItem();
            this.btnHuy = new DevExpress.XtraEditors.SimpleButton();
            this.layoutControlItem5 = new DevExpress.XtraLayout.LayoutControlItem();
            this.btnOK = new DevExpress.XtraEditors.SimpleButton();
            this.layoutControlItem6 = new DevExpress.XtraLayout.LayoutControlItem();
            this.txtSL = new DevExpress.XtraEditors.TextEdit();
            this.layoutControlItem1 = new DevExpress.XtraLayout.LayoutControlItem();
            this.txtDonGiaCT = new DevExpress.XtraEditors.TextEdit();
            this.layoutControlItem7 = new DevExpress.XtraLayout.LayoutControlItem();
            this.lueDonVi = new DevExpress.XtraEditors.LookUpEdit();
            this.layoutControlItem4 = new DevExpress.XtraLayout.LayoutControlItem();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControl1)).BeginInit();
            this.layoutControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.emptySpaceItem1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ceHaveSub.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtSLChiTiet.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem5)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem6)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtSL.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtDonGiaCT.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem7)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.lueDonVi.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem4)).BeginInit();
            this.SuspendLayout();
            // 
            // layoutControl1
            // 
            this.layoutControl1.Controls.Add(this.lueDonVi);
            this.layoutControl1.Controls.Add(this.txtDonGiaCT);
            this.layoutControl1.Controls.Add(this.txtSL);
            this.layoutControl1.Controls.Add(this.btnOK);
            this.layoutControl1.Controls.Add(this.btnHuy);
            this.layoutControl1.Controls.Add(this.txtSLChiTiet);
            this.layoutControl1.Controls.Add(this.ceHaveSub);
            this.layoutControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.layoutControl1.Location = new System.Drawing.Point(0, 0);
            this.layoutControl1.Name = "layoutControl1";
            this.layoutControl1.OptionsCustomizationForm.DesignTimeCustomizationFormPositionAndSize = new System.Drawing.Rectangle(827, 69, 450, 400);
            this.layoutControl1.Root = this.layoutControlGroup1;
            this.layoutControl1.Size = new System.Drawing.Size(332, 175);
            this.layoutControl1.TabIndex = 0;
            this.layoutControl1.Text = "layoutControl1";
            // 
            // layoutControlGroup1
            // 
            this.layoutControlGroup1.EnableIndentsWithoutBorders = DevExpress.Utils.DefaultBoolean.True;
            this.layoutControlGroup1.GroupBordersVisible = false;
            this.layoutControlGroup1.Items.AddRange(new DevExpress.XtraLayout.BaseLayoutItem[] {
            this.emptySpaceItem1,
            this.layoutControlItem3,
            this.layoutControlItem2,
            this.layoutControlItem1,
            this.layoutControlItem7,
            this.layoutControlItem6,
            this.layoutControlItem5,
            this.layoutControlItem4});
            this.layoutControlGroup1.Location = new System.Drawing.Point(0, 0);
            this.layoutControlGroup1.Name = "Root";
            this.layoutControlGroup1.Size = new System.Drawing.Size(332, 175);
            this.layoutControlGroup1.TextVisible = false;
            // 
            // emptySpaceItem1
            // 
            this.emptySpaceItem1.AllowHotTrack = false;
            this.emptySpaceItem1.Location = new System.Drawing.Point(100, 119);
            this.emptySpaceItem1.Name = "emptySpaceItem1";
            this.emptySpaceItem1.Size = new System.Drawing.Size(119, 36);
            this.emptySpaceItem1.TextSize = new System.Drawing.Size(0, 0);
            // 
            // ceHaveSub
            // 
            this.ceHaveSub.Location = new System.Drawing.Point(12, 36);
            this.ceHaveSub.Name = "ceHaveSub";
            this.ceHaveSub.Properties.Caption = "Quản lý chi tiết";
            this.ceHaveSub.Properties.GlyphAlignment = DevExpress.Utils.HorzAlignment.Default;
            this.ceHaveSub.Size = new System.Drawing.Size(308, 19);
            this.ceHaveSub.StyleController = this.layoutControl1;
            this.ceHaveSub.TabIndex = 6;
            this.ceHaveSub.CheckedChanged += new System.EventHandler(this.ceHaveSub_CheckedChanged);
            // 
            // layoutControlItem3
            // 
            this.layoutControlItem3.Control = this.ceHaveSub;
            this.layoutControlItem3.Location = new System.Drawing.Point(0, 24);
            this.layoutControlItem3.Name = "layoutControlItem3";
            this.layoutControlItem3.Size = new System.Drawing.Size(312, 23);
            this.layoutControlItem3.TextSize = new System.Drawing.Size(0, 0);
            this.layoutControlItem3.TextVisible = false;
            // 
            // txtSLChiTiet
            // 
            this.txtSLChiTiet.Enabled = false;
            this.txtSLChiTiet.Location = new System.Drawing.Point(97, 59);
            this.txtSLChiTiet.Name = "txtSLChiTiet";
            this.txtSLChiTiet.Properties.Mask.EditMask = "n";
            this.txtSLChiTiet.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.Numeric;
            this.txtSLChiTiet.Size = new System.Drawing.Size(223, 20);
            this.txtSLChiTiet.StyleController = this.layoutControl1;
            this.txtSLChiTiet.TabIndex = 7;
            // 
            // layoutControlItem2
            // 
            this.layoutControlItem2.Control = this.txtSLChiTiet;
            this.layoutControlItem2.Location = new System.Drawing.Point(0, 47);
            this.layoutControlItem2.Name = "layoutControlItem2";
            this.layoutControlItem2.Size = new System.Drawing.Size(312, 24);
            this.layoutControlItem2.Text = "Số lượng chi tiết:";
            this.layoutControlItem2.TextSize = new System.Drawing.Size(81, 13);
            // 
            // btnHuy
            // 
            this.btnHuy.Location = new System.Drawing.Point(231, 131);
            this.btnHuy.Name = "btnHuy";
            this.btnHuy.Size = new System.Drawing.Size(89, 22);
            this.btnHuy.StyleController = this.layoutControl1;
            this.btnHuy.TabIndex = 9;
            this.btnHuy.Text = "Hủy";
            this.btnHuy.Click += new System.EventHandler(this.btnHuy_Click);
            // 
            // layoutControlItem5
            // 
            this.layoutControlItem5.Control = this.btnHuy;
            this.layoutControlItem5.Location = new System.Drawing.Point(219, 119);
            this.layoutControlItem5.Name = "layoutControlItem5";
            this.layoutControlItem5.Size = new System.Drawing.Size(93, 36);
            this.layoutControlItem5.TextSize = new System.Drawing.Size(0, 0);
            this.layoutControlItem5.TextVisible = false;
            // 
            // btnOK
            // 
            this.btnOK.Location = new System.Drawing.Point(12, 131);
            this.btnOK.Name = "btnOK";
            this.btnOK.Size = new System.Drawing.Size(96, 22);
            this.btnOK.StyleController = this.layoutControl1;
            this.btnOK.TabIndex = 10;
            this.btnOK.Text = "OK";
            this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
            // 
            // layoutControlItem6
            // 
            this.layoutControlItem6.Control = this.btnOK;
            this.layoutControlItem6.Location = new System.Drawing.Point(0, 119);
            this.layoutControlItem6.Name = "layoutControlItem6";
            this.layoutControlItem6.Size = new System.Drawing.Size(100, 36);
            this.layoutControlItem6.TextSize = new System.Drawing.Size(0, 0);
            this.layoutControlItem6.TextVisible = false;
            // 
            // txtSL
            // 
            this.txtSL.Location = new System.Drawing.Point(97, 12);
            this.txtSL.Name = "txtSL";
            this.txtSL.Properties.Mask.EditMask = "n";
            this.txtSL.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.Numeric;
            this.txtSL.Size = new System.Drawing.Size(223, 20);
            this.txtSL.StyleController = this.layoutControl1;
            this.txtSL.TabIndex = 11;
            // 
            // layoutControlItem1
            // 
            this.layoutControlItem1.Control = this.txtSL;
            this.layoutControlItem1.Location = new System.Drawing.Point(0, 0);
            this.layoutControlItem1.Name = "layoutControlItem1";
            this.layoutControlItem1.Size = new System.Drawing.Size(312, 24);
            this.layoutControlItem1.Text = "Số lượng:";
            this.layoutControlItem1.TextSize = new System.Drawing.Size(81, 13);
            // 
            // txtDonGiaCT
            // 
            this.txtDonGiaCT.Location = new System.Drawing.Point(97, 107);
            this.txtDonGiaCT.Name = "txtDonGiaCT";
            this.txtDonGiaCT.Properties.Mask.EditMask = "n";
            this.txtDonGiaCT.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.Numeric;
            this.txtDonGiaCT.Size = new System.Drawing.Size(223, 20);
            this.txtDonGiaCT.StyleController = this.layoutControl1;
            this.txtDonGiaCT.TabIndex = 12;
            // 
            // layoutControlItem7
            // 
            this.layoutControlItem7.Control = this.txtDonGiaCT;
            this.layoutControlItem7.Location = new System.Drawing.Point(0, 95);
            this.layoutControlItem7.Name = "layoutControlItem7";
            this.layoutControlItem7.Size = new System.Drawing.Size(312, 24);
            this.layoutControlItem7.Text = "Đơn giá chi tiết:";
            this.layoutControlItem7.TextSize = new System.Drawing.Size(81, 13);
            // 
            // lueDonVi
            // 
            this.lueDonVi.Location = new System.Drawing.Point(97, 83);
            this.lueDonVi.Name = "lueDonVi";
            this.lueDonVi.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.lueDonVi.Properties.NullText = "";
            this.lueDonVi.Size = new System.Drawing.Size(223, 20);
            this.lueDonVi.StyleController = this.layoutControl1;
            this.lueDonVi.TabIndex = 13;
            // 
            // layoutControlItem4
            // 
            this.layoutControlItem4.Control = this.lueDonVi;
            this.layoutControlItem4.Location = new System.Drawing.Point(0, 71);
            this.layoutControlItem4.Name = "layoutControlItem4";
            this.layoutControlItem4.Size = new System.Drawing.Size(312, 24);
            this.layoutControlItem4.Text = "Đơn vị:";
            this.layoutControlItem4.TextSize = new System.Drawing.Size(81, 13);
            // 
            // FormSubNhapKho
            // 
            this.AcceptButton = this.btnOK;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(332, 175);
            this.Controls.Add(this.layoutControl1);
            this.Name = "FormSubNhapKho";
            this.Text = "Nhập kho";
            this.Load += new System.EventHandler(this.FormSubNhapKho_Load);
            ((System.ComponentModel.ISupportInitialize)(this.layoutControl1)).EndInit();
            this.layoutControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.emptySpaceItem1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ceHaveSub.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtSLChiTiet.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem5)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem6)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtSL.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtDonGiaCT.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem7)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.lueDonVi.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem4)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevExpress.XtraLayout.LayoutControl layoutControl1;
        private DevExpress.XtraLayout.LayoutControlGroup layoutControlGroup1;
        private DevExpress.XtraEditors.SimpleButton btnHuy;
        private DevExpress.XtraEditors.TextEdit txtSLChiTiet;
        private DevExpress.XtraEditors.CheckEdit ceHaveSub;
        private DevExpress.XtraLayout.EmptySpaceItem emptySpaceItem1;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem3;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem2;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem5;
        private DevExpress.XtraEditors.SimpleButton btnOK;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem6;
        private DevExpress.XtraEditors.TextEdit txtSL;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem1;
        private DevExpress.XtraEditors.TextEdit txtDonGiaCT;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem7;
        private DevExpress.XtraEditors.LookUpEdit lueDonVi;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem4;
    }
}