<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarProducto.aspx.cs" Inherits="Ecomerce.AgregarProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .nuevoEstilo1 {
        }
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 432px;
        }
        .auto-style4 {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="nuevoEstilo1">
            <table class="auto-style2">
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Label ID="LBLUsuarioAgregarProducto" runat="server" Text="Bienvenido, Usuario"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
            <strong><span class="auto-style1">Agregar producto</span></strong></td>
                    <td class="auto-style4">
                        &nbsp;</td>
                </tr>
            </table>
            <strong><br class="auto-style1" />
            </strong>
            <br />
            <asp:Label ID="LBLNombreProducto" runat="server" Text="Nombre"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TBXNombreProducto" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFVIdProducto" runat="server" ControlToValidate="TBXNombreProducto" ErrorMessage="Debe ingresar un ID de producto" ForeColor="Red" ValidationGroup="G2">*</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="LBLCategoriaProducto" runat="server" Text="Categoria"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DDLCategoriaProducto" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="LBLDescripcionProducto" runat="server" Text="Descripcion"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TBXDescripcionProducto" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFVDescripcionProducto" runat="server" ControlToValidate="TBXDescripcionProducto" ErrorMessage="Debe ingresar una descripcion sobre el producto" ForeColor="Red" SetFocusOnError="True" ValidationGroup="G2">*</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="LBLPrecioProducto" runat="server" Text="Precio unitario"></asp:Label>
&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="TBXPrecioProducto" runat="server" ValidationGroup="G2"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFVPrecioProducto" runat="server" ControlToValidate="TBXPrecioProducto" ErrorMessage="Debe ingresar el precio unitario del producto" ForeColor="Red" ValidationGroup="G2">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegexPU" runat="server" ControlToValidate="TBXPrecioProducto" ErrorMessage="Solo puede ingresar numeros" ForeColor="Red" ValidationExpression="^(?!(?:0|0\.0|0\.00)$)[+]?\d+(\.\d[0-9])?$" ValidationGroup="G2">*</asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Label ID="LBLStockProducto" runat="server" Text="Stock"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TBXStockProducto" runat="server" ValidationGroup="G2"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFVStockProducto" runat="server" ControlToValidate="TBXStockProducto" ErrorMessage="Debe ingresar una cantidad de productos" ForeColor="Red" ValidationGroup="G2">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegexStock" runat="server" ControlToValidate="TBXStockProducto" ErrorMessage="Solo puede ingresar numeros" ForeColor="Red" ValidationExpression="^(0|[1-9][0-9]{0,9})$" ValidationGroup="G2">*</asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Label ID="LBLUrlAgregarProducto" runat="server" Text="URL imagen"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:FileUpload ID="FUPUrlImagen" runat="server" />
            <asp:RequiredFieldValidator ID="RFV" runat="server" ControlToValidate="FupUrlImagen" ErrorMessage="Debe ingresar una imagen" ForeColor="Red" ValidationGroup="G2">*</asp:RequiredFieldValidator>
            <br />
            <asp:ValidationSummary ID="VSAgregarProducto" runat="server" ForeColor="Red" ValidationGroup="G2" />
            <br />
            <asp:Label ID="LBLConfirmacionAgregarProducto" runat="server"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HPLVolverAgregarProducto" runat="server" ForeColor="Blue" NavigateUrl="~/AdminMenu.aspx">Volver</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="BTNAgregarProducto" runat="server" Text="Agregar" ValidationGroup="G2" OnClick="BTNAgregarProducto_Click" />
        </div>
    </form>
</body>
</html>
