<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuscarProductos.aspx.cs" Inherits="Ecomerce.BuscarProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            text-align: left;
            font-size: x-large;
            height: 75px;
        }
        .auto-style4 {
            text-align: left;
            font-size: x-large;
            height: 29px;
        }
        .auto-style5 {
            height: 29px;
        }
        .auto-style6 {
            height: 75px;
        }
        .auto-style7 {
            height: 50px;
        }
        .auto-style8 {
            height: 50px;
            text-align: left;
        }
        .auto-style9 {
            text-align: left;
            height: 35px;
        }
        .auto-style10 {
            height: 35px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style4"></td>
                            <td class="auto-style5"></td>
                            <td class="auto-style5">
                    <asp:Label ID="LBLUsuarioBuscarProducto" runat="server" Text="Bienvenido, Usuario"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3"><strong>Buscar producto</strong></td>
                            <td class="auto-style6"></td>
                            <td class="auto-style6"></td>
                        </tr>
                        <tr>
                            <td class="auto-style8">ID Producto:
                                <asp:TextBox ID="TBXBuscarProducto" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVBuscarProducto" runat="server" ControlToValidate="TBXBuscarProducto" ErrorMessage="Debe ingresar un ID de producto" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style7"></td>
                            <td class="auto-style7"></td>
                        </tr>
                        <tr>
                            <td class="auto-style9">
                                <asp:GridView ID="GvBuscarProducto" runat="server">
                                </asp:GridView>
                                <asp:Label ID="LBLBuscarProducto" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style10"></td>
                            <td class="auto-style10"></td>
                        </tr>
                        <tr>
                            <td class="auto-style9">
            <asp:HyperLink ID="HPLVolverBuscarProducto" runat="server" ForeColor="Blue" NavigateUrl="~/AdminMenu.aspx">Volver</asp:HyperLink>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="BTNBuscarProducto" runat="server" Text="Buscar" OnClick="BTNBuscarProducto_Click" />
                            </td>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                        </tr>
                    </table>
                <br />
        </div>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
