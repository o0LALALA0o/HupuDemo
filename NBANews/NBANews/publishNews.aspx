<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="publishNews.aspx.cs" Inherits="NBANews.publishNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>发布新闻</title>
    <style>
        #box
        {
            margin:auto;       
            width:1000px;
            height:800px;
            text-align:center;
            border:1px solid;
            border-radius:4px; 
        }
        #box table
        {
            margin-left:auto;
            margin-right:auto;   
        }
        #box table tr
        {
            height:100px;    
        }
        #box table textarea
        {
            border: 1px solid #CCC;
            border-radius:4px; 
            width:300px;
            height:180px;
        }
         #box table .txt1
        {    
            border: 1px solid #CCC;
            width: 300px;
            height: 25px;  
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
        .style1
        {
            height: 100px;
        }
        #box a
        {
             color:#989da2;
             text-decoration:none;
        }
        
        #box a:hover
        {
            text-decoration:underline;  
            color:Black;
        }
        
        #hui
        {
            float:left;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="box">
    <span id="hui"><asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"><回到首页</asp:LinkButton></span>
    <h1>发布新闻</h1>        
        <table>
            <tr>
                <td>新闻标题:</td>
                <td><asp:TextBox CssClass='txt1' ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>新闻内容:</td>
                <td><asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            <tr>
                <td>新闻配图:</td>
                <td><asp:FileUpload ID="FileUpload1" runat="server" /></td>
            </tr>        
            <tr>
                <td class="style1">球队:</td>
                <td class="style1">
                    <asp:DropDownList CssClass="txt1" ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>    
        </table>
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label><br />
        <asp:Button CssClass="btn" ID="Button1" runat="server" Text="发布" 
            onclick="Button1_Click" />
    </div>
    </form>
</body>
</html>
