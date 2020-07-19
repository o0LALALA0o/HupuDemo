using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DAL
{
    public class NBASort_DAL
    {
        public static DataTable getNBASort()
        {
            return DBHelper.getTable("select * from NBASort");
        }
    }
}
