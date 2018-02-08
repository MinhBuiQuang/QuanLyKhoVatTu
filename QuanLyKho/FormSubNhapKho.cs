using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using DataAccess.DAL;
using DataAccess.Objects;

namespace QuanLyKho
{
    public partial class FormSubNhapKho : DevExpress.XtraEditors.XtraForm
    {
        HangHoaDAL da;
        LichSuKho lsk;
        DonViTinhDAL dvt;
        public FormSubNhapKho(int IDHangHoa)
        {
            InitializeComponent();
            lsk = new LichSuKho();
            lsk.HangHoaXuLy.IDHangHoa = IDHangHoa;
            lsk.NguoiThucHien = FormMain.nguoiDung;
            lsk.IsXuat = false;
            txtSLChiTiet.Enabled = false;
            txtDonGiaCT.Enabled = false;
            lueDonVi.Enabled = false;
        }

        private void ceHaveSub_CheckedChanged(object sender, EventArgs e)
        {
            if (ceHaveSub.Checked)
            {
                DialogResult result = MessageBox.Show("Bạn có chắc chắn chọn chức năng này?", "Cảnh báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if (result == System.Windows.Forms.DialogResult.Yes)
                {
                    txtSLChiTiet.Enabled = true;
                    lueDonVi.Enabled = true;
                    txtDonGiaCT.Enabled = true;
                }
                else
                {
                    ceHaveSub.Checked = false;
                }
            }
            else
            {
                txtSLChiTiet.Enabled = false;
                lueDonVi.Enabled = false;
                txtDonGiaCT.Enabled = false;
            }
        }
        private bool ValidateField()
        {
            float soLuong = (float)Convert.ToDecimal(txtSL.EditValue); 
            float donGiaSub = (float)Convert.ToDecimal(txtDonGiaCT.EditValue);
            float soLuongSub = (float)Convert.ToDecimal(txtSLChiTiet.EditValue);
            if (soLuong <= 0)
            {
                MessageBox.Show("Vui lòng nhập đầy đủ giá trị", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            if (ceHaveSub.Checked && (donGiaSub <= 0 || soLuongSub <= 0 || lueDonVi.EditValue == null))
            {
                MessageBox.Show("Vui lòng nhập đầy đủ trị", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            return true;
        }
        private void Save()
        {
            try
            {
                DialogResult result = MessageBox.Show("Vui lòng kiểm tra trước khi xác nhận!", "Cảnh báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if (result == System.Windows.Forms.DialogResult.Yes)
                {
                    da = new HangHoaDAL();
                    lsk.SoLuong = (float)Convert.ToDecimal(txtSL.EditValue);
                    lsk.ThoiGian = DateTime.Now;
                    if (ceHaveSub.Checked)
                    {
                        float donGiaSub = (float)Convert.ToDecimal(txtDonGiaCT.EditValue);
                        float soLuongSub = (float)Convert.ToDecimal(txtSLChiTiet.EditValue);
                        int donViSub = (int)lueDonVi.EditValue;
                        da.NhapKho(lsk, donGiaSub, soLuongSub, donViSub);
                    }
                    else
                    {
                        da.NhapKho(lsk);
                    }
                }
            }
            catch(Exception ex)
            {
                
            }            
        }
        private void btnOK_Click(object sender, EventArgs e)
        {
            if (!ValidateField())
                return;
            Save();
            this.Close();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void LoadDonViTinh()
        {
            try
            {
                dvt = new DonViTinhDAL();
                DataTable dt = dvt.GetDonViTinh();
                lueDonVi.Properties.DataSource = dt;
                lueDonVi.Properties.DisplayMember = "TenDonVi";
                lueDonVi.Properties.ValueMember = "IDDonVi";
                DevExpress.XtraEditors.Controls.LookUpColumnInfo col;

                col = new DevExpress.XtraEditors.Controls.LookUpColumnInfo("TenDonVi", "Đơn vị");
                col.SortOrder = DevExpress.Data.ColumnSortOrder.Ascending;
                lueDonVi.Properties.Columns.Add(col);
            }
            catch
            {

            }
        }
        private void FormSubNhapKho_Load(object sender, EventArgs e)
        {
            LoadDonViTinh();
        }
    }
}