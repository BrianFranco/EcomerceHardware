<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarCategoria.aspx.cs" Inherits="Ecomerce.AgregarCategoria" %>

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
            width: 473px;
        }
        .auto-style4 {
            width: 100%;
            font-size: x-large;
        }
        .auto-style8 {
            width: 100%;
            margin-bottom: 88px;
        }
        .auto-style11 {
            width: 261px;
            height: 49px;
        }
        .auto-style12 {
            height: 49px;
        }
        .auto-style13 {
            width: 261px;
            height: 45px;
            text-align: right;
        }
        .auto-style14 {
            height: 45px;
        }
        .auto-style15 {
            width: 261px;
            height: 46px;
            text-align: right;
        }
        .auto-style16 {
            height: 46px;
        }
        .auto-style17 {
            height: 49px;
            width: 388px;
        }
        .auto-style18 {
            height: 46px;
            width: 388px;
            text-align: left;
        }
        .auto-style19 {
            height: 45px;
            width: 388px;
            text-align: left;
        }
        .auto-style20 {
            width: 473px;
            height: 23px;
        }
        .auto-style21 {
            text-align: right;
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style20"></td>
                    <td class="auto-style21">
                        <asp:Label ID="LBLUsuarioAgregarCategoria" runat="server" Text="Bienvenido, Usuario"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
            <strong><span class="auto-style4">Agregar Categoria</span></strong></td>
                    <td class="auto-style2">
                        <asp:HyperLink ID="hlMenuAdmin" runat="server" NavigateUrl="~/AdminMenu.aspx">Volver</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
        <table class="auto-style8">
            <tr>
                <td class="auto-style11"></td>
                <td class="auto-style17"></td>
                <td class="auto-style12"></td>
            </tr>
            <tr>
                <td class="auto-style15">Nombre de Categoria:&nbsp;&nbsp; </td>
                <td class="auto-style18">
                    <asp:TextBox ID="txbNomCat" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNomCat" runat="server" ControlToValidate="txbNomCat" ErrorMessage="Ingrese un nombre de categoría" ForeColor="Red" ValidationGroup="G1">Ingrese un nombre de categoría</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style16">
                &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">
            <asp:HyperLink ID="HPLVolverAgregarCategoria" runat="server" ForeColor="Blue" NavigateUrl="~/AdminMenu.aspx">Volver</asp:HyperLink>
                </td>
                <td class="auto-style19">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnAgregarCategoria" runat="server" Text="Agregar" OnClick="BtnAgregarCategoria_Click" />
                    <asp:Label ID="LBLDevolucion" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style14"></td>
            </tr>
        </table>
    </form>
</body>
</html>
