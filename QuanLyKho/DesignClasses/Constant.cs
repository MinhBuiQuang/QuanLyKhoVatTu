using DevExpress.LookAndFeel;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyKho.DesignClasses
{
    public class Constant
    {
        public static void ChangeDevexpressTheme()
        {
            UserLookAndFeel.Default.SkinName = "Office 2016 Colorful";
            UserLookAndFeel.Default.SkinMaskColor = Color.Aqua;
        }
    }
}
