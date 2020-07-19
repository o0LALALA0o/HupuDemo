<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NBANewsInfo.aspx.cs" Inherits="NBANews.NBANewsInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
			#Login{
			    width:100%;
			    height:17px;
			    border-bottom:1px solid #e3e3e3;
			    font-size:10px;
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
			}
			#h1{
				width: 845px;
				height: 50px;
				background-color: #bd1902;
				color:White;
				float: left;
				border-radius: 3px;
				line-height: 42px;				
			}
			
			#h1 a
			{
			    text-decoration:none;
			    padding-left:7px;
			    padding-right:7px;
			    color:White;
			}
			
			#h1 a:hover
			{
			    text-decoration:underline;
			    background-color:#9b0006;   
			 }
			
			#newsInfo{
				width: 700px;
				height: 900px;
				float: left;
				text-indent: 25px;
				line-height: 30px;
			}
			
			
			#newsInfo img
			{
			    display:block;
			    margin-left:auto;
			    margin-right:auto;
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
			
			#duser
			{
			    color:#989da2;
			    font-size:12px;
			    border-bottom:1px solid #e3e3e3;
			    margin-bottom:20px;
			}
			
		</style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="box">
            
			<div id="headr">
				<img src="img/logo_img_sc.jpg" width="142px" height="50px"/>
				<div id="h1">
                    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">篮球新闻</asp:LinkButton>>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
				</div>		
			</div>
			<div id="newsInfo">

                
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <h2><%# Eval("NBANewsTitle")%></h2>
                        <div id="duser">编辑:<%# Eval("UserName")%>&nbsp&nbsp<%#string.Format("{0:d}", Eval("ReleaseTime"))%></div>                        
                        <img src="img/newsImg/<%# Eval("Picture")%>" width=75%/><br />
                        <p><%#Eval("NBANewsInfo")%></p>
                    </ItemTemplate>
                </asp:Repeater>
                
				
				
			</div>
			<div id="topInfo">                
            <h3>新闻排行榜行榜</h3>
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
