﻿using System;
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

namespace QuanLyKho
{
    public partial class Login : DevExpress.XtraEditors.XtraForm
    {
        Thread mainThread;
        public Login()
        {
            InitializeComponent();
            DataAccess.DBConnect.chuoiketnoi = System.Configuration.ConfigurationSettings.AppSettings["SERVER_KEY"];
        }
        private void OpenFormMain()
        {
            Application.Run(new FormMain());
        }
        private void btnOK_Click(object sender, EventArgs e)
        {
            mainThread = new Thread(OpenFormMain);
            mainThread.SetApartmentState(ApartmentState.STA);
            mainThread.Start();
            this.Close();
        }
    }
}