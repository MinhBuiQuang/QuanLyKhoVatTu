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
using DataAccess.Objects;

namespace QuanLyKho
{
    public partial class FormQLDMTaiKhoan : DevExpress.XtraEditors.XtraUserControl
    {
        private List<Quyen> listDonVi = new List<Quyen>();
        private List<Quyen> listAdd = new List<Quyen>();
        private List<Quyen> listRemove = new List<Quyen>();
        private List<Quyen> listEdit = new List<Quyen>();
        public FormQLDMTaiKhoan()
        {
            InitializeComponent();

            gCLoaiTK.DataSource = GetDataSource();          
        }
        static List<Quyen> GetDataSource()
        {
            List<Quyen> result = new List<Quyen>();          
            return result;
        }       
    }
}
