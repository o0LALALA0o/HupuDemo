<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="NBANews.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>NBA新闻</title>
    
    <style type="text/css">
        #Login{
			    width:100%;
			    height:20px;
			    border-bottom:1px solid #e3e3e3;
			    font-size:12px;
			    color:#999;		
			    margin-top: -6px;
			    margin-bottom:3px;	    
			}
			#Login p
			{
			    padding-left:1100px;
			}
			#box
			{			    
				width: 1000px;
				height: 1000px;
				margin: auto;			
			}
			
			#headr img{
				float: left;
				padding-right: 13px;
			}
			#headr{
				float: left;
				position: fixed;
			}
			#h1{
				width: 845px;
				height: 50px;
				background-color: #bd1902;
				color:White;
				float: left;
				border-radius: 3px;				
			}
			#h1 ul
			{
			    list-style:none;
			    float:left;
			    margin-top:0px;
			    line-height:45px;
			}
			#h1 li
			{
			    float:left;
			    text-align:center;			    
			    margin-left:10px;
			}
			#h1 li a
			{
			    display:inline-block;
			    height:48px;
			    text-decoration:none;
			    padding-left:7px;
			    padding-right:7px;
			    color:White;
			}
			
			#h1 li a:hover
			{
			    background-color:#9b0006;   
			    border-bottom:2px solid #ff000a;
			 }
			 #search
			 {
			    float: right;
			    padding-right:10px;
                line-height: 45px;  
			 }
			
			.txtSearch
			{
			   background: #7c000a;   
			   color:#fff;
			   border:none;
			   width:150px;
			   height:24px;
			   border-radius: 5px;
			}
			
			#newsInfo{
				width: 700px;
				height: 1285px;
				float: left;
				border:1px solid #e3e3e3;
				border-radius: 5px;
			    margin-top:11px;
			}
			#topInfo{
				border:1px solid #e3e3e3;
				width: 295px;
				height: 400px;
				position: fixed;
                right: 253px;
                top: 90px;
                border-radius: 5px;
			}
			#topInfo ol
			{
			    margin-left: -25px;
			}
			
			#topInfo ol li
			{    
			   font-size:12px;
			}
			
			#topInfo ol li a
			{
			    text-decoration:none;	            
	            color:#989da2;		    
			}
			#topInfo ol li a:hover
			{
			    color:#28384c;
			}
			#newsInfo ul
			{
			    margin-left:-40px;    
			}
			
			#newsInfo ul li
			{
			    list-style:none;
			    border-bottom:1px solid #eff3f4;	
			    height:100px;		 
			}
			
			#newsInfo ul li a
			{
			    font-size:20px;
			  text-decoration:none;   
			  color:Black; 
			}
			
			#ClickRate
			{
			    line-height:20px;
			    color:#989da2;
			    font-size : 13px;
                padding-top: 40px;   
			}
			#huidingbu
			{
			   position: fixed;     
			   width:45px;
			   height:50px;
			   background-color:#bd1902;
			   border-radius: 3px;	
			   color:White;
			   text-align:center;
			   bottom: 50px;
               right: 75px;
			}
			#huidingbu a
			{
			    color:White;
			    text-decoration:none;
			       
			 }
			 #fy
			 {
			    margin:auto;
			    width:180px;			       
			 }
			
		</style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="huidingbu"><a href="#">回到顶部</a></div>
    <div id="Login">
                <p>
                    <asp:Label ID="Label2" runat="server" Text="欢迎访问虎扑，请先"></asp:Label>
                    <asp:LinkButton
                        ID="LinkButton2" runat="server" onclick="LinkButton2_Click">注册</asp:LinkButton><asp:Label ID="Label3"
                        runat="server" Text="或"></asp:Label><asp:LinkButton ID="LinkButton3" 
                        runat="server" onclick="LinkButton3_Click">登陆</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton4" runat="server" Enabled="True" 
                        onclick="LinkButton4_Click" Visible="False">发布新闻</asp:LinkButton>        
                    <asp:LinkButton ID="LinkButton5" runat="server" Enabled="True" 
                        onclick="LinkButton5_Click" Visible="False">管理新闻</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton6" runat="server" Visible="False" 
                        onclick="LinkButton6_Click">退出登录</asp:LinkButton>
                </p>
            </div>
    <div id="box">
			<div id="headr">
				<img src="img/logo_img_sc.jpg" width="142px" height="50px"/>
				
				<div id="h1">
					<ul>
                    <li><a href="#">湖人</a></li>
                    <li>|</li>
                    <li><a href="#">勇士</a></li>
                    <li>|</li>
                    <li><a href="#">火箭</a></li>
                    <li>|</li>
                    <li><a href="#">马刺</a></li>
                    <li>|</li>
                    <li><a href="#">凯尔特人</a></li>
                    <li>|</li>
                    <li><a href="#">更多球队</a></li>
                 </ul>
                    <span id="search">搜索新闻
                    <asp:TextBox ID="TextBox1" CssClass="txtSearch" runat="server" 
                        ontextchanged="TextBox1_TextChanged" AutoPostBack="True"></asp:TextBox>
                    </span>
				</div>		
			</div>
			<div id="newsInfo">
            <h2>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label></h2>
            
                <asp:Repeater ID="Repeater1" runat="server" 
                    onitemcommand="Repeater1_ItemCommand">
                <ItemTemplate>
                <ul>
                    <li>                        
                        <asp:LinkButton ID="LinkButton1" CommandName="lbtnT" CommandArgument='<%#Eval("NBANewsID") %>' runat="server"><%#Eval("NBANewsTitle")%></asp:LinkButton><br />
                       <div id="ClickRate">
                           <asp:HiddenField ID="HiddenField1" Value='<%#Eval("ClickRate") %>' runat="server" />
                           浏览数<%#Eval("ClickRate")%></div> 
                    </li>
                </ul>
                </ItemTemplate>
                </asp:Repeater>
            
                <div id = "fy">
                <asp:Button ID="Button1" runat="server" Text="上一页" Enabled="False" 
                    onclick="Button1_Click" />
                <asp:Label ID="Label4" runat="server" Text="1"></asp:Label>
                <asp:Button ID="Button2" runat="server" Text="下一页" onclick="Button2_Click" />
                </div>
			</div>
			<div id="topInfo">                
            <h3>新闻排行榜</h3>
            <ol>
                <asp:DataList ID="DataList1" runat="server" 
                    onitemcommand="DataList1_ItemCommand">
                    <ItemTemplate><li><asp:LinkButton ID="LinkButton1" CommandName="lbtnT" CommandArgument='<%#Eval("NBANewsID") %>' runat="server"><%#Eval("NBANewsTitle")%></asp:LinkButton></li></ItemTemplate>
                </asp:DataList>
            </ol>
            </div>
            <div id="bottom"><img src="img/QQ截图20181231220026.png" width=100%/></div>
		</div>
    </form>
</body>
</html>
