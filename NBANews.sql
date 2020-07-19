--使用mastrer数据库
use master
go

--判断NBANews数据库是否存在
if exists(select * from sysdatabases where name ='NBANewsDB')
drop database NBANewsDB
GO

--创建NBANews数据库
create database NBANewsDB
go

--使用NBANews数据库
use NBANewsDB
go

--判断NBASort(类别表)是否存在
if exists(select * from sysobjects where name = 'NBASort')
drop table NBASort
go

--创建类别表
create table NBASort
(
	NBASortID int primary key identity(1,1),	--类别ID
	NBASortName varchar(20) not null	--类别名称
)
go

--判断UserInfo(用户表)是否存在
if exists(select * from sysobjects where name = 'UserInfo')
drop table UserInfo
go

--创建UserInfo(用户表)
create table UserInfo
(
	UserID int primary key identity(1,1),	--用户ID
	UserName varchar(10) unique not null,	--用户名
	UserPwd varchar(16) not null,	--用户密码
	registerDay datetime not null,	--注册时间
	Email varchar(50) not null,	--电子邮箱
	permission int check(permission = 1 or permission = 2 or permission =3)	--权限 1最高， 2普通用户
)
go

--判断NBANews(新闻表)是否存在
if exists(select * from sysobjects where name = 'NBANews')
drop table NBANews
go

--创建NBANews(新闻表)
create table NBANews
(
	NBANewsID int primary key identity(1,1),	--新闻ID
	NBANewsTitle varchar(50) not null,	--新闻标题
	NBANewsInfo varchar(1000) not null,	--新闻内容
	ReleaseTime datetime not null,	--发布时间
	UserID int references UserInfo(UserID),	--用户ID(外健)
	ClickRate int not null,	--浏览次数
	Picture varchar(100),	--新闻配图
	NBASortID int references NBASort(NBASortID)	--类别ID(外健)
)
go

--判断Comment(评论表)是否存在
if exists(select * from sysobjects where name = 'Comment')
drop table Comment
go

--创建Comment(评论表)
--create table Comment
--(
--	CommentID int primary key identity(1,1),	--评论ID
--	CommentInfo varchar(150) not null,	--评论内容
--	NBANewsID int references NBANews(NBANewsID),	--新闻ID(外健)
--	CommentLike int not null,	--点赞数
--	UserID int references UserInfo(UserID)	--发布用户ID
--)
--go


--用户表插入数据
insert into UserInfo(UserName,UserPwd,registerDay,Email,permission) values('admin','123456','2018-12-06','1623885@qq.com',1)

--类别表插入数据
insert into NBASort(NBASortName) values('洛杉矶湖人队')
insert into NBASort(NBASortName) values('金州勇士队')
insert into NBASort(NBASortName) values('波士顿凯尔特队')
insert into NBASort(NBASortName) values('圣安东尼奥马刺队')
insert into NBASort(NBASortName) values('克利夫兰骑士队')
insert into NBASort(NBASortName) values('休斯顿火箭队')

