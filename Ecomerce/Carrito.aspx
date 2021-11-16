<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Ecomerce.Carrito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            margin-bottom: 63px;
        }
        .auto-style2 {
            height: 20px;
            text-align: right;
        }
        .auto-style3 {
            height: 20px;
            width: 249px;
        }
        .auto-style4 {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Bienvenido, Usuario"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Carrito"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:HyperLink ID="hlMenuAdmin" runat="server" NavigateUrl="~/AdminMenu.aspx">Volver</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
        <asp:ListView ID="lvCarrito" runat="server">
        </asp:ListView>
    </form>
</body>
</html>
