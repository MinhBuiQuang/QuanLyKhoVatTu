using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using System.ComponentModel.DataAnnotations;
using DataAccess.DAL;
using DevExpress.XtraGrid.Views.Base;
using DataAccess.Objects;
using Newtonsoft.Json;
using DataAccess.ObjectsDump;

namespace QuanLyKho
{
    public partial class FormQLDSNhaCungCap : DevExpress.XtraEditors.XtraUserControl
    {
        public FormQLDSNhaCungCap()
        {
            InitializeComponent();
            gCDSKhachhang.DataSource = GetDataSource();

        }
        void windowsUIButtonPanel_ButtonClick(object sender, DevExpress.XtraBars.Docking2010.ButtonEventArgs e)
        {
            if (e.Button.Properties.Caption == "Print") gCDSKhachhang.ShowRibbonPrintPreview();
            if (e.Button.Properties.Caption.Equals("Thêm nhà cung cấp"))
            {
                this.Controls.Clear();
                FormQLNhaCungCap frm = new FormQLNhaCungCap();
                frm.Dock = DockStyle.Fill;
                this.Controls.Add(frm);                
            }
        }
        
        public DataTable GetDataSource()
        {
            NhaCungCapDAL ncc = new NhaCungCapDAL();
            return ncc.getAllNhaCungCap();

        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            DataRowView cell = (DataRowView)gVDSNhanVien.GetRow(gVDSNhanVien.FocusedRowHandle);
            
            this.Controls.Clear();
            FormQLNhaCungCap frm = new FormQLNhaCungCap(cell["IDNhaCungCap"].ToString());
            frm.Dock = DockStyle.Fill;
            this.Controls.Add(frm);
        }

        private void gVDSNhanVien_CustomColumnDisplayText(object sender, DevExpress.XtraGrid.Views.Base.CustomColumnDisplayTextEventArgs e)
        {
            ColumnView view = sender as ColumnView;
            if (e.Column.FieldName == "IsMale" && e.ListSourceRowIndex != DevExpress.XtraGrid.GridControl.InvalidRowHandle)
            {
                //int type = (int)view.GetListSourceRowCellValue(e.ListSourceRowIndex, "IsMale");
                int type = Convert.ToInt32(e.Value);
                switch (type)
                {
                    case 0: e.DisplayText = "Nữ"; break;
                    case 1: e.DisplayText = "Nam"; break;
                }
            }
        }
    }
}
