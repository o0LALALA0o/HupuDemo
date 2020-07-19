<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NBANews.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>登陆</title>
    <style>
        body
        {
            background-image:url(img/bg.gif);
            background-size:100%;            
        }
        #box
        {
            margin-left:auto;
            margin-right:auto;
            margin-top:6%;
            width: 550px;;
            height: 430px;
            background-color:#fff;    
            text-align:center;
            border-radius:10px;
        }
        #box #logo
        {
            padding-top:40px;
        }
        
        #box table
        {
            margin-left:auto;
            margin-right:auto;
        }
            
        #box table tr
        {
            height:50px;
        }
        #box table input
        {    
            border: 1px solid #CCC;
            width: 180px;
            height: 20px;  
            border-radius:4px;          
        }        
        .btn
        {
            border: none;
            background-color: #e42837;
            color: #fff;
            width: 330px;
            height: 40px;
            font-size: 18px;    
            border-radius:6px;
            margin-top: 10px;
        }
        #box a
        {
             text-decoration:none;
             color:#989da2;
        }
        
        #box a:hover
        {
            text-decoration:underline;  
            color:Black;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="box">
        <img id="logo" src="img/logo.png"/><br />
        <table>
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="用户名："></asp:Label></td>
                <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label2" runat="server" Text="密码："></asp:Label></td>
                <td><asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
        </table>
        
        <asp:Label ID="Label4" runat="server" Text="" ForeColor="Red"></asp:Label><br />
        <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">没有账号，立即注册></asp:LinkButton><br />
        <asp:CheckBox ID="CheckBox1" runat="server" Text="七天内记住账号密码" />
        <br />
        <asp:Button ID="Button1" CssClass="btn" runat="server" Text="登陆" 
            onclick="Button1_Click" />
        <br /><br />
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">回到主页</asp:LinkButton>
    </div>
    </form>
</body>
</html>
