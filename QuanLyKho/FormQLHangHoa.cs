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
    public partial class FormQLHangHoa : DevExpress.XtraEditors.XtraUserControl
    {
        public FormQLHangHoa()
        {
            InitializeComponent();

            gCHangHoa.DataSource = GetDataSource();
        }
        void windowsUIButtonPanel_ButtonClick(object sender, DevExpress.XtraBars.Docking2010.ButtonEventArgs e)
        {
            if (e.Button.Properties.Caption == "Print") gCHangHoa.ShowRibbonPrintPreview();
        }
        public DataTable GetDataSource()
        {
            //BindingList<HangHoa> result = new BindingList<HangHoa>();
            HangHoaDAL da = new HangHoaDAL();
            try
            {

            }
            catch
            {

            }
            return da.GetHangHoa();
        }
        public class HangHoa
        {
            [Key, Display(AutoGenerateField = false)]
            public int ID { get; set; }
            [Required]
            public string TenMatHang { get; set; }
            public string Loai { get; set; }
            public string TonKho { get; set; }
            public string DonGia { get; set; }
        }
    }
}
