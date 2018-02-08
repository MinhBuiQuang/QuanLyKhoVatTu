namespace QuanLyKho
{
    partial class FormDMLoaiHang
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
        ///
        private void InitializeComponent()
        {
            DevExpress.XtraEditors.Controls.EditorButtonImageOptions editorButtonImageOptions1 = new DevExpress.XtraEditors.Controls.EditorButtonImageOptions();
            DevExpress.XtraEditors.Controls.EditorButtonImageOptions editorButtonImageOptions2 = new DevExpress.XtraEditors.Controls.EditorButtonImageOptions();
            DevExpress.XtraBars.Docking2010.WindowsUIButtonImageOptions windowsUIButtonImageOptions1 = new DevExpress.XtraBars.Docking2010.WindowsUIButtonImageOptions();
            DevExpress.XtraBars.Docking2010.WindowsUIButtonImageOptions windowsUIButtonImageOptions2 = new DevExpress.XtraBars.Docking2010.WindowsUIButtonImageOptions();
            DevExpress.XtraBars.Docking2010.WindowsUIButtonImageOptions windowsUIButtonImageOptions3 = new DevExpress.XtraBars.Docking2010.WindowsUIButtonImageOptions();
            this.layoutControl = new DevExpress.XtraLayout.LayoutControl();
            this.btnThem = new System.Windows.Forms.Button();
            this.txtGhiChu = new DevExpress.XtraEditors.MemoEdit();
            this.gCLoaiHang = new DevExpress.XtraGrid.GridControl();
            this.gVLoaiHang = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.gridColumn1 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.gridColumn2 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.gridColumn11 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.gridColumn12 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.gridColumn3 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.btnEdit = new DevExpress.XtraEditors.Repository.RepositoryItemButtonEdit();
            this.gridColumn4 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.btnDelete = new DevExpress.XtraEditors.Repository.RepositoryItemButtonEdit();
            this.labelControl = new DevExpress.XtraEditors.LabelControl();
            this.txtLoaiHang = new DevExpress.XtraEditors.TextEdit();
            this.layoutControlGroup = new DevExpress.XtraLayout.LayoutControlGroup();
            this.itemLabel = new DevExpress.XtraLayout.LayoutControlItem();
            this.layoutControlItem1 = new DevExpress.XtraLayout.LayoutControlItem();
            this.layoutControlItem2 = new DevExpress.XtraLayout.LayoutControlItem();
            this.layoutControlItem4 = new DevExpress.XtraLayout.LayoutControlItem();
            this.layoutControlItem3 = new DevExpress.XtraLayout.LayoutControlItem();
            this.windowsUIButtonPanel = new DevExpress.XtraBars.Docking2010.WindowsUIButtonPanel();
            this.gridColumn5 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.gridColumn9 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.gridColumn6 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.gridColumn10 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.gridColumn7 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.gridColumn8 = new DevExpress.XtraGrid.Columns.GridColumn();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControl)).BeginInit();
            this.layoutControl.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtGhiChu.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gCLoaiHang)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gVLoaiHang)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnEdit)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnDelete)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtLoaiHang.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.itemLabel)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem4)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem3)).BeginInit();
            this.SuspendLayout();
            // 
            // layoutControl
            // 
            this.layoutControl.AllowCustomization = false;
            this.layoutControl.Controls.Add(this.btnThem);
            this.layoutControl.Controls.Add(this.txtGhiChu);
            this.layoutControl.Controls.Add(this.gCLoaiHang);
            this.layoutControl.Controls.Add(this.labelControl);
            this.layoutControl.Controls.Add(this.txtLoaiHang);
            this.layoutControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.layoutControl.Location = new System.Drawing.Point(0, 0);
            this.layoutControl.Name = "layoutControl";
            this.layoutControl.Root = this.layoutControlGroup;
            this.layoutControl.Size = new System.Drawing.Size(800, 540);
            this.layoutControl.TabIndex = 1;
            // 
            // btnThem
            // 
            this.btnThem.Location = new System.Drawing.Point(682, 36);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(76, 86);
            this.btnThem.TabIndex = 10;
            this.btnThem.Text = "Thêm";
            this.btnThem.UseVisualStyleBackColor = true;
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click_1);
            // 
            // txtGhiChu
            // 
            this.txtGhiChu.Location = new System.Drawing.Point(116, 60);
            this.txtGhiChu.Name = "txtGhiChu";
            this.txtGhiChu.Properties.LinesCount = 3;
            this.txtGhiChu.Size = new System.Drawing.Size(562, 62);
            this.txtGhiChu.StyleController = this.layoutControl;
            this.txtGhiChu.TabIndex = 9;
            // 
            // gCLoaiHang
            // 
            this.gCLoaiHang.Location = new System.Drawing.Point(42, 126);
            this.gCLoaiHang.MainView = this.gVLoaiHang;
            this.gCLoaiHang.Name = "gCLoaiHang";
            this.gCLoaiHang.RepositoryItems.AddRange(new DevExpress.XtraEditors.Repository.RepositoryItem[] {
            this.btnEdit,
            this.btnDelete});
            this.gCLoaiHang.Size = new System.Drawing.Size(716, 412);
            this.gCLoaiHang.TabIndex = 7;
            this.gCLoaiHang.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.gVLoaiHang});
            // 
            // gVLoaiHang
            // 
            this.gVLoaiHang.Columns.AddRange(new DevExpress.XtraGrid.Columns.GridColumn[] {
            this.gridColumn1,
            this.gridColumn2,
            this.gridColumn11,
            this.gridColumn12,
            this.gridColumn3,
            this.gridColumn4});
            this.gVLoaiHang.GridControl = this.gCLoaiHang;
            this.gVLoaiHang.Name = "gVLoaiHang";
            this.gVLoaiHang.OptionsCustomization.AllowColumnMoving = false;
            this.gVLoaiHang.OptionsCustomization.AllowGroup = false;
            this.gVLoaiHang.OptionsCustomization.AllowQuickHideColumns = false;
            this.gVLoaiHang.OptionsFilter.AllowColumnMRUFilterList = false;
            this.gVLoaiHang.OptionsMenu.EnableColumnMenu = false;
            this.gVLoaiHang.OptionsSelection.EnableAppearanceFocusedCell = false;
            this.gVLoaiHang.OptionsView.ShowGroupPanel = false;
            this.gVLoaiHang.OptionsView.ShowIndicator = false;
            // 
            // gridColumn1
            // 
            this.gridColumn1.Caption = "ID";
            this.gridColumn1.FieldName = "IDLoaiHang";
            this.gridColumn1.Name = "gridColumn1";
            this.gridColumn1.OptionsColumn.AllowEdit = false;
            this.gridColumn1.Width = 119;
            // 
            // gridColumn2
            // 
            this.gridColumn2.Caption = "Mã loại";
            this.gridColumn2.FieldName = "MaLoai";
            this.gridColumn2.Name = "gridColumn2";
            this.gridColumn2.OptionsColumn.AllowEdit = false;
            this.gridColumn2.Visible = true;
            this.gridColumn2.VisibleIndex = 0;
            this.gridColumn2.Width = 82;
            // 
            // gridColumn11
            // 
            this.gridColumn11.Caption = "Tên loại";
            this.gridColumn11.FieldName = "TenLoai";
            this.gridColumn11.Name = "gridColumn11";
            this.gridColumn11.Visible = true;
            this.gridColumn11.VisibleIndex = 1;
            this.gridColumn11.Width = 218;
            // 
            // gridColumn12
            // 
            this.gridColumn12.Caption = "Ghi chú";
            this.gridColumn12.FieldName = "GhiChu";
            this.gridColumn12.Name = "gridColumn12";
            this.gridColumn12.Visible = true;
            this.gridColumn12.VisibleIndex = 2;
            this.gridColumn12.Width = 324;
            // 
            // gridColumn3
            // 
            this.gridColumn3.Caption = "Sửa";
            this.gridColumn3.ColumnEdit = this.btnEdit;
            this.gridColumn3.Name = "gridColumn3";
            this.gridColumn3.Visible = true;
            this.gridColumn3.VisibleIndex = 3;
            this.gridColumn3.Width = 39;
            // 
            // btnEdit
            // 
            this.btnEdit.AutoHeight = false;
            editorButtonImageOptions1.Image = global::QuanLyKho.Properties.Resources.Edit_24px;
            this.btnEdit.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(editorButtonImageOptions1, DevExpress.XtraEditors.Controls.ButtonPredefines.Glyph, null)});
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.TextEditStyle = DevExpress.XtraEditors.Controls.TextEditStyles.HideTextEditor;
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // gridColumn4
            // 
            this.gridColumn4.Caption = "Xóa";
            this.gridColumn4.ColumnEdit = this.btnDelete;
            this.gridColumn4.Name = "gridColumn4";
            this.gridColumn4.Visible = true;
            this.gridColumn4.VisibleIndex = 4;
            this.gridColumn4.Width = 51;
            // 
            // btnDelete
            // 
            this.btnDelete.AutoHeight = false;
            editorButtonImageOptions2.Image = global::QuanLyKho.Properties.Resources.delete_24px;
            this.btnDelete.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(editorButtonImageOptions2, DevExpress.XtraEditors.Controls.ButtonPredefines.Glyph, null)});
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.TextEditStyle = DevExpress.XtraEditors.Controls.TextEditStyles.HideTextEditor;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // labelControl
            // 
            this.labelControl.AllowHtmlString = true;
            this.labelControl.Appearance.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.labelControl.Appearance.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(140)))), ((int)(((byte)(140)))), ((int)(((byte)(140)))));
            this.labelControl.Appearance.Options.UseFont = true;
            this.labelControl.Appearance.Options.UseForeColor = true;
            this.labelControl.Appearance.Options.UseTextOptions = true;
            this.labelControl.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near;
            this.labelControl.AutoSizeMode = DevExpress.XtraEditors.LabelAutoSizeMode.Vertical;
            this.labelControl.Location = new System.Drawing.Point(40, 0);
            this.labelControl.Name = "labelControl";
            this.labelControl.Padding = new System.Windows.Forms.Padding(0, 3, 13, 6);
            this.labelControl.Size = new System.Drawing.Size(720, 34);
            this.labelControl.StyleController = this.layoutControl;
            this.labelControl.TabIndex = 4;
            this.labelControl.Text = "Danh mục hàng hóa";
            // 
            // txtLoaiHang
            // 
            this.txtLoaiHang.Location = new System.Drawing.Point(116, 36);
            this.txtLoaiHang.Name = "txtLoaiHang";
            this.txtLoaiHang.Size = new System.Drawing.Size(562, 20);
            this.txtLoaiHang.StyleController = this.layoutControl;
            this.txtLoaiHang.TabIndex = 4;
            // 
            // layoutControlGroup
            // 
            this.layoutControlGroup.EnableIndentsWithoutBorders = DevExpress.Utils.DefaultBoolean.True;
            this.layoutControlGroup.GroupBordersVisible = false;
            this.layoutControlGroup.Items.AddRange(new DevExpress.XtraLayout.BaseLayoutItem[] {
            this.itemLabel,
            this.layoutControlItem1,
            this.layoutControlItem2,
            this.layoutControlItem4,
            this.layoutControlItem3});
            this.layoutControlGroup.Location = new System.Drawing.Point(0, 0);
            this.layoutControlGroup.Name = "Root";
            this.layoutControlGroup.Padding = new DevExpress.XtraLayout.Utils.Padding(40, 40, 0, 0);
            this.layoutControlGroup.Size = new System.Drawing.Size(800, 540);
            this.layoutControlGroup.TextVisible = false;
            // 
            // itemLabel
            // 
            this.itemLabel.Control = this.labelControl;
            this.itemLabel.Location = new System.Drawing.Point(0, 0);
            this.itemLabel.Name = "itemLabel";
            this.itemLabel.Padding = new DevExpress.XtraLayout.Utils.Padding(0, 0, 0, 0);
            this.itemLabel.Size = new System.Drawing.Size(720, 34);
            this.itemLabel.TextSize = new System.Drawing.Size(0, 0);
            this.itemLabel.TextVisible = false;
            // 
            // layoutControlItem1
            // 
            this.layoutControlItem1.Control = this.txtLoaiHang;
            this.layoutControlItem1.CustomizationFormText = "Loại Hàng Hóa";
            this.layoutControlItem1.Location = new System.Drawing.Point(0, 34);
            this.layoutControlItem1.Name = "layoutControlItem1";
            this.layoutControlItem1.Size = new System.Drawing.Size(640, 24);
            this.layoutControlItem1.Text = "Loại hàng hóa:";
            this.layoutControlItem1.TextSize = new System.Drawing.Size(71, 13);
            // 
            // layoutControlItem2
            // 
            this.layoutControlItem2.Control = this.gCLoaiHang;
            this.layoutControlItem2.Location = new System.Drawing.Point(0, 124);
            this.layoutControlItem2.Name = "layoutControlItem2";
            this.layoutControlItem2.Size = new System.Drawing.Size(720, 416);
            this.layoutControlItem2.TextSize = new System.Drawing.Size(0, 0);
            this.layoutControlItem2.TextVisible = false;
            // 
            // layoutControlItem4
            // 
            this.layoutControlItem4.Control = this.txtGhiChu;
            this.layoutControlItem4.Location = new System.Drawing.Point(0, 58);
            this.layoutControlItem4.Name = "layoutControlItem4";
            this.layoutControlItem4.Size = new System.Drawing.Size(640, 66);
            this.layoutControlItem4.Text = "Ghi chú:";
            this.layoutControlItem4.TextSize = new System.Drawing.Size(71, 13);
            // 
            // layoutControlItem3
            // 
            this.layoutControlItem3.Control = this.btnThem;
            this.layoutControlItem3.Location = new System.Drawing.Point(640, 34);
            this.layoutControlItem3.Name = "layoutControlItem3";
            this.layoutControlItem3.Size = new System.Drawing.Size(80, 90);
            this.layoutControlItem3.TextSize = new System.Drawing.Size(0, 0);
            this.layoutControlItem3.TextVisible = false;
            // 
            // windowsUIButtonPanel
            // 
            this.windowsUIButtonPanel.AppearanceButton.Hovered.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(130)))), ((int)(((byte)(130)))), ((int)(((byte)(130)))));
            this.windowsUIButtonPanel.AppearanceButton.Hovered.FontSizeDelta = -1;
            this.windowsUIButtonPanel.AppearanceButton.Hovered.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(130)))), ((int)(((byte)(130)))), ((int)(((byte)(130)))));
            this.windowsUIButtonPanel.AppearanceButton.Hovered.Options.UseBackColor = true;
            this.windowsUIButtonPanel.AppearanceButton.Hovered.Options.UseFont = true;
            this.windowsUIButtonPanel.AppearanceButton.Hovered.Options.UseForeColor = true;
            this.windowsUIButtonPanel.AppearanceButton.Normal.FontSizeDelta = -1;
            this.windowsUIButtonPanel.AppearanceButton.Normal.Options.UseFont = true;
            this.windowsUIButtonPanel.AppearanceButton.Pressed.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(159)))), ((int)(((byte)(159)))), ((int)(((byte)(159)))));
            this.windowsUIButtonPanel.AppearanceButton.Pressed.FontSizeDelta = -1;
            this.windowsUIButtonPanel.AppearanceButton.Pressed.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(159)))), ((int)(((byte)(159)))), ((int)(((byte)(159)))));
            this.windowsUIButtonPanel.AppearanceButton.Pressed.Options.UseBackColor = true;
            this.windowsUIButtonPanel.AppearanceButton.Pressed.Options.UseFont = true;
            this.windowsUIButtonPanel.AppearanceButton.Pressed.Options.UseForeColor = true;
            this.windowsUIButtonPanel.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(63)))), ((int)(((byte)(63)))), ((int)(((byte)(63)))));
            windowsUIButtonImageOptions1.ImageUri.Uri = "New;Size32x32;GrayScaled";
            windowsUIButtonImageOptions2.ImageUri.Uri = "Refresh;Size32x32;GrayScaled";
            windowsUIButtonImageOptions3.ImageUri.Uri = "Preview;Size32x32;GrayScaled";
            this.windowsUIButtonPanel.Buttons.AddRange(new DevExpress.XtraEditors.ButtonPanel.IBaseButton[] {
            new DevExpress.XtraBars.Docking2010.WindowsUIButton("Lưu", true, windowsUIButtonImageOptions1),
            new DevExpress.XtraBars.Docking2010.WindowsUIButton("Làm mới", true, windowsUIButtonImageOptions2),
            new DevExpress.XtraBars.Docking2010.WindowsUISeparator(),
            new DevExpress.XtraBars.Docking2010.WindowsUIButton("Print", true, windowsUIButtonImageOptions3)});
            this.windowsUIButtonPanel.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.windowsUIButtonPanel.EnableImageTransparency = true;
            this.windowsUIButtonPanel.ForeColor = System.Drawing.Color.White;
            this.windowsUIButtonPanel.Location = new System.Drawing.Point(0, 540);
            this.windowsUIButtonPanel.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.windowsUIButtonPanel.MaximumSize = new System.Drawing.Size(0, 60);
            this.windowsUIButtonPanel.MinimumSize = new System.Drawing.Size(60, 60);
            this.windowsUIButtonPanel.Name = "windowsUIButtonPanel";
            this.windowsUIButtonPanel.Size = new System.Drawing.Size(800, 60);
            this.windowsUIButtonPanel.TabIndex = 5;
            this.windowsUIButtonPanel.Text = "windowsUIButtonPanel";
            this.windowsUIButtonPanel.UseButtonBackgroundImages = false;
            this.windowsUIButtonPanel.ButtonClick += new DevExpress.XtraBars.Docking2010.ButtonEventHandler(this.windowsUIButtonPanel_ButtonClick);
            // 
            // gridColumn5
            // 
            this.gridColumn5.Caption = "ID";
            this.gridColumn5.FieldName = "IDLoaiHang";
            this.gridColumn5.Name = "gridColumn5";
            this.gridColumn5.OptionsColumn.AllowEdit = false;
            this.gridColumn5.Width = 119;
            // 
            // gridColumn9
            // 
            this.gridColumn9.Caption = "Mã loại";
            this.gridColumn9.FieldName = "MaLoai";
            this.gridColumn9.Name = "gridColumn9";
            this.gridColumn9.Visible = true;
            this.gridColumn9.VisibleIndex = 0;
            this.gridColumn9.Width = 78;
            // 
            // gridColumn6
            // 
            this.gridColumn6.Caption = "Loại";
            this.gridColumn6.FieldName = "TenLoai";
            this.gridColumn6.Name = "gridColumn6";
            this.gridColumn6.OptionsColumn.AllowEdit = false;
            this.gridColumn6.Visible = true;
            this.gridColumn6.VisibleIndex = 1;
            this.gridColumn6.Width = 241;
            // 
            // gridColumn10
            // 
            this.gridColumn10.Caption = "Ghi chú";
            this.gridColumn10.FieldName = "GhiChu";
            this.gridColumn10.Name = "gridColumn10";
            this.gridColumn10.Width = 288;
            // 
            // gridColumn7
            // 
            this.gridColumn7.Caption = "Sửa";
            this.gridColumn7.Name = "gridColumn7";
            this.gridColumn7.Visible = true;
            this.gridColumn7.VisibleIndex = 2;
            this.gridColumn7.Width = 43;
            // 
            // gridColumn8
            // 
            this.gridColumn8.Caption = "Xóa";
            this.gridColumn8.Name = "gridColumn8";
            this.gridColumn8.Visible = true;
            this.gridColumn8.VisibleIndex = 3;
            this.gridColumn8.Width = 64;
            // 
            // FormDMLoaiHang
            // 
            this.Appearance.BackColor = System.Drawing.Color.White;
            this.Appearance.Options.UseBackColor = true;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.layoutControl);
            this.Controls.Add(this.windowsUIButtonPanel);
            this.Name = "FormDMLoaiHang";
            this.Size = new System.Drawing.Size(800, 600);
            ((System.ComponentModel.ISupportInitialize)(this.layoutControl)).EndInit();
            this.layoutControl.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.txtGhiChu.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gCLoaiHang)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gVLoaiHang)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnEdit)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnDelete)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtLoaiHang.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.itemLabel)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem4)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem3)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevExpress.XtraLayout.LayoutControl layoutControl;
        private DevExpress.XtraEditors.LabelControl labelControl;
        private DevExpress.XtraLayout.LayoutControlGroup layoutControlGroup;
        private DevExpress.XtraLayout.LayoutControlItem itemLabel;
        private DevExpress.XtraBars.Docking2010.WindowsUIButtonPanel windowsUIButtonPanel;
        private DevExpress.XtraEditors.TextEdit txtLoaiHang;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem1;
        private DevExpress.XtraGrid.Columns.GridColumn gridColumn5;
        private DevExpress.XtraGrid.Columns.GridColumn gridColumn9;
        private DevExpress.XtraGrid.Columns.GridColumn gridColumn6;
        private DevExpress.XtraGrid.Columns.GridColumn gridColumn10;
        private DevExpress.XtraGrid.Columns.GridColumn gridColumn7;
        private DevExpress.XtraGrid.Columns.GridColumn gridColumn8;
        private DevExpress.XtraGrid.GridControl gCLoaiHang;
        private DevExpress.XtraGrid.Views.Grid.GridView gVLoaiHang;
        private DevExpress.XtraGrid.Columns.GridColumn gridColumn1;
        private DevExpress.XtraGrid.Columns.GridColumn gridColumn2;
        private DevExpress.XtraGrid.Columns.GridColumn gridColumn11;
        private DevExpress.XtraGrid.Columns.GridColumn gridColumn12;
        private DevExpress.XtraGrid.Columns.GridColumn gridColumn3;
        private DevExpress.XtraEditors.Repository.RepositoryItemButtonEdit btnEdit;
        private DevExpress.XtraGrid.Columns.GridColumn gridColumn4;
        private DevExpress.XtraEditors.Repository.RepositoryItemButtonEdit btnDelete;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem2;
        private System.Windows.Forms.Button btnThem;
        private DevExpress.XtraEditors.MemoEdit txtGhiChu;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem4;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem3;
    }
}
