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

namespace QuanLyKho
{
    public partial class FormQLDMTaiKhoan : DevExpress.XtraEditors.XtraUserControl
    {
        public FormQLDMTaiKhoan()
        {
            InitializeComponent();

            gCLoaiTK.DataSource = GetDataSource();          
        }
        static List<Quyen> GetDataSource()
        {
            List<Quyen> result = new List<Quyen>();
            result.Add(new Quyen()
            {
                ID = 1,
                LoaiTaiKhoan = "Người quản lý"
            });
            result.Add(new Quyen()
            {
                ID = 2,
                LoaiTaiKhoan = "Nhân viên"
            });
            return result;
        }

        public class Quyen
        {
            [Key, Display(AutoGenerateField = false)]
            public int ID { get; set; }
            [Required]
            [Display(Name = "Loại tài khoản")]
            public string LoaiTaiKhoan { get; set; }
        }
        
    }
}
