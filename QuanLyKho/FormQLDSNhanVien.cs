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

namespace QuanLyKho
{
    public partial class FormQLDSNhanVien : DevExpress.XtraEditors.XtraUserControl
    {
        public FormQLDSNhanVien()
        {
            InitializeComponent();            
            gCDSNhanVien.DataSource = GetDataSource();
        }
        void windowsUIButtonPanel_ButtonClick(object sender, DevExpress.XtraBars.Docking2010.ButtonEventArgs e)
        {
            if (e.Button.Properties.Caption == "Print") gCDSNhanVien.ShowRibbonPrintPreview();
            if (e.Button.Properties.Caption == "Thêm nhân viên")
            {
                this.Controls.Clear();                
                FormQLNhanVien frm = new FormQLNhanVien();
                frm.Dock = DockStyle.Fill;
                this.Controls.Add(frm);                
            }
        }
        public DataTable GetDataSource()
        {
            BindingList<Customer> result = new BindingList<Customer>();
            UserDAL da = new UserDAL(); 
            try
            {

            }   
            catch(Exception ex)
            {

            }       
            return da.GetUser();
        }
        public class Customer
        {
            [Key, Display(AutoGenerateField = false)]
            public int ID { get; set; }
            [Required]
            [Display(Name ="Tên nhân viên")]
            public string TenNhanVien { get; set; }
            [Display(Name = "Địa chỉ")]
            public string DiaChi { get; set; }
            [Display(Name = "Số điện thoại")]
            public string Phone { get; set; }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            this.Controls.Clear();
            FormQLNhanVien frm = new FormQLNhanVien(true);
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
