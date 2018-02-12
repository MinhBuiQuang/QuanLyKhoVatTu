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
    public partial class FormXuatKho : DevExpress.XtraEditors.XtraUserControl
    {
        HangHoaDAL da;
        DataTable dataXuat = new DataTable();
        public FormXuatKho()
        {
            InitializeComponent();
            RefreshData();
            dataXuat.Columns.Add("ID", typeof(int));
            dataXuat.Columns.Add("MaHangHoa", typeof(string));
            dataXuat.Columns.Add("IDHangHoa", typeof(int));
            dataXuat.Columns.Add("SoLuong", typeof(float));
            dataXuat.PrimaryKey = new DataColumn[] { dataXuat.Columns["IDHangHoa"] };


            lueKhachHang.Properties.DataSource = new KhachHangDAL().getAllKhachHang();
            lueKhachHang.Properties.DisplayMember = "TenKhachHang";
            lueKhachHang.Properties.ValueMember = "IDKhachHang";
            lueKhachHang.Properties.Columns.Add(new DevExpress.XtraEditors.Controls.LookUpColumnInfo("MaKhachHang", "Mã khách"));
            lueKhachHang.Properties.Columns.Add(new DevExpress.XtraEditors.Controls.LookUpColumnInfo("TenKhachHang", "Tên"));
        }
        void windowsUIButtonPanel_ButtonClick(object sender, DevExpress.XtraBars.Docking2010.ButtonEventArgs e)
        {
            //if (e.Button.Properties.Caption == "Print") gridControl.ShowRibbonPrintPreview();
            if (e.Button.Properties.Caption == "Xuất ra")
            {
                da = new HangHoaDAL();
                DataTable dt = dataXuat.Copy();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    dt.Rows[i]["ID"] = i + 1;
                }
                dt.Columns.Remove("MaHangHoa");
                da.XuatKho(FormMain.nguoiDung.IDUser, lueKhachHang.EditValue == null ? 0 : (int)Convert.ToDecimal(lueKhachHang.EditValue), "", dt);
                MessageBox.Show("Xuất kho thành công!");
                RefreshData();
            }
        }
        public DataTable GetDataSource()
        {
            //BindingList<HangHoa> result = new BindingList<HangHoa>();
            da = new HangHoaDAL();
            DataTable dt = new DataTable();
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
        private void RefreshData()
        {
            treeHangHoa.DataSource = GetDataSource();
            dataXuat = new DataTable();
            gc.DataSource = dataXuat;
        }
        private void UpdateView()
        {
            gc.DataSource = dataXuat;            
        }
        private void btnXuatKho_Click(object sender, EventArgs e)
        {
            if (treeHangHoa.FocusedNode.HasChildren)
            {
                MessageBox.Show("Mời bạn chọn cụ thể với mặt hàng này");
                return;
            }

            XuatKho();
            UpdateView();
        }      
        private void XuatKho()
        {
            float TonKho = (float)Convert.ToDecimal(treeHangHoa.GetRowCellValue(treeHangHoa.FocusedNode, colTonKho));
            int IDHangHoa = (int)Convert.ToDecimal(treeHangHoa.GetRowCellValue(treeHangHoa.FocusedNode, colIDHangHoa));
            string MaHangHoa = treeHangHoa.GetRowCellValue(treeHangHoa.FocusedNode, colMaHangHoa).ToString();
            FormSubXuatHang form = new FormSubXuatHang(TonKho);
            if (form.ShowDialog() == DialogResult.OK)
            {
                float soLuong = form.SoLuong;
                if (soLuong > TonKho)
                {
                    MessageBox.Show("Số lượng tồn kho không đủ");
                    return;
                }

                if(dataXuat.Rows.Contains(IDHangHoa))
                {
                    foreach (DataRow dr in dataXuat.Rows) // search whole table
                    {
                        if (int.Parse(dr["IDHangHoa"].ToString()) == IDHangHoa)
                        {
                            dr["SoLuong"] = int.Parse(dr["SoLuong"].ToString()) + soLuong;                                                        
                        }
                    }
                }
                else
                {
                    DataRow dr = dataXuat.NewRow();
                    dr["MaHangHoa"] = MaHangHoa;
                    dr["IDHangHoa"] = IDHangHoa;
                    dr["SoLuong"] = soLuong;
                    dataXuat.Rows.Add(dr);
                }
                treeHangHoa.FocusedNode.SetValue(colTonKho, TonKho - soLuong);
            }
           
        }

        private void btnDeleteHoaDon_Click(object sender, EventArgs e)
        {
            float TonKho = (float)Convert.ToDecimal(treeHangHoa.GetRowCellValue(treeHangHoa.FocusedNode, colTonKho));
            DataRowView item = gv.GetFocusedRow() as DataRowView;
            float soLuong = float.Parse(item.Row["SoLuong"].ToString());
            dataXuat.Rows.Remove(item.Row);
            UpdateView();
            treeHangHoa.FocusedNode.SetValue(colTonKho, TonKho + soLuong);
        }
    }
}
