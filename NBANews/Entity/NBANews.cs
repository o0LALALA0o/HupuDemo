using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class NBANews
    {
        //新闻ID
        public string NBANewsID { get; set; }

        //新闻标题
        public string NBANewsTitle { get; set; }

        //新闻内容
        public string NBANewsInfo{ get; set; }

        //发布时间
        public string ReleaseTime{ get; set; }

        //用户ID(外健)
        public string UserID { get; set; }

        //浏览次数
        public string ClickRate{ get; set; }

        //新闻配图
        public string Picture { get; set; }

        //类别ID(外健)
        public string NBASortID { get; set; }
    }
}
