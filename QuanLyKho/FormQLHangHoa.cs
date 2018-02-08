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

        }

        private void btnDelete_Click(object sender, EventArgs e)
        {

        }
    }
}
