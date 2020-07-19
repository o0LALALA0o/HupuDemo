using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DAL
{
    public class NBANews_DAL
    {
        public static DataTable getNBANewsTitle(int i) 
        {
            return DBHelper.getTable("select top 10 * from NBANews where NBANewsID not in (select top (("+i+"-1)*10) NBANewsID from NBANews order by ReleaseTime desc) order by ReleaseTime desc");
            //return DBHelper.getTable("select * from NBANews order by ReleaseTime desc");
        }

        public static DataTable getNBANewsByNBANewsID(string NBANewsID)
        {
            string sql = "select * from NBANews inner join UserInfo on NBANews.UserID = UserInfo.UserID where NBANewsID = " + NBANewsID;
            return DBHelper.getTable(sql);
        }

        public static DataTable getNBANewsTitleByTop()
        {
            return DBHelper.getTable("select top 10 * from NBANews order by ClickRate desc");
        }

        public static DataTable getNBANewsTitleBySearch(string Search)
        {
            return DBHelper.getTable("select * from NBANews where NBANewsTitle like '%"+Search+"%'");
        }

        public static int insertNBANews(Entity.NBANews NBANews)
        {
            string sql = string.Format("insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('{0}','{1}','{2}',{3},{4},'{5}',{6})",NBANews.NBANewsTitle,NBANews.NBANewsInfo,DateTime.Now,NBANews.UserID,NBANews.ClickRate,NBANews.Picture,NBANews.NBASortID);
            return DBHelper.ExecuteNonQuery(sql);
        }

        public static void updateClickRate(string NBANewsID)
        {
            string sql = "update NBANews set ClickRate=ClickRate+1 where NBANewsID = " + NBANewsID;
            DBHelper.ExecuteNonQuery(sql);
        }
    }
}
