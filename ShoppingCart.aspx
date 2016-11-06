<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <p>
<asp:Label ID="titleLabel" runat="server" Text="Your Shopping Cart" 
CssClass="CatalogTitle" />
</p>
<p>
<asp:Label ID="statusLabel" runat="server" />
&nbsp;</p>
   
    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" CellPadding="4" 
            ForeColor="#333333" GridLines="None" DataKeyNames="pid" 
            style="text-align: center; font-style: italic" Width="100%" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" CssClass="grid_RowDeleting" />
        <Columns>
            <asp:BoundField DataField="pname" HeaderText="Product Name" 
                SortExpression="Name" />
            <asp:BoundField DataField="price" HeaderText="Price" ReadOnly="True" 
                SortExpression="Price" DataFormatString="{0:c}" />
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="editQuantity" runat="server" CssClass="GridEditingRow"
Width="24px" MaxLength="2" Text='<%#Eval("Quantity")%>' />
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" ReadOnly="True" DataFormatString="{0:c}"
                SortExpression="Subtotal" />
            <asp:ButtonField CommandName="Delete" Text="Delete" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>
<p align="right">
<span>Total amount: </span>
<asp:Label ID="totalAmountLabel" runat="server" Text="Label" />
</p>
<p align="right">
<asp:Button ID="updateButton" runat="server" Text="Update Quantities" 
        onclick="Update_Click" />
        <asp:Button ID="myBtn" runat="server" Text="Continue Shopping" OnClick="Continue_Click" />
    <asp:Button ID="Checkout" runat="server" Text="Proceed to Checkout" OnClick="Checkout_Click" />
</p>
    </div>
    <div>
    
    </div>
    </form>
</body>
</html>