--新闻表插入数据
insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('詹姆斯：毫不在意关于我的舆论导向，专注于本场比赛',
'湖人今日常规赛在主场以121-113战胜马刺，赛后湖人前锋勒布朗-詹姆斯接受了采访。

对于那些询问他是否应该控制自己在比赛中的工作量的问题，詹姆斯答道：“我一点儿也不在意关于我的舆论导向。那不重要。我全神贯注于这场比赛。”

“对我来说更重要的事情就是看到我的队友在第四节命中投篮，这是最重要的。”詹姆斯补充道。

勇士前锋凯文-杜兰特此前在接受采访时表示詹姆斯身边的舆论环境是“有毒的”，詹姆斯拒绝对此做出回应，并表示他需要查看完整的言论出处，需要弄清楚杜兰特被问到了什么，以及相关的语境。

本场比赛，詹姆斯出场40分钟，24投15中，三分球7投3中，罚球13罚9中得到42分5篮板6助攻2抢断。','2018-12-6',1,100,'',1)

--评论表插入数据
--insert into Comment(CommentInfo,NBANewsID,CommentLike,UserID) values('')

select * from UserInfo
select * from NBASort
select * from NBANews

select * from NBANews where NBANewsTitle like '%%'



insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('布克：勇士能随时打出一波高潮，必须要时刻警惕',
'虎扑1月1日讯 今天，太阳109-132不敌勇士。赛后，太阳球员德文-布克接受了记者的采访。

谈到在第二节被对手拉开比分，布克说：“勇士能在任何时候打出一波高潮，我们必须要时刻注意细节，必须要时刻怀有紧迫性。”

谈到借鉴勇士对球员的培养经验，布克说：“他们的球员们都在为彼此打球，一直以来，他们的球员都在发挥自己的优势。他们所有的决策都是为了球队。如果一个球员找到了状态，那他们就会持续给他机会。他们会打团队篮球，在防守端也能不断换防。”

在今天的比赛中，布克出场33分钟，得到20分2篮板6助攻。

(编辑：流浪的光)','2018-12-6',1,100,'1.png',1)

insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('太阳主帅：对阵卫冕冠军时，你的犯错余地很小',
'虎扑1月1日讯 今天，太阳109-132不敌勇士。赛后，太阳主帅伊戈尔-科科什科夫接受了记者的采访。

太阳曾一度和勇士打成45平。但随后勇士打出了一波24-7，在半场时拉开了比分。

谈到对阵勇士，科科什科夫说：“当你的对手是卫冕冠军，你犯错的空间很小。”

在今天的比赛中，太阳派出了米卡尔-布里奇斯、德安德烈-艾顿以及丹东尼-梅尔顿三名新秀首发。

谈到此事，科科什科夫说：“我可以每次都提一下，但我们得现实一点。让球员们适应、成长，这些需要时间。我们得支持他们，在他们犯错误的时候要理解他们。”

在今天的比赛中，布里奇斯出场33分钟，得到6分3篮板3助攻；梅尔顿出场26分钟，得到7分3篮板2助攻；艾顿出场34分钟，得到25分10篮板1助攻。','2018-12-6',1,100,'2.png',1)

insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('巴里亚：赛前就知道本场比赛难打，雷霆一定做好了准备',
'虎扑1月1日讯 今天，独行侠102-122不敌雷霆。赛后，独行侠球员何塞-巴里亚和多里安-芬尼-史密斯接受了记者的采访。

谈到本场比赛，芬尼-史密斯说：“在出现了29次失误的情况下你是无法赢得比赛的。我们搬起石头砸了自己的脚，但是，我们也得承认，对手表现得很好——他们做好了准备。”

“他们给足了防守压力，因为我们需要去攻击篮筐，不能打得太复杂。我们就是需要打出侵略性，要杀伤对手。但今晚他们有备而来，你能看得出来这一点。”

谈到本场比赛，巴里亚说：“我们知道，无论如何，今晚比赛都会很难打。我们上一场赢了他们，他们这一场一定会做好准备。”

在今天的比赛中，芬尼-史密斯出场24分钟，得到10分8篮板1助攻；巴里亚出场21分钟，得到6分3篮板8助攻。','2018-12-6',1,100,'3.png',1)


insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('利拉德秀帅照：我就是我，我一直在努力',
'虎扑1月1日讯 开拓者后卫达米安-利拉德今天在个人Instagram上晒出一张自己身穿休闲装的照片（见新闻配图）。

“这个姿势的意思是：‘我就是我，我一直在努力。’要么接受，要么放弃！新年快乐！！所有的爱都在。”利拉德写道。

本赛季常规赛，利拉德场均上场35.3分钟，得到26.8分4.7篮板5.8助攻。','2018-12-6',1,100,'4.jpg',1)

insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('韦德社交媒体感谢2018：2019年我准备好了',
'虎扑1月1日讯 热火后卫德维恩-韦德今天在个人Instagram上晒出一张自己的赛场照（见新闻配图）。

“谢谢你，2018！2019，我已经准备好了！#Wadecounty”韦德写道。

本赛季常规赛，韦德场均上场25.5分钟，得到14.1分3.6篮板3.9助攻。','2018-12-6',1,100,'5.jpg',1)

insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('加索尔庆祝复出并拿下胜利：告别2018年的最佳方式',
'虎扑1月1日讯 在今天结束的一场常规赛中，马刺120-111击败凯尔特人，本场比赛马刺前锋保罗-加索尔迎来了复出。

赛后加索尔在个人推特上写道：“复出并在主场取得胜利：告别2018年最佳的方式！”

本场比赛，加索尔替补上场5分钟，抢下5个后场篮板。','2018-12-6',1,100,'6.jpg',1)


insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('库里：我们今晚充满能量，第二阵容的表现非常关键',
'虎扑1月1日讯 在今日结束的一场常规赛中，勇士客场以132-109大胜太阳。赛后，勇士球员斯蒂芬-库里在场边接受了媒体采访。

谈到球队如何保持稳定性，库里说：“就是保持专注，每场比赛都贯彻我们的比赛计划。今晚我们的开局并不是很好，但我们在一些方面做得很棒，在上半场注重了一些简单的回合，努力用正确的方式打球。我们在防守端表现得不错，我们今晚充满能量。”

谈到球队替补的表现，库里说：“他们的表现非常关键，教练谈论了我们的轮换阵容，我们会安排很多球员出场，每个人都能够挺身而出，为球队做出贡献。你不能为了出场而出场，当你踏上赛场，你需要打成回合，帮助球队拿下胜利。今晚我们正朝着正确的方向前进。”

谈到乔丹-贝尔的表现，库里说：“他的表现非常不可思议，在防守端，他非常强硬，送出了两记非常漂亮的盖帽，他在场上的表现给我们留下了深刻的印象。”

谈到2018年的最后一场比赛（当地时间）以胜利告终，库里说：“很高兴2018年能有个皆大欢喜的结局，我们在今年拿到了总冠军，这是最棒的，之后又发生了很多事情。新的一年里，我们会做好准备。”

本场比赛，库里出场31分钟，17投11中，三分球9投5中，得到34分9篮板4助攻1抢断；贝尔出场16分钟，5投全中，得到10分6篮板2助攻3封盖。','2018-12-6',1,100,'7.png',1)




insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('威少：如果对手还给你同样的投篮机会，果断投就是了',
'虎扑1月1日讯 在今日结束的一场常规赛中，雷霆主场以122-102击败独行侠。赛后，雷霆球员拉塞尔-威斯布鲁克接受了媒体采访。

威斯布鲁克在上一场对阵独行侠的比赛中手感冰冷，全场比赛22投仅4中。本场比赛，他的手感回暖，出场35分钟，24投13中，得到32分11篮板11助攻4抢断。

“如果对手还是给你同样的投篮机会，那就果断投就是了。”威斯布鲁克说道。

本场比赛，雷霆全队送出13次抢断，迫使对手出现了26次失误。

“我们依靠我们防守端的表现，”威斯布鲁克说道，“无论发生什么，球队总是能够命中投篮，现如今联盟的比赛风格，充斥着大量的三分球，但我们却着重于其他方面，切断对手的传球线路、封盖和抢断，一旦我们因此获得快攻机会，这会让我们非常受益。”','2018-12-6',1,100,'8.jpg',1)

insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('全队庆生！詹姆斯：多么棒的一个生日',
'虎扑12月31日讯 湖人今天121-114战胜国王。与此同时，湖人前锋勒布朗-詹姆斯迎来了自己的34岁生日。虽然因伤未能上场，但詹姆斯更新推特表示赛后他邀请了全队同他庆祝生日。

“多么棒的一个生日！我的兄弟们拿下了胜利，赛后又前来和我的家人朋友们一同庆祝！不能要求更好的一天了！特别感谢我的王后@Savannah 安排了惊喜的赛后庆祝活动。”詹姆斯写道。

湖人后卫约什-哈特在个人Instagram Story上更新了詹姆斯生日聚会的现场视频。

“生日快乐，大哥@勒布朗-詹姆斯”哈特写道。','2018-12-6',1,100,'9.jpg',1)

insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('保罗祝詹姆斯生日快乐，并调侃其发际线变化',
'虎扑12月31日讯 今天是湖人球员勒布朗-詹姆斯的生日，火箭球员克里斯-保罗也更新了自己的Instagram向詹姆斯送上了生日祝福。

“并肩同行多年，生日快乐我的兄弟！#兄弟#发际线大有不同”保罗写道。

','2018-12-6',1,100,'10.png',1)

insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('詹姆斯：2016年夺冠时，我感觉自己成为了历史最佳',
'虎扑12月31日讯 湖人前锋勒布朗-詹姆斯在最新一集的纪录片《不只是一名运动员》中表达了关于史上最佳球员的看法。

谈到2016年率领骑士夺冠，詹姆斯表示：“就是那一冠让我成为了史上最佳球员，我是这么感觉的。能为克利夫兰夺冠，我超级激动，那可是长达52年的冠军荒啊，让我欣喜若狂。第一反应涌上心头，大家都看到我哭了，因为那是克利夫兰体育史这52年以来唯一的收获。然后当我不再哭了，我就想到，‘就是这一冠让你成为了历史最佳球员。’大家都在谈论他们是史上最佳球队，有史以来最强大的球队，然后我们逆转取胜的方式，我能够对自己说，‘你完成了一项特殊的成就。’那也是我生涯仅有的几次能让自己感觉到，‘你做到了一些特别的事。’我没有太多时间坐下来这么想，但那个时刻就是这样。”

','2018-12-6',1,100,'11.jpg',1)


insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('球队三分出手44次是好是坏？哈特：我喜欢，我是个投手',
'虎扑12月31日讯 在今日结束的一场常规赛中，湖人主场以121-114击败国王。赛后，湖人球员约什-哈特在更衣室接受了媒体采访。

谈到自己在进攻端的表现，哈特说：“BI（布兰登-英格拉姆）在场上找到了我，他能够将球及时给到弱侧的我，这让我感觉很舒服。他和Zo（朗佐-鲍尔）、Kuz（凯尔-库兹马），他们为我创造了很棒的出手机会。”

谈到球队完成逆转的原因，哈特说：“我们重拾了防守强度，降低对方的进攻篮板，限制二次进攻的机会。我认为这场比赛非常重要，这体现了我们的成熟。之前他们拿下那场我们本来胜券在握的比赛，之后我们一度领先快船10分，我们知道我们必须触底反弹，我们必须有所成长。”

湖人全场比赛三分出手44次，记者问他这是好事还是坏事，哈特笑着说：“我挺喜欢的，我是个投手，投手就应该投篮。其中的很多出手都是空位，当然也有一些有身体接触，但我们在球的内外传导方面做得很出色，我们努力在场上找到处于空位的队友。所以，我挺喜欢的。”

本场比赛，哈特出场40分钟，14投8中，得到22分7篮板3助攻2抢断。

','2018-12-6',1,100,'12.jpg',1)
