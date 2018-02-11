using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Objects
{
    public class Quyen
    {
        public Quyen()
        {

        }
        public Quyen(int id ,string name)
        {
            IDQuyen = id;
            TenQuyen = name;
        }
        public int IDQuyen { get; set; }
        public string TenQuyen { get; set; }
    }
}
