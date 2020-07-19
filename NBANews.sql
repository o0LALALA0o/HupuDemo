--ʹ��mastrer���ݿ�
use master
go

--�ж�NBANews���ݿ��Ƿ����
if exists(select * from sysdatabases where name ='NBANewsDB')
drop database NBANewsDB
GO

--����NBANews���ݿ�
create database NBANewsDB
go

--ʹ��NBANews���ݿ�
use NBANewsDB
go

--�ж�NBASort(����)�Ƿ����
if exists(select * from sysobjects where name = 'NBASort')
drop table NBASort
go

--��������
create table NBASort
(
	NBASortID int primary key identity(1,1),	--���ID
	NBASortName varchar(20) not null	--�������
)
go

--�ж�UserInfo(�û���)�Ƿ����
if exists(select * from sysobjects where name = 'UserInfo')
drop table UserInfo
go

--����UserInfo(�û���)
create table UserInfo
(
	UserID int primary key identity(1,1),	--�û�ID
	UserName varchar(10) unique not null,	--�û���
	UserPwd varchar(16) not null,	--�û�����
	registerDay datetime not null,	--ע��ʱ��
	Email varchar(50) not null,	--��������
	permission int check(permission = 1 or permission = 2 or permission =3)	--Ȩ�� 1��ߣ� 2��ͨ�û�
)
go

--�ж�NBANews(���ű�)�Ƿ����
if exists(select * from sysobjects where name = 'NBANews')
drop table NBANews
go

--����NBANews(���ű�)
create table NBANews
(
	NBANewsID int primary key identity(1,1),	--����ID
	NBANewsTitle varchar(50) not null,	--���ű���
	NBANewsInfo varchar(1000) not null,	--��������
	ReleaseTime datetime not null,	--����ʱ��
	UserID int references UserInfo(UserID),	--�û�ID(�⽡)
	ClickRate int not null,	--�������
	Picture varchar(100),	--������ͼ
	NBASortID int references NBASort(NBASortID)	--���ID(�⽡)
)
go

--�ж�Comment(���۱�)�Ƿ����
if exists(select * from sysobjects where name = 'Comment')
drop table Comment
go

--����Comment(���۱�)
--create table Comment
--(
--	CommentID int primary key identity(1,1),	--����ID
--	CommentInfo varchar(150) not null,	--��������
--	NBANewsID int references NBANews(NBANewsID),	--����ID(�⽡)
--	CommentLike int not null,	--������
--	UserID int references UserInfo(UserID)	--�����û�ID
--)
--go


--�û�����������
insert into UserInfo(UserName,UserPwd,registerDay,Email,permission) values('admin','123456','2018-12-06','1623885@qq.com',1)

--������������
insert into NBASort(NBASortName) values('��ɼ�����˶�')
insert into NBASort(NBASortName) values('������ʿ��')
insert into NBASort(NBASortName) values('��ʿ�ٿ����ض�')
insert into NBASort(NBASortName) values('ʥ����������̶�')
insert into NBASort(NBASortName) values('����������ʿ��')
insert into NBASort(NBASortName) values('��˹�ٻ����')

