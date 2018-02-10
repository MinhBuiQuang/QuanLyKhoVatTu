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
using DataAccess.Objects;
using DataAccess.DAL;
using QuanLyKho.DesignClasses;

namespace QuanLyKho
{
    public partial class FormDMLoaiHang : DevExpress.XtraEditors.XtraUserControl
    {
        private LoaiHangDAL da;
        private List<LoaiHang> listLoaiHang = new List<LoaiHang>();
        private List<LoaiHang> listAdd = new List<LoaiHang>();
        private List<LoaiHang> listRemove = new List<LoaiHang>();
        private List<LoaiHang> listEdit = new List<LoaiHang>();
        HamChung hc = HamChung.builder;
        private bool isUpdate = false;
        public FormDMLoaiHang()
        {
            InitializeComponent();

            gCLoaiHang.DataSource = GetDataSource();
        }
        void windowsUIButtonPanel_ButtonClick(object sender, DevExpress.XtraBars.Docking2010.ButtonEventArgs e)
        {
            if (e.Button.Properties.Caption == "Print") gCLoaiHang.ShowRibbonPrintPreview();
            if (e.Button.Properties.Caption == "Lưu")
            {
                Save();
                RefreshGrid();
            }
        }

        private void RefreshGrid()
        {
            txtLoaiHang.Text = String.Empty;
            txtGhiChu.Text = String.Empty;
            gCLoaiHang.DataSource = GetDataSource();
            listAdd.Clear();
            listEdit.Clear();
            listRemove.Clear();
            
        }
        private void Save()
        {
            try
            {
                da = new LoaiHangDAL();
                foreach (LoaiHang dv in listAdd)
                {

                    da.Insert(dv);
                }
                try
                {
                    foreach (LoaiHang dv in listRemove)
                    {
                        da.Delete(dv.IDLoaiHang);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Đơn vị này đang được sử dụng nên không thể xóa");
                }
                ///Edit
            }
            catch
            {

            }
        }

        public List<LoaiHang> GetDataSource()
        {
            DataTable dt = new DataTable();
            try
            {
                da = new LoaiHangDAL();
                dt = da.GetLoaiHang();
                listLoaiHang = hc.DataTableToList<LoaiHang>(dt);
            }
            catch
            {

            }
            return listLoaiHang;
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {

        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn xóa?", "Cảnh báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (result == System.Windows.Forms.DialogResult.Yes)
            {
                LoaiHang dv = gVLoaiHang.GetRow(gVLoaiHang.FocusedRowHandle) as LoaiHang;
                listAdd.Remove(dv);
                listLoaiHang.Remove(dv);
                if (dv.IDLoaiHang != 0)
                    listRemove.Add(dv);
                gCLoaiHang.DataSource = null;
                gCLoaiHang.DataSource = listLoaiHang;
            }
        }

        private void btnThem_Click_1(object sender, EventArgs e)
        {
            try
            {
                string loaiHang = txtLoaiHang.Text.Trim();
                string ghiChu = txtGhiChu.Text.Trim();
                LoaiHang lh = new LoaiHang
                {
                    TenLoai = loaiHang,
                    GhiChu = ghiChu
                };
                if (isUpdate)
                {
                    ////////////////////////
                }
                else
                {
                    if (listLoaiHang.Where(p => p.TenLoai.ToLower() == loaiHang.ToLower()).Count() != 0)
                    {
                        MessageBox.Show("Đã tồn tại loại hàng này", "Cảnh báo", MessageBoxButtons.OK);
                    }
                    else
                    {
                        listLoaiHang.Add(lh);
                        listAdd.Add(lh);
                    }
                    gCLoaiHang.DataSource = null;
                    gCLoaiHang.DataSource = listLoaiHang;
                }
            }
            catch
            {

            }
        }
    }
}
