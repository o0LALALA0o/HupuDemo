<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageNews.aspx.cs" Inherits="NBANews.manageNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        a
        {
             text-decoration:none;
             color:#989da2;
        }
        
        a:hover
        {
            text-decoration:underline;  
            color:Black;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">回到主页</asp:LinkButton>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="NBANewsID" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="NBANewsID" HeaderText="NBANewsID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="NBANewsID" />
                <asp:BoundField DataField="NBANewsTitle" HeaderText="NBANewsTitle" 
                    SortExpression="NBANewsTitle" />
                <asp:BoundField DataField="NBANewsInfo" HeaderText="NBANewsInfo" 
                    SortExpression="NBANewsInfo" />
                <asp:BoundField DataField="ReleaseTime" HeaderText="ReleaseTime" 
                    SortExpression="ReleaseTime" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" 
                    SortExpression="UserID" />
                <asp:BoundField DataField="ClickRate" HeaderText="ClickRate" 
                    SortExpression="ClickRate" />
                <asp:BoundField DataField="Picture" HeaderText="Picture" 
                    SortExpression="Picture" />
                <asp:BoundField DataField="NBASortID" HeaderText="NBASortID" 
                    SortExpression="NBASortID" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NBANewsDBConnectionString %>" 
            DeleteCommand="DELETE FROM [NBANews] WHERE [NBANewsID] = @NBANewsID" 
            InsertCommand="INSERT INTO [NBANews] ([NBANewsTitle], [NBANewsInfo], [ReleaseTime], [UserID], [ClickRate], [Picture], [NBASortID]) VALUES (@NBANewsTitle, @NBANewsInfo, @ReleaseTime, @UserID, @ClickRate, @Picture, @NBASortID)" 
            SelectCommand="SELECT * FROM [NBANews]" 
            UpdateCommand="UPDATE [NBANews] SET [NBANewsTitle] = @NBANewsTitle, [NBANewsInfo] = @NBANewsInfo, [ReleaseTime] = @ReleaseTime, [UserID] = @UserID, [ClickRate] = @ClickRate, [Picture] = @Picture, [NBASortID] = @NBASortID WHERE [NBANewsID] = @NBANewsID">
            <DeleteParameters>
                <asp:Parameter Name="NBANewsID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NBANewsTitle" Type="String" />
                <asp:Parameter Name="NBANewsInfo" Type="String" />
                <asp:Parameter Name="ReleaseTime" Type="DateTime" />
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="ClickRate" Type="Int32" />
                <asp:Parameter Name="Picture" Type="String" />
                <asp:Parameter Name="NBASortID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NBANewsTitle" Type="String" />
                <asp:Parameter Name="NBANewsInfo" Type="String" />
                <asp:Parameter Name="ReleaseTime" Type="DateTime" />
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="ClickRate" Type="Int32" />
                <asp:Parameter Name="Picture" Type="String" />
                <asp:Parameter Name="NBASortID" Type="Int32" />
                <asp:Parameter Name="NBANewsID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
