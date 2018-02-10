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
using System.IO;
using DevExpress.XtraLayout.Helpers;
using DevExpress.XtraLayout;
using DataAccess.DAL;
using DataAccess.Objects;
using QuanLyKho.DesignClasses;

namespace QuanLyKho
{
    public partial class FormQLChiTietHangHoa_V2 : DevExpress.XtraEditors.XtraUserControl
    {

        HangHoaDAL da;
        HangHoa hangHoa = new HangHoa();
        bool isUpdate = false;

        public FormQLChiTietHangHoa_V2()
        {
            InitializeComponent();
            labelControl.Text = "Tạo mặt hàng mới";
            isUpdate = false;
        }

        public FormQLChiTietHangHoa_V2(int IDHangHoa)
        {
            InitializeComponent();
            picHangHoa.Image = HamChung.GetNoImage();
            GetDataSource(IDHangHoa);
            isUpdate = true;
        }
        private void FormQLChiTietHangHoa_V2_Load(object sender, EventArgs e)
        {
            SetupLookupEdit();
        }

        private void SetupLookupEdit()
        {
            try
            {
                //Load Don vi tinh
                lueDonVi.Properties.DataSource = new DonViTinhDAL().GetDonViTinh();
                lueDonVi.Properties.DisplayMember = "TenDonVi";
                lueDonVi.Properties.ValueMember = "IDDonVi";
                DevExpress.XtraEditors.Controls.LookUpColumnInfo coldv;

                coldv = new DevExpress.XtraEditors.Controls.LookUpColumnInfo("TenDonVi", "Đơn vị");
                coldv.SortOrder = DevExpress.Data.ColumnSortOrder.Ascending;
                lueDonVi.Properties.Columns.Add(coldv);

                //Load
                lueLoaiHang.Properties.DataSource = new LoaiHangDAL().GetLoaiHang();
                lueLoaiHang.Properties.DisplayMember = "TenLoai";
                lueLoaiHang.Properties.ValueMember = "IDLoaiHang";
                DevExpress.XtraEditors.Controls.LookUpColumnInfo collh;

                collh = new DevExpress.XtraEditors.Controls.LookUpColumnInfo("TenLoai", "Tên loại");
                collh.SortOrder = DevExpress.Data.ColumnSortOrder.Ascending;
                lueLoaiHang.Properties.Columns.Add(collh);
                //Load nha cung cap
                //Load
            }
            catch (Exception ex)
            {

            }
        }
        private bool ValidateField()
        {
            if (String.IsNullOrWhiteSpace(txtTenHangHoa.Text))
            {
                MessageBox.Show("Vui lòng nhập tên hàng hóa", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            if (String.IsNullOrWhiteSpace(txtDonGia.Text) || (float)Convert.ToDecimal(txtDonGia.EditValue) <= 0)
            {
                MessageBox.Show("Vui lòng nhập đơn giá", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            if (lueLoaiHang.EditValue == null)
            {
                MessageBox.Show("Vui lòng chọn loại hàng!", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            if (lueDonVi.EditValue == null)
            {
                MessageBox.Show("Vui lòng chọn đơn vị tính!", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            return true;
        }
      

        private void GetDataSource(int IDHangHoa)
        {
            da = new HangHoaDAL();
            DataTable dt = new DataTable();
            dt = da.GetHangHoa(IDHangHoa);
            HamChung hc = HamChung.builder;           
            if (dt.Rows.Count == 0)
            {
                MessageBox.Show("Không tìm thấy mặt hàng này!");
                Back();
            }
            List<HangHoa> listHangHoa = hc.DataTableToList<HangHoa>(dt);
            hangHoa = listHangHoa[0];

            txtMaHangHoa.Text = hangHoa.MaHangHoa;
            txtTenHangHoa.Text = hangHoa.TenHangHoa;
            if (!String.IsNullOrWhiteSpace(dt.Rows[0]["IDLoaiHang"].ToString()))
                lueLoaiHang.EditValue = int.Parse(dt.Rows[0]["IDLoaiHang"].ToString());
            if (!String.IsNullOrWhiteSpace(dt.Rows[0]["IDNhaCungCap"].ToString()))
                lueNhaCungCap.EditValue = int.Parse(dt.Rows[0]["IDNhaCungCap"].ToString());
            if (!String.IsNullOrWhiteSpace(dt.Rows[0]["IDDonVi"].ToString()))
                lueDonVi.EditValue = int.Parse(dt.Rows[0]["IDDonVi"].ToString());
            if (!String.IsNullOrWhiteSpace(dt.Rows[0]["IDViTri"].ToString()))
                lueViTri.EditValue = int.Parse(dt.Rows[0]["IDViTri"].ToString());
            txtDonGia.Text = dt.Rows[0]["DonGia"].ToString();
            txtGhiChu.Text = dt.Rows[0]["GhiChu"].ToString();
            string img = dt.Rows[0]["Image"].ToString();
            if (!String.IsNullOrWhiteSpace(img))
            {
                picHangHoa.Image = HamChung.Base64ToImage(img);
            }
        }
        

        private void Create()
        {
            try
            {
                da = new HangHoaDAL();
                hangHoa.LoaiHangHoa.IDLoaiHang = (int)lueLoaiHang.EditValue;
                hangHoa.NguonCungCap.IDNhaCungCap = lueNhaCungCap.EditValue == null? 0 : (int)lueNhaCungCap.EditValue;
                hangHoa.ViTriHangHoa.IDViTri = lueViTri.EditValue == null ? 0 : (int)lueViTri.EditValue;
                hangHoa.DonVi.IDDonVi = (int)lueDonVi.EditValue;
                hangHoa.GhiChu = txtGhiChu.Text;
                hangHoa.TenHangHoa = txtTenHangHoa.Text;
                hangHoa.DonGia = (float)Convert.ToDecimal(txtDonGia.EditValue);
                da.Insert(hangHoa);
                MessageBox.Show("Tạo mới thành công");
                Back();
            }
            catch (Exception ex)
            {

            }
        }

        private void UpdateHangHoa()
        {
            try
            {
                da = new HangHoaDAL();
                hangHoa.LoaiHangHoa.IDLoaiHang = (int)lueLoaiHang.EditValue;
                hangHoa.NguonCungCap.IDNhaCungCap = lueNhaCungCap.EditValue == null ? 0 : (int)lueNhaCungCap.EditValue;
                hangHoa.ViTriHangHoa.IDViTri = lueViTri.EditValue == null ? 0 : (int)lueViTri.EditValue;
                hangHoa.DonVi.IDDonVi = (int)lueDonVi.EditValue;
                hangHoa.GhiChu = txtGhiChu.Text;
                hangHoa.TenHangHoa = txtTenHangHoa.Text;
                hangHoa.DonGia = (float)Convert.ToDecimal(txtDonGia.EditValue);
                da.Update(hangHoa);
                MessageBox.Show("Sửa thành công");
                Back();
            }
            catch (Exception ex)
            {

            }
        }

        private void picHangHoa_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Title = "Chọn ảnh";
            ofd.Filter = "Image|*.png;*.jpg;*.jpeg";
            if (ofd.ShowDialog() == DialogResult.OK)
            {
                using (Image image = Image.FromFile(ofd.FileName))
                {
                    using (MemoryStream m = new MemoryStream())
                    {
                        image.Save(m, image.RawFormat);
                        byte[] imageBytes = m.ToArray();

                        string base64String = Convert.ToBase64String(imageBytes);
                        hangHoa.Image = base64String;
                        picHangHoa.Image = HamChung.Base64ToImage(base64String);
                    }
                }
            }
            
        }

        private void windowsUIButtonPanelMain_ButtonClick(object sender, DevExpress.XtraBars.Docking2010.ButtonEventArgs e)
        {
            if (e.Button.Properties.Caption == "Lưu")
            {
                if (!ValidateField())
                    return;
                if (isUpdate)
                {
                    UpdateHangHoa();                    
                }
                else
                {
                    Create();                                   
                }
                
            }

            if (e.Button.Properties.Caption == "Làm mới")
            {
                if (!ValidateField())
                    return;

            }
        }

        private void Back()
        {
            this.Controls.Clear();
            FormQLHangHoa frm = new FormQLHangHoa();
            frm.Dock = DockStyle.Fill;
            this.Controls.Add(frm);
        }

        private void windowsUIButtonPanelCloseButton_ButtonClick(object sender, DevExpress.XtraBars.Docking2010.ButtonEventArgs e)
        {
            if (e.Button.Properties.Caption == "Back")
            {
                DialogResult result = MessageBox.Show("Bạn đang chỉnh sửa, bạn có chắc chắn muốn quay lại?", "Cảnh báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if (result == System.Windows.Forms.DialogResult.Yes)
                {
                    Back();
                }                
            }
        }
    }
}
