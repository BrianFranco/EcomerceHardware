<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Ecomerce.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style6 {
            text-align: center;
        }
        .auto-style4 {
            font-size: small;
        }
        .auto-style7 {
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style6">
&nbsp;<strong><span class="auto-style7">Login</span></strong><br />
            <br />
            <asp:Label ID="LBLLoginNombreUsuario" runat="server" Text="Nombre de usuario"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TBXLoginNombreUsuario" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFVLoginNombreUsuario" runat="server" ControlToValidate="TBXLoginNombreUsuario" ErrorMessage="Debe ingresar un nombre de usuario" ForeColor="Red" ValidationGroup="G1">*</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="LBLLoginContraseña" runat="server" Text="Contraseña"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TBXLoginContraseña" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFVLoginContraseña" runat="server" ControlToValidate="TBXLoginContraseña" ErrorMessage="Debe ingresar una contraseña" ForeColor="Red" ValidationGroup="G1">*</asp:RequiredFieldValidator>
            <br />
            <asp:ValidationSummary ID="VSLogin" runat="server" ForeColor="Red" ValidationGroup="G1" />
            <br />
            <asp:Label ID="LBLLoginUsuarioInvalido" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="BTNLogin" runat="server" Height="26px" Text="LOGIN" ValidationGroup="G1" OnClick="BTNLogin_Click" />
            <span class="auto-style4">
            <br />
            <br />
            Aun no dispone de una cuenta?</span>
            <asp:HyperLink ID="HPLRegistrarse" runat="server" Font-Size="Small" ForeColor="Blue" NavigateUrl="~/Registro.aspx">Registrarse</asp:HyperLink>
            <br />
            &nbsp;
            <br />
            <asp:HyperLink ID="HLVolverLogin" runat="server" NavigateUrl="~/Tienda.aspx">Volver</asp:HyperLink>
            <br />
        </div>
    </form>
</body>
</html>
