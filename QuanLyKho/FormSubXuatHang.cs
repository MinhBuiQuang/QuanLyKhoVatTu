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

namespace QuanLyKho
{
    public partial class FormSubXuatHang : DevExpress.XtraEditors.XtraForm
    {
        public float SoLuong { get; set; }
        public FormSubXuatHang(float TonKho)
        {
            InitializeComponent();
            spinEdit1.Properties.MinValue = 0;
            spinEdit1.Properties.MaxValue = Convert.ToDecimal(TonKho);
            btnOK.DialogResult = DialogResult.OK;
            btnHuy.DialogResult = DialogResult.No;
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            SoLuong = (float)Convert.ToDecimal(spinEdit1.EditValue);
            this.Close();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}