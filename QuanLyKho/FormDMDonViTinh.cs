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
    public partial class FormDMDonViTinh : DevExpress.XtraEditors.XtraUserControl
    {
        private DonViTinhDAL da;
        private List<DonViTinh> listDonVi = new List<DonViTinh>();
        private List<DonViTinh> listAdd = new List<DonViTinh>();
        private List<DonViTinh> listRemove = new List<DonViTinh>();
        private List<DonViTinh> listEdit = new List<DonViTinh>();
        private bool isUpdate = false;
        HamChung hc =HamChung.builder;
        public FormDMDonViTinh()
        {
            InitializeComponent();
            gCDonVi.DataSource = GetDataSource();
        }
        void windowsUIButtonPanel_ButtonClick(object sender, DevExpress.XtraBars.Docking2010.ButtonEventArgs e)
        {
            if (e.Button.Properties.Caption == "Print") gCDonVi.ShowRibbonPrintPreview();
            if (e.Button.Properties.Caption == "Lưu")
            {
                Save();
                RefreshGrid();
            }
        }
        private void RefreshGrid()
        {
            txtDonViTinh.Text = String.Empty;
            gCDonVi.DataSource = GetDataSource();
            listAdd.Clear();
            listEdit.Clear();
            listRemove.Clear();
        }
        private void Save()
        {
            try
            {
                da = new DonViTinhDAL();
                foreach (DonViTinh dv in listAdd)
                {

                    da.Insert(dv);
                }
                try
                {
                    foreach (DonViTinh dv in listRemove)
                    {
                        da.Delete(dv.IDDonVi);
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
        public List<DonViTinh> GetDataSource()
        {
            //BindingList<KhachHang> result = new BindingList<KhachHang>();
            DataTable dt = new DataTable();
            try
            {
                da = new DonViTinhDAL();
                dt = da.GetDonViTinh();
                listDonVi = hc.DataTableToList<DonViTinh>(dt);
            }
            catch
            {

            }
            return listDonVi;
        }


        private void btnEdit_Click(object sender, EventArgs e)
        {

        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn xóa?", "Cảnh báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (result == System.Windows.Forms.DialogResult.Yes)
            {
                DonViTinh dv = gVDonVi.GetRow(gVDonVi.FocusedRowHandle) as DonViTinh;
                listAdd.Remove(dv);
                listDonVi.Remove(dv);
                if (dv.IDDonVi != 0)
                    listRemove.Add(dv);
                gCDonVi.DataSource = null;
                gCDonVi.DataSource = listDonVi;
            }           
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                string dvTinh = txtDonViTinh.Text.Trim();
                DonViTinh dv = new DonViTinh
                {
                    TenDonVi = dvTinh
                };
                if (isUpdate)
                {
                    ////////////////////////
                }
                else
                {
                    if (listDonVi.Where(p => p.TenDonVi.ToLower() == dvTinh.ToLower()).Count() != 0)
                    {
                        MessageBox.Show("Đã tồn tại đơn vị này", "Cảnh báo", MessageBoxButtons.OK);
                    }
                    else
                    {
                        listDonVi.Add(dv);
                        listAdd.Add(dv);
                    }
                    gCDonVi.DataSource = null;
                    gCDonVi.DataSource = listDonVi;
                }               
            }
            catch
            {

            }           
        }
    }
}
