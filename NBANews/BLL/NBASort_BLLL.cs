﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace BLL
{
    public class NBASort_BLLL
    {
        public static DataTable getNBASort()
        {
            return DAL.NBASort_DAL.getNBASort();
        }
    }
}
