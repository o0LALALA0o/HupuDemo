<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="NBANews.register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>注册</title>
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
            height: 500px;
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
            margin-top: 20PX;
        }
        #box a
        {
             text-decoration:none;
             color:#989da2;
        }
        
        #box a:hover
        {
            text-decoration:underline ;  
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
            <tr>
                <td><asp:Label ID="Label5" runat="server" Text="确认密码："></asp:Label></td>
                <td><asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label3" runat="server" Text="电子邮箱："></asp:Label></td>
                <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br /></td>
            </tr>
        </table>
        
        
        
        <asp:CheckBox ID="CheckBox1" Text="我已经阅读并同意虎扑用户协议（含隐私政策)" runat="server" 
            AutoPostBack="True" oncheckedchanged="CheckBox1_CheckedChanged" />
        <br />
        <asp:Label ID="Label4" runat="server" Text="" ForeColor="Red"></asp:Label>
       <br />
        <asp:Button ID="Button1" CssClass="btn" runat="server" Text="立即注册" 
            Enabled="False" onclick="Button1_Click" />
        <br /><br />
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">回到主页</asp:LinkButton>
    </div>
    </form>
</body>
</html>
