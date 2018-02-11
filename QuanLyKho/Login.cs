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
using System.Threading;
using DataAccess.DAL;
using DataAccess.ObjectsDump;
using Microsoft.Win32;
using DesignClasses;

namespace QuanLyKho
{
    public partial class Login : DevExpress.XtraEditors.XtraForm
    {
        Thread mainThread;
        const string KEY_REG = "Vidai\\quanlykho";
        private UserDump user;
        public Login()
        {
            InitializeComponent();
            DataAccess.DBConnect.chuoiketnoi = System.Configuration.ConfigurationSettings.AppSettings["SERVER_KEY"];

        }
        private void OpenFormMain()
        {
            Application.Run(new FormMain(user));
        }
        private void btnOK_Click(object sender, EventArgs e)
        {
            UserDAL userDAL = new UserDAL();
            user=userDAL.login(txtTaiKhoan.Text, txtMK.Text);
            if (user != null)
            {
                if (cbSaveInfo.Checked)
                {
                    saveInfo(txtTaiKhoan.Text, txtMK.Text);
                }
                else
                {
                    removeInfo();
                }
                
                loginCompleted();
            }
            else
            {
                MessageBox.Show("Tên tài khoản hoặc mật khẩu không đúng!");
            }
            
        }
        public void saveInfo(string username,string password)
        {
                //lưu mật khẩu
                Utilities.WriteReg(KEY_REG, "user", txtTaiKhoan.Text);
                Utilities.WriteReg(KEY_REG, "pass", txtMK.Text);

        }
        public void removeInfo()
        {
            //không lưu mật khẩu
            Utilities.WriteReg(KEY_REG, "user", "");
            Utilities.WriteReg(KEY_REG, "pass", "");
         }
        public void loginCompleted()
        {
            mainThread = new Thread(OpenFormMain);
            mainThread.SetApartmentState(ApartmentState.STA);
            mainThread.Start();
            this.Close();
        }

        private void Login_Load(object sender, EventArgs e)
        {
            string struser = Utilities.ReadReg(KEY_REG, "user");
            string strpass = Utilities.ReadReg(KEY_REG, "pass");

            if (struser != "" && strpass != "")
            {
                cbSaveInfo.Checked = true;
            }
            else
            {
                cbSaveInfo.Checked = false;
            }

           
                txtTaiKhoan.Text = struser;
                txtMK.Text = strpass;
        }
    }
}