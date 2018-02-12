namespace QuanLyKho
{
    partial class FormMain
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormMain));
            this.tabbedView = new DevExpress.XtraBars.Docking2010.Views.Tabbed.TabbedView(this.components);
            this.ribbonStatusBar = new DevExpress.XtraBars.Ribbon.RibbonStatusBar();
            this.ribbonControl = new DevExpress.XtraBars.Ribbon.RibbonControl();
            this.btnHome = new DevExpress.XtraBars.BarButtonItem();
            this.btnTrangChu = new DevExpress.XtraBars.BarButtonItem();
            this.btnXuatKho = new DevExpress.XtraBars.BarButtonItem();
            this.btnQLCongNo = new DevExpress.XtraBars.BarButtonItem();
            this.barButtonItem3 = new DevExpress.XtraBars.BarButtonItem();
            this.barButtonItem4 = new DevExpress.XtraBars.BarButtonItem();
            this.btnHangHoa = new DevExpress.XtraBars.BarButtonItem();
            this.btnQLKhachHang = new DevExpress.XtraBars.BarButtonItem();
            this.btnTaiKhoan = new DevExpress.XtraBars.BarButtonItem();
            this.barSubItem1 = new DevExpress.XtraBars.BarSubItem();
            this.btnDMLoaiTaiKhoan = new DevExpress.XtraBars.BarButtonItem();
            this.btnDMDonVi = new DevExpress.XtraBars.BarButtonItem();
            this.btnDMLoaiHang = new DevExpress.XtraBars.BarButtonItem();
            this.btnNhaCC = new DevExpress.XtraBars.BarButtonItem();
            this.btnNhaSX = new DevExpress.XtraBars.BarButtonItem();
            this.btnBaoCao = new DevExpress.XtraBars.BarButtonItem();
            this.barHeaderItem1 = new DevExpress.XtraBars.BarHeaderItem();
            this.ribbonPage = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.ribbonPageGroup = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonPageGroup2 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.mainPanel = new DevExpress.XtraEditors.PanelControl();
            this.btnQLHoaDon = new DevExpress.XtraBars.BarButtonItem();
            ((System.ComponentModel.ISupportInitialize)(this.tabbedView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ribbonControl)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mainPanel)).BeginInit();
            this.SuspendLayout();
            // 
            // tabbedView
            // 
            this.tabbedView.RootContainer.Element = null;
            // 
            // ribbonStatusBar
            // 
            this.ribbonStatusBar.Location = new System.Drawing.Point(0, 490);
            this.ribbonStatusBar.Name = "ribbonStatusBar";
            this.ribbonStatusBar.Ribbon = this.ribbonControl;
            this.ribbonStatusBar.Size = new System.Drawing.Size(1010, 31);
            // 
            // ribbonControl
            // 
            this.ribbonControl.ExpandCollapseItem.Id = 0;
            this.ribbonControl.Items.AddRange(new DevExpress.XtraBars.BarItem[] {
            this.ribbonControl.ExpandCollapseItem,
            this.btnHome,
            this.btnTrangChu,
            this.btnXuatKho,
            this.btnQLCongNo,
            this.barButtonItem3,
            this.barButtonItem4,
            this.btnHangHoa,
            this.btnQLKhachHang,
            this.btnTaiKhoan,
            this.barSubItem1,
            this.btnDMLoaiTaiKhoan,
            this.btnBaoCao,
            this.btnDMDonVi,
            this.btnDMLoaiHang,
            this.btnNhaCC,
            this.btnNhaSX,
            this.barHeaderItem1,
            this.btnQLHoaDon});
            this.ribbonControl.Location = new System.Drawing.Point(0, 0);
            this.ribbonControl.MaxItemId = 25;
            this.ribbonControl.MdiMergeStyle = DevExpress.XtraBars.Ribbon.RibbonMdiMergeStyle.Always;
            this.ribbonControl.Name = "ribbonControl";
            this.ribbonControl.PageHeaderItemLinks.Add(this.barHeaderItem1);
            this.ribbonControl.Pages.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPage[] {
            this.ribbonPage});
            this.ribbonControl.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonControlStyle.Office2013;
            this.ribbonControl.ShowApplicationButton = DevExpress.Utils.DefaultBoolean.False;
            this.ribbonControl.ShowDisplayOptionsMenuButton = DevExpress.Utils.DefaultBoolean.False;
            this.ribbonControl.ShowExpandCollapseButton = DevExpress.Utils.DefaultBoolean.False;
            this.ribbonControl.ShowToolbarCustomizeItem = false;
            this.ribbonControl.Size = new System.Drawing.Size(1010, 143);
            this.ribbonControl.StatusBar = this.ribbonStatusBar;
            this.ribbonControl.Toolbar.ShowCustomizeItem = false;
            this.ribbonControl.ToolbarLocation = DevExpress.XtraBars.Ribbon.RibbonQuickAccessToolbarLocation.Hidden;
            // 
            // btnHome
            // 
            this.btnHome.Caption = "Màn hình chính";
            this.btnHome.Id = 46;
            this.btnHome.Name = "btnHome";
            // 
            // btnTrangChu
            // 
            this.btnTrangChu.Caption = "Màn hình chính";
            this.btnTrangChu.Id = 49;
            this.btnTrangChu.ImageOptions.LargeImage = global::QuanLyKho.Properties.Resources.home_icon__1_;
            this.btnTrangChu.LargeWidth = 90;
            this.btnTrangChu.Name = "btnTrangChu";
            this.btnTrangChu.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnTrangChu_ItemClick);
            // 
            // btnXuatKho
            // 
            this.btnXuatKho.Caption = "Xuất kho";
            this.btnXuatKho.Id = 54;
            this.btnXuatKho.ImageOptions.LargeImage = global::QuanLyKho.Properties.Resources.Door_Out_512;
            this.btnXuatKho.LargeWidth = 80;
            this.btnXuatKho.Name = "btnXuatKho";
            this.btnXuatKho.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnXuatKho_ItemClick);
            // 
            // btnQLCongNo
            // 
            this.btnQLCongNo.Caption = "Công nợ";
            this.btnQLCongNo.Id = 1;
            this.btnQLCongNo.ImageOptions.LargeImage = global::QuanLyKho.Properties.Resources.payment_icon;
            this.btnQLCongNo.LargeWidth = 80;
            this.btnQLCongNo.Name = "btnQLCongNo";
            // 
            // barButtonItem3
            // 
            this.barButtonItem3.Caption = "Lịch sử bán hàng";
            this.barButtonItem3.Id = 2;
            this.barButtonItem3.ImageOptions.LargeImage = global::QuanLyKho.Properties.Resources.Rank_History_icon;
            this.barButtonItem3.LargeWidth = 80;
            this.barButtonItem3.Name = "barButtonItem3";
            // 
            // barButtonItem4
            // 
            this.barButtonItem4.Id = 3;
            this.barButtonItem4.Name = "barButtonItem4";
            // 
            // btnHangHoa
            // 
            this.btnHangHoa.Caption = "Hàng hóa";
            this.btnHangHoa.Id = 4;
            this.btnHangHoa.ImageOptions.LargeImage = global::QuanLyKho.Properties.Resources.City_Warehouse_icon;
            this.btnHangHoa.LargeWidth = 80;
            this.btnHangHoa.Name = "btnHangHoa";
            this.btnHangHoa.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnHangHoa_ItemClick);
            // 
            // btnQLKhachHang
            // 
            this.btnQLKhachHang.Caption = "Khách hàng";
            this.btnQLKhachHang.Id = 5;
            this.btnQLKhachHang.ImageOptions.LargeImage = global::QuanLyKho.Properties.Resources.Customer_icon;
            this.btnQLKhachHang.LargeWidth = 80;
            this.btnQLKhachHang.Name = "btnQLKhachHang";
            this.btnQLKhachHang.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnQLKhachHang_ItemClick);
            // 
            // btnTaiKhoan
            // 
            this.btnTaiKhoan.Caption = "Tài khoản";
            this.btnTaiKhoan.Id = 7;
            this.btnTaiKhoan.ImageOptions.LargeImage = global::QuanLyKho.Properties.Resources.man_icon;
            this.btnTaiKhoan.LargeWidth = 80;
            this.btnTaiKhoan.Name = "btnTaiKhoan";
            this.btnTaiKhoan.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnTaiKhoan_ItemClick);
            // 
            // barSubItem1
            // 
            this.barSubItem1.Caption = "Danh mục";
            this.barSubItem1.Id = 10;
            this.barSubItem1.ImageOptions.LargeImage = global::QuanLyKho.Properties.Resources.Business_Todo_List_icon;
            this.barSubItem1.LargeWidth = 80;
            this.barSubItem1.LinksPersistInfo.AddRange(new DevExpress.XtraBars.LinkPersistInfo[] {
            new DevExpress.XtraBars.LinkPersistInfo(this.btnDMLoaiTaiKhoan),
            new DevExpress.XtraBars.LinkPersistInfo(this.btnDMDonVi),
            new DevExpress.XtraBars.LinkPersistInfo(this.btnDMLoaiHang),
            new DevExpress.XtraBars.LinkPersistInfo(this.btnNhaCC),
            new DevExpress.XtraBars.LinkPersistInfo(this.btnNhaSX)});
            this.barSubItem1.Name = "barSubItem1";
            // 
            // btnDMLoaiTaiKhoan
            // 
            this.btnDMLoaiTaiKhoan.Caption = "Loại tài khoản";
            this.btnDMLoaiTaiKhoan.Id = 12;
            this.btnDMLoaiTaiKhoan.Name = "btnDMLoaiTaiKhoan";
            this.btnDMLoaiTaiKhoan.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnDMLoaiTaiKhoan_ItemClick);
            // 
            // btnDMDonVi
            // 
            this.btnDMDonVi.Caption = "Đơn vị tính";
            this.btnDMDonVi.Id = 15;
            this.btnDMDonVi.Name = "btnDMDonVi";
            this.btnDMDonVi.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnDMDonVi_ItemClick);
            // 
            // btnDMLoaiHang
            // 
            this.btnDMLoaiHang.Caption = "Loại Hàng";
            this.btnDMLoaiHang.Id = 16;
            this.btnDMLoaiHang.Name = "btnDMLoaiHang";
            this.btnDMLoaiHang.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnDMLoaiHang_ItemClick);
            // 
            // btnNhaCC
            // 
            this.btnNhaCC.Caption = "Nhà cung cấp";
            this.btnNhaCC.Id = 17;
            this.btnNhaCC.Name = "btnNhaCC";
            this.btnNhaCC.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnNhaCC_ItemClick);
            // 
            // btnNhaSX
            // 
            this.btnNhaSX.Caption = "Nhà sản xuất";
            this.btnNhaSX.Id = 18;
            this.btnNhaSX.Name = "btnNhaSX";
            this.btnNhaSX.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnNhaSX_ItemClick);
            // 
            // btnBaoCao
            // 
            this.btnBaoCao.Caption = "Báo cáo";
            this.btnBaoCao.Id = 14;
            this.btnBaoCao.ImageOptions.LargeImage = global::QuanLyKho.Properties.Resources.Mimetype_log_icon;
            this.btnBaoCao.LargeWidth = 80;
            this.btnBaoCao.Name = "btnBaoCao";
            // 
            // barHeaderItem1
            // 
            this.barHeaderItem1.Appearance.Font = new System.Drawing.Font("Tahoma", 12F);
            this.barHeaderItem1.Appearance.Options.UseFont = true;
            this.barHeaderItem1.Caption = "barHeaderItem1";
            this.barHeaderItem1.Id = 23;
            this.barHeaderItem1.ImageOptions.Image = global::QuanLyKho.Properties.Resources.man_icon;
            this.barHeaderItem1.Name = "barHeaderItem1";
            // 
            // ribbonPage
            // 
            this.ribbonPage.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
            this.ribbonPageGroup,
            this.ribbonPageGroup2});
            this.ribbonPage.Name = "ribbonPage";
            this.ribbonPage.Text = "Kho";
            // 
            // ribbonPageGroup
            // 
            this.ribbonPageGroup.AllowTextClipping = false;
            this.ribbonPageGroup.ItemLinks.Add(this.btnTrangChu);
            this.ribbonPageGroup.ItemLinks.Add(this.btnXuatKho);
            this.ribbonPageGroup.ItemLinks.Add(this.barButtonItem3);
            this.ribbonPageGroup.Name = "ribbonPageGroup";
            this.ribbonPageGroup.ShowCaptionButton = false;
            this.ribbonPageGroup.Text = "Hàng hóa";
            // 
            // ribbonPageGroup2
            // 
            this.ribbonPageGroup2.ItemLinks.Add(this.btnHangHoa);
            this.ribbonPageGroup2.ItemLinks.Add(this.btnQLCongNo);
            this.ribbonPageGroup2.ItemLinks.Add(this.btnTaiKhoan);
            this.ribbonPageGroup2.ItemLinks.Add(this.btnQLKhachHang);
            this.ribbonPageGroup2.ItemLinks.Add(this.barSubItem1);
            this.ribbonPageGroup2.ItemLinks.Add(this.btnBaoCao);
            this.ribbonPageGroup2.ItemLinks.Add(this.btnQLHoaDon);
            this.ribbonPageGroup2.Name = "ribbonPageGroup2";
            this.ribbonPageGroup2.Text = "Quản lý";
            // 
            // mainPanel
            // 
            this.mainPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.mainPanel.Location = new System.Drawing.Point(0, 143);
            this.mainPanel.Name = "mainPanel";
            this.mainPanel.Size = new System.Drawing.Size(1010, 347);
            this.mainPanel.TabIndex = 2;
            // 
            // btnQLHoaDon
            // 
            this.btnQLHoaDon.Caption = "Hóa đơn";
            this.btnQLHoaDon.Id = 24;
            this.btnQLHoaDon.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("btnQLHoaDon.ImageOptions.Image")));
            this.btnQLHoaDon.ImageOptions.LargeImage = ((System.Drawing.Image)(resources.GetObject("btnQLHoaDon.ImageOptions.LargeImage")));
            this.btnQLHoaDon.Name = "btnQLHoaDon";
            this.btnQLHoaDon.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnQLHoaDon_ItemClick);
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1010, 521);
            this.Controls.Add(this.mainPanel);
            this.Controls.Add(this.ribbonStatusBar);
            this.Controls.Add(this.ribbonControl);
            this.Name = "FormMain";
            this.Ribbon = this.ribbonControl;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.StatusBar = this.ribbonStatusBar;
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FormMain_Load);
            ((System.ComponentModel.ISupportInitialize)(this.tabbedView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ribbonControl)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.mainPanel)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private DevExpress.XtraBars.Docking2010.Views.Tabbed.TabbedView tabbedView;
        private DevExpress.XtraBars.Ribbon.RibbonStatusBar ribbonStatusBar;
        private DevExpress.XtraBars.Ribbon.RibbonControl ribbonControl;
        private DevExpress.XtraBars.BarButtonItem btnHome;
        private DevExpress.XtraBars.BarButtonItem btnTrangChu;
        private DevExpress.XtraBars.Ribbon.RibbonPage ribbonPage;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup;
        private DevExpress.XtraBars.BarButtonItem btnXuatKho;
        private DevExpress.XtraBars.BarButtonItem btnQLCongNo;
        private DevExpress.XtraBars.BarButtonItem barButtonItem3;
        private DevExpress.XtraBars.BarButtonItem barButtonItem4;
        private DevExpress.XtraBars.BarButtonItem btnHangHoa;
        private DevExpress.XtraBars.BarButtonItem btnQLKhachHang;
        private DevExpress.XtraEditors.PanelControl mainPanel;
        private DevExpress.XtraBars.BarButtonItem btnTaiKhoan;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup2;
        private DevExpress.XtraBars.BarSubItem barSubItem1;
        private DevExpress.XtraBars.BarButtonItem btnDMLoaiTaiKhoan;
        private DevExpress.XtraBars.BarButtonItem btnBaoCao;
        private DevExpress.XtraBars.BarButtonItem btnDMDonVi;
        private DevExpress.XtraBars.BarButtonItem btnDMLoaiHang;
        private DevExpress.XtraBars.BarButtonItem btnNhaCC;
        private DevExpress.XtraBars.BarButtonItem btnNhaSX;
        private DevExpress.XtraBars.BarHeaderItem barHeaderItem1;
        private DevExpress.XtraBars.BarButtonItem btnQLHoaDon;
    }
}
