<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MostrarProducto.aspx.cs" Inherits="Ecomerce.MostrarProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Tienda.aspx" runat="server">Volver</asp:HyperLink>
            <br />
            <asp:Image ID="ImgProducto" runat="server" />
            <br />
            <asp:Label ID="LblNombreCat" runat="server"></asp:Label>
            <br />
            <asp:Label ID="LblNombre" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="LblDescripcion" runat="server"></asp:Label>
            <br />
            $<asp:Label ID="LblPrecio" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Button ID="BtnAgregar" runat="server" Text="Agregar al carrito" OnClick="BtnAgregar_Click" />
            <br />
            <asp:Label ID="LblMsj" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
