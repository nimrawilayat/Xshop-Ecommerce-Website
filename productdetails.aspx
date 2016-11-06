<%@ Page Language="C#" AutoEventWireup="true" CodeFile="productdetails.aspx.cs" Inherits="productdetails"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Products Description</title>
</head>
<body>
    <form id="form1" runat="server">
<div>


    <asp:DataList ID="DataList1" runat="server" >
        <ItemTemplate>
           <img alt="pic" src='<%#ResolveClientUrl("~/image")%>/<%#DataBinder.Eval(Container.DataItem, "pid") %>.jpg' style="Width:400px;height:500px" />
               &nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;<asp:Label ID="txtProductName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "pname") %>'> </asp:Label>
            <br />
            Rs .<asp:Label ID="txtPrice" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "price") %>'> </asp:Label>
            <br />
            <asp:Label ID="txtDescription" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "description") %>'> </asp:Label>
        </ItemTemplate>
    </asp:DataList>
    <br />

    
    </div>
    <div>
    
    <asp:Button ID="AddToCart" runat="server" Text="Add to cart" OnClick="AddToCart_Click" /> 
    <asp:Button ID="myBtn3" runat="server" Text="ViewCart" OnClick="ViewCart_Click" />
    </div>
    
    </form>


    </body>
</html>
