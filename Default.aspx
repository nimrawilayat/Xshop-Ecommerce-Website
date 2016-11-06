<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Products List</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
            CellPadding="4" Font-Bold="False" Font-Italic="False" Font-Overline="False" 
            Font-Strikeout="False" Font-Underline="False" ForeColor="#333333" 
            RepeatColumns="3" RepeatDirection="Horizontal" 
            >
            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#E3EAEB" />
            
            <ItemTemplate>
           
                &nbsp;
                <asp:HyperLink ID="hlnk" 
                    NavigateUrl='<%# string.Format("productdetails.aspx?pid={0}", Eval("pid")) %>' 
                    runat="server" >
                 <asp:Image ID="Image1" runat="server" width="150" Height="150"
                    ImageUrl='<%# Eval("image", "image\\{0}") %>' />
                <br />
                   </asp:HyperLink>


                <asp:Label ID="pidLabel" runat="server" Text='<%# Eval("pid") %>' />
                    
                <br />
                <asp:Label ID="pnameLabel" runat="server" Text='<%# Eval("pname") %>' />
                 
                <br />
                <br />
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" 
            SelectCommand="SELECT * FROM [product]"></asp:SqlDataSource>
    
    </div>
    &nbsp&nbsp
    <div>
    <asp:Button ID="myBtn4" runat="server" Text="ViewCart" OnClick="ViewCart_Click" />
    </div>
    </form>
</body>
</html>
