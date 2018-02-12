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

namespace QuanLyKho
{
    public partial class FormQLHangHoa : DevExpress.XtraEditors.XtraUserControl
    {
        HangHoaDAL da;
        DataTable dt;
        public FormQLHangHoa()
        {
            InitializeComponent();

            treeHangHoa.DataSource = GetDataSource();
        }
        void windowsUIButtonPanel_ButtonClick(object sender, DevExpress.XtraBars.Docking2010.ButtonEventArgs e)
        {
            if (e.Button.Properties.Caption == "Print") treeHangHoa.ShowRibbonPrintPreview();
            if (e.Button.Properties.Caption == "Thêm hàng hóa")
            {
                this.Controls.Clear();
                FormQLChiTietHangHoa_V2 frm = new FormQLChiTietHangHoa_V2();
                frm.Dock = DockStyle.Fill;
                this.Controls.Add(frm);
            }
            if (e.Button.Properties.Caption == "Nhập kho")
            {

            }
            if (e.Button.Properties.Caption == "Lịch sử kho")
            {
                this.Controls.Clear();
                FormLichSuKho frm = new FormLichSuKho();
                frm.Dock = DockStyle.Fill;
                this.Controls.Add(frm);
            }
        }
        public DataTable GetDataSource()
        {
            //BindingList<HangHoa> result = new BindingList<HangHoa>();
            da = new HangHoaDAL();
            try
            {
                dt = new DataTable();
                dt = da.GetHangHoa();
            }
            catch
            {

            }
            return dt;
        }

        private void LoadTreeList()
        {
            treeHangHoa.DataSource = GetDataSource();
        }

        private void btnNhapKho_Click(object sender, EventArgs e)
        {
            int IDHangHoa = (int)treeHangHoa.GetRowCellValue(treeHangHoa.FocusedNode, colIDHangHoa);
            FormSubNhapKho form = new FormSubNhapKho(IDHangHoa);
            form.ShowDialog();
            LoadTreeList();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            int IDHangHoa = (int)treeHangHoa.GetRowCellValue(treeHangHoa.FocusedNode, colIDHangHoa);
            FormQLChiTietHangHoa_V2 form = new FormQLChiTietHangHoa_V2(IDHangHoa);
            this.Controls.Clear();
            form.Dock = DockStyle.Fill;
            this.Controls.Add(form);
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {

        }
    }
}
