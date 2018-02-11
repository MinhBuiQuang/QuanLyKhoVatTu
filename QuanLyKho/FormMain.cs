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
using DevExpress.LookAndFeel;
using QuanLyKho.DesignClasses;
using DataAccess.Objects;
using DataAccess.ObjectsDump;

namespace QuanLyKho
{
    public partial class FormMain : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public static User nguoiDung = new User();
        public FormMain()
        {
            InitializeComponent();
            Constant.ChangeDevexpressTheme();
            
        }
        public FormMain(UserDump user)
        {
            InitializeComponent();
            Constant.ChangeDevexpressTheme();
            User usr = new User();
            usr.IDUser = user.IDUser;
            usr.Username = user.Username;
            usr.Ho = user.Ho;
            usr.Ten = user.Ten;
            nguoiDung = usr;
        }
        public FormMain(int IDUser)
        {
            InitializeComponent();
            Constant.ChangeDevexpressTheme();
            nguoiDung.IDUser = IDUser;
        }

        private void LoadMainPanel(Control control)
        {
            control.Dock = DockStyle.Fill;
            mainPanel.Controls.Clear();
            mainPanel.Controls.Add(control);
        }
        private void FormMain_Load(object sender, EventArgs e)
        {
            UCMainAdministrator frm = new UCMainAdministrator();
            LoadMainPanel(frm);
            barHeaderItem1.Caption=nguoiDung.Ho.ToUpper()+" "+nguoiDung.Ten.ToUpper()+". Đăng nhập lúc: "+DateTime.Now.ToString("hh:mm:ss tt");
           
        }

        private void btnDMLoaiTaiKhoan_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            FormQLDMTaiKhoan form = new FormQLDMTaiKhoan();
            LoadMainPanel(form);
        }

        private void btnHangHoa_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            FormQLHangHoa form = new FormQLHangHoa();
            LoadMainPanel(form);
        }

        private void btnTaiKhoan_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            FormQLDSNhanVien form = new FormQLDSNhanVien();
            LoadMainPanel(form);
        }

        private void btnTrangChu_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            UCMainAdministrator uc = new UCMainAdministrator();
            LoadMainPanel(uc);
        }

        private void btnDMDonVi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            FormDMDonViTinh form = new FormDMDonViTinh();
            LoadMainPanel(form);
        }

        private void btnDMLoaiHang_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            FormDMLoaiHang form = new FormDMLoaiHang();
            LoadMainPanel(form);
        }

        private void btnQLKhachHang_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            FormQLDSKhachHang hihi = new FormQLDSKhachHang();
            LoadMainPanel(hihi);
        }

        private void btnNhaCC_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            FormQLDSNhaCungCap hihi = new FormQLDSNhaCungCap();
            LoadMainPanel(hihi);
        }

        private void btnNhaSX_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            FormQLDSNhaSanXuat hihi = new FormQLDSNhaSanXuat();
            LoadMainPanel(hihi);
        }
    }
}