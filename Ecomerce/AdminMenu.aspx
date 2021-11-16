<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminMenu.aspx.cs" Inherits="Ecomerce.AdminMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: right;
        }
        .auto-style3 {
            height: 23px;
        }
        .auto-style4 {
            width: 280px;
        }
        .auto-style5 {
            text-align: right;
            width: 281px;
        }
        .auto-style7 {
            height: 23px;
            width: 281px;
        }
        .auto-style8 {
            width: 280px;
            height: 23px;
        }
        .auto-style9 {
            width: 280px;
            height: 137px;
        }
        .auto-style10 {
            height: 137px;
            width: 281px;
        }
        .auto-style11 {
            height: 137px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Menu de Admin"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="LBLUsuarioAdminMenu" runat="server" Text="Bienvenido, Usuario"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:HyperLink ID="HPLBuscarProducto" runat="server" NavigateUrl="~/BuscarProductos.aspx">Buscar Producto</asp:HyperLink>
                </td>
                <td class="auto-style7">
                    <asp:HyperLink ID="hlAgregarCat" runat="server" NavigateUrl="~/AgregarCategoria.aspx">Agregar Categoria</asp:HyperLink>
                </td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:HyperLink ID="hlAgregarP" runat="server" NavigateUrl="~/AgregarProducto.aspx">Agregar Producto</asp:HyperLink>
                </td>
                <td class="auto-style7">
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:HyperLink ID="HPLModificarProducto" runat="server" NavigateUrl="~/ModificarProducto.aspx">Modificar Producto</asp:HyperLink>
                </td>
                <td class="auto-style7">
                </td>
                <td class="auto-style3">
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:HyperLink ID="HPLEliminarProducto" runat="server" NavigateUrl="~/EliminarProducto.aspx">Eliminar Producto</asp:HyperLink>
                </td>
                <td class="auto-style7">
                </td>
                <td class="auto-style3">
                </td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:HyperLink ID="HPLVolver" runat="server" NavigateUrl="~/Tienda.aspx">Volver a la tienda</asp:HyperLink>
                </td>
                <td class="auto-style10">
                </td>
                <td class="auto-style11">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
