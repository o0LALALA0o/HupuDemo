using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace BLL
{
    public class NBANews_BLL
    {
        public static DataTable getNBANewsTitle(int i)
        {
            return DAL.NBANews_DAL.getNBANewsTitle(i);
        }

        public static DataTable getNBANewsByNBANewsID(string NBANewsID)
        {
            return DAL.NBANews_DAL.getNBANewsByNBANewsID(NBANewsID);
        }

        public static DataTable getNBANewsTitleByTop()
        {
            return DAL.NBANews_DAL.getNBANewsTitleByTop();
        }

        public static DataTable getNBANewsTitleBySearch(string Search)
        {
            return DAL.NBANews_DAL.getNBANewsTitleBySearch(Search);
        }

        public static int insertNBANews(Entity.NBANews NBANews)
        {
            return DAL.NBANews_DAL.insertNBANews(NBANews);
        }

        public static void updateClickRate(string NBANewsID)
        {
            DAL.NBANews_DAL.updateClickRate(NBANewsID);
        }
    }
}