--���ű���������
insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('ղķ˹��������������ҵ����۵���רע�ڱ�������',
'���˽��ճ�������������121-113սʤ���̣��������ǰ���ղ���-ղķ˹�����˲ɷá�

������Щѯ�����Ƿ�Ӧ�ÿ����Լ��ڱ����еĹ����������⣬ղķ˹���������һ���Ҳ����������ҵ����۵����ǲ���Ҫ����ȫ���ע���ⳡ��������

��������˵����Ҫ��������ǿ����ҵĶ����ڵ��Ľ�����Ͷ������������Ҫ�ġ���ղķ˹�������

��ʿǰ�濭��-�����ش�ǰ�ڽ��ܲɷ�ʱ��ʾղķ˹���ߵ����ۻ����ǡ��ж��ġ���ղķ˹�ܾ��Դ�������Ӧ������ʾ����Ҫ�鿴���������۳�������ҪŪ��������ر��ʵ���ʲô���Լ���ص��ﾳ��

����������ղķ˹����40���ӣ�24Ͷ15�У�������7Ͷ3�У�����13��9�еõ�42��5����6����2���ϡ�','2018-12-6',1,100,'',1)

--���۱���������
--insert into Comment(CommentInfo,NBANewsID,CommentLike,UserID) values('')

select * from UserInfo
select * from NBASort
select * from NBANews

select * from NBANews where NBANewsTitle like '%%'



insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('���ˣ���ʿ����ʱ���һ���߳�������Ҫʱ�̾���',
'����1��1��Ѷ ���죬̫��109-132������ʿ������̫����Ա����-���˽����˼��ߵĲɷá�

̸���ڵڶ��ڱ����������ȷ֣�����˵������ʿ�����κ�ʱ����һ���߳������Ǳ���Ҫʱ��ע��ϸ�ڣ�����Ҫʱ�̻��н����ԡ���

̸�������ʿ����Ա���������飬����˵�������ǵ���Ա�Ƕ���Ϊ�˴˴���һֱ���������ǵ���Ա���ڷ����Լ������ơ��������еľ��߶���Ϊ����ӡ����һ����Ա�ҵ���״̬�������Ǿͻ�����������ᡣ���ǻ���Ŷ������ڷ��ض�Ҳ�ܲ��ϻ�������

�ڽ���ı����У����˳���33���ӣ��õ�20��2����6������

(�༭�����˵Ĺ�)','2018-12-6',1,100,'1.png',1)

insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('̫����˧����������ھ�ʱ����ķ�����غ�С',
'����1��1��Ѷ ���죬̫��109-132������ʿ������̫����˧�����-�ƿ�ʲ�Ʒ�����˼��ߵĲɷá�

̫����һ�Ⱥ���ʿ���45ƽ���������ʿ�����һ��24-7���ڰ볡ʱ�����˱ȷ֡�

̸��������ʿ���ƿ�ʲ�Ʒ�˵��������Ķ���������ھ����㷸���Ŀռ��С����

�ڽ���ı����У�̫���ɳ����׿���-������˹���°�����-�����Լ�������-÷�������������׷���

̸�����£��ƿ�ʲ�Ʒ�˵�����ҿ���ÿ�ζ���һ�£������ǵ���ʵһ�㡣����Ա����Ӧ���ɳ�����Щ��Ҫʱ�䡣���ǵ�֧�����ǣ������Ƿ������ʱ��Ҫ�������ǡ���

�ڽ���ı����У�������˹����33���ӣ��õ�6��3����3������÷���ٳ���26���ӣ��õ�7��3����2���������ٳ���34���ӣ��õ�25��10����1������','2018-12-6',1,100,'2.png',1)

insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('�����ǣ���ǰ��֪�����������Ѵ�����һ��������׼��',
'����1��1��Ѷ ���죬������102-122�������������󣬶�������Ա����-�����ǺͶ��ﰲ-����-ʷ��˹�����˼��ߵĲɷá�

̸����������������-ʷ��˹˵�����ڳ�����29��ʧ�������������޷�Ӯ�ñ����ġ����ǰ���ʯͷ�����Լ��Ľţ����ǣ�����Ҳ�ó��ϣ����ֱ��ֵúܺá�������������׼������

�����Ǹ����˷���ѹ������Ϊ������Ҫȥ�������𣬲��ܴ��̫���ӡ����Ǿ�����Ҫ��������ԣ�Ҫɱ�˶��֡������������б����������ܿ��ó�����һ�㡣��

̸������������������˵��������֪����������Σ���������������Ѵ�������һ��Ӯ�����ǣ�������һ��һ��������׼������

�ڽ���ı����У�����-ʷ��˹����24���ӣ��õ�10��8����1�����������ǳ���21���ӣ��õ�6��3����8������','2018-12-6',1,100,'3.png',1)


insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('��������˧�գ��Ҿ����ң���һֱ��Ŭ��',
'����1��1��Ѷ �����ߺ������װ�-�����½����ڸ���Instagram��ɹ��һ���Լ���������װ����Ƭ����������ͼ����

��������Ƶ���˼�ǣ����Ҿ����ң���һֱ��Ŭ������Ҫô���ܣ�Ҫô������������֣������еİ����ڡ���������д����

�������������������³����ϳ�35.3���ӣ��õ�26.8��4.7����5.8������','2018-12-6',1,100,'4.jpg',1)

insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('Τ���罻ý���л2018��2019����׼������',
'����1��1��Ѷ �Ȼ������ά��-Τ�½����ڸ���Instagram��ɹ��һ���Լ��������գ���������ͼ����

��лл�㣬2018��2019�����Ѿ�׼�����ˣ�#Wadecounty��Τ��д����

��������������Τ�³����ϳ�25.5���ӣ��õ�14.1��3.6����3.9������','2018-12-6',1,100,'5.jpg',1)

insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('��������ף����������ʤ�������2018�����ѷ�ʽ',
'����1��1��Ѷ �ڽ��������һ���������У�����120-111���ܿ������ˣ�������������ǰ�汣��-������ӭ���˸�����

����������ڸ���������д������������������ȡ��ʤ�������2018����ѵķ�ʽ����

�����������������油�ϳ�5���ӣ�����5�������塣','2018-12-6',1,100,'6.jpg',1)


insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('������ǽ��������������ڶ����ݵı��ַǳ��ؼ�',
'����1��1��Ѷ �ڽ��ս�����һ���������У���ʿ�ͳ���132-109��ʤ̫����������ʿ��Ա˹�ٷ�-�����ڳ��߽�����ý��ɷá�

̸�������α����ȶ��ԣ�����˵�������Ǳ���רע��ÿ���������᳹���ǵı����ƻ����������ǵĿ��ֲ����Ǻܺã���������һЩ�������úܰ������ϰ볡ע����һЩ�򵥵Ļغϣ�Ŭ������ȷ�ķ�ʽ���������ڷ��ض˱��ֵò��������ǽ���������������

̸������油�ı��֣�����˵�������ǵı��ַǳ��ؼ�������̸�������ǵ��ֻ����ݣ����ǻᰲ�źܶ���Ա������ÿ���˶��ܹ�ͦ��������Ϊ����������ס��㲻��Ϊ�˳���������������̤������������Ҫ��ɻغϣ������������ʤ��������������������ȷ�ķ���ǰ������

̸���ǵ�-�����ı��֣�����˵�������ı��ַǳ�����˼�飬�ڷ��ضˣ����ǳ�ǿӲ���ͳ������Ƿǳ�Ư���ĸ�ñ�����ڳ��ϵı��ָ�������������̵�ӡ�󡣡�

̸��2018������һ������������ʱ�䣩��ʤ�����գ�����˵�����ܸ���2018�����и��Դ�ϲ�Ľ�֣������ڽ����õ����ܹھ�����������ģ�֮���ַ����˺ܶ����顣�µ�һ������ǻ�����׼������

�����������������31���ӣ�17Ͷ11�У�������9Ͷ5�У��õ�34��9����4����1���ϣ���������16���ӣ�5Ͷȫ�У��õ�10��6����2����3��ǡ�','2018-12-6',1,100,'7.png',1)




insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('���٣�������ֻ�����ͬ����Ͷ�����ᣬ����Ͷ������',
'����1��1��Ѷ �ڽ��ս�����һ���������У�����������122-102���ܶ�����������������Ա������-��˹��³�˽�����ý��ɷá�

��˹��³������һ������������ı������ָб��䣬ȫ������22Ͷ��4�С����������������ָл�ů������35���ӣ�24Ͷ13�У��õ�32��11����11����4���ϡ�

��������ֻ��Ǹ���ͬ����Ͷ�����ᣬ�Ǿ͹���Ͷ�����ˡ�����˹��³��˵����

��������������ȫ���ͳ�13�����ϣ���ʹ���ֳ�����26��ʧ��

�������������Ƿ��ض˵ı��֣�����˹��³��˵���������۷���ʲô����������ܹ�����Ͷ������������˵ı�����񣬳���Ŵ����������򣬵�����ȴ�������������棬�ж϶��ֵĴ�����·����Ǻ����ϣ�һ��������˻�ÿ칥���ᣬ��������Ƿǳ����档��','2018-12-6',1,100,'8.jpg',1)

insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('ȫ��������ղķ˹����ô����һ������',
'����12��31��Ѷ ���˽���121-114սʤ���������ͬʱ������ǰ���ղ���-ղķ˹ӭ�����Լ���34�����ա���Ȼ����δ���ϳ�����ղķ˹�������ر�ʾ������������ȫ��ͬ����ף���ա�

����ô����һ�����գ��ҵ��ֵ���������ʤ����������ǰ�����ҵļ���������һͬ��ף������Ҫ����õ�һ���ˣ��ر��л�ҵ�����@Savannah �����˾�ϲ��������ף�����ղķ˹д����

���˺���Լʲ-�����ڸ���Instagram Story�ϸ�����ղķ˹���վۻ���ֳ���Ƶ��

�����տ��֣����@�ղ���-ղķ˹������д����','2018-12-6',1,100,'9.jpg',1)

insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('����ףղķ˹���տ��֣�����٩�䷢���߱仯',
'����12��31��Ѷ �����Ǻ�����Ա�ղ���-ղķ˹�����գ������Ա����˹-����Ҳ�������Լ���Instagram��ղķ˹����������ף����

������ͬ�ж��꣬���տ����ҵ��ֵܣ�#�ֵ�#�����ߴ��в�ͬ������д����

','2018-12-6',1,100,'10.png',1)

insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('ղķ˹��2016����ʱ���Ҹо��Լ���Ϊ����ʷ���',
'����12��31��Ѷ ����ǰ���ղ���-ղķ˹������һ���ļ�¼Ƭ����ֻ��һ���˶�Ա���б����˹���ʷ�������Ա�Ŀ�����

̸��2016��������ʿ��ڣ�ղķ˹��ʾ����������һ�����ҳ�Ϊ��ʷ�������Ա��������ô�о��ġ���Ϊ����������ڣ��ҳ����������ǿ��ǳ���52��Ĺھ��İ���������ϲ���񡣵�һ��Ӧӿ����ͷ����Ҷ������ҿ��ˣ���Ϊ���ǿ�����������ʷ��52������Ψһ���ջ�Ȼ���Ҳ��ٿ��ˣ��Ҿ��뵽����������һ�������Ϊ����ʷ�����Ա������Ҷ���̸��������ʷ�������ӣ���ʷ������ǿ�����ӣ�Ȼ��������תȡʤ�ķ�ʽ�����ܹ����Լ�˵�����������һ������ĳɾ͡�����Ҳ�������Ľ��еļ��������Լ��о���������������һЩ�ر���¡�����û��̫��ʱ����������ô�룬���Ǹ�ʱ�̾�����������

','2018-12-6',1,100,'11.jpg',1)


insert into NBANews (NBANewsTitle,NBANewsInfo,ReleaseTime,UserID,ClickRate,Picture,NBASortID) values('������ֳ���44���Ǻ��ǻ������أ���ϲ�������Ǹ�Ͷ��',
'����12��31��Ѷ �ڽ��ս�����һ���������У�����������121-114���ܹ��������󣬺�����ԱԼʲ-�����ڸ����ҽ�����ý��ɷá�

̸���Լ��ڽ����˵ı��֣�����˵����BI��������-Ӣ����ķ���ڳ����ҵ����ң����ܹ�����ʱ����������ң������Ҹо������������Zo������-��������Kuz������-��������������Ϊ�Ҵ����˺ܰ��ĳ��ֻ��ᡣ��

̸����������ת��ԭ�򣬹���˵����������ʰ�˷���ǿ�ȣ����ͶԷ��Ľ������壬���ƶ��ν����Ļ��ᡣ����Ϊ�ⳡ�����ǳ���Ҫ�������������ǵĳ��졣֮ǰ���������ǳ����Ǳ���ʤȯ���յı�����֮������һ�����ȿ촬10�֣�����֪�����Ǳ��봥�׷��������Ǳ��������ɳ�����

����ȫ���������ֳ���44�Σ������������Ǻ��»��ǻ��£�����Ц��˵������ͦϲ���ģ����Ǹ�Ͷ�֣�Ͷ�־�Ӧ��Ͷ�������еĺܶ���ֶ��ǿ�λ����ȻҲ��һЩ������Ӵ�����������������⴫���������úܳ�ɫ������Ŭ���ڳ����ҵ����ڿ�λ�Ķ��ѡ����ԣ���ͦϲ���ġ���

�������������س���40���ӣ�14Ͷ8�У��õ�22��7����3����2���ϡ�

','2018-12-6',1,100,'12.jpg',1)