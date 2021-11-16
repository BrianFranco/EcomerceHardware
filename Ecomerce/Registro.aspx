<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Ecomerce.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Registro"></asp:Label>
                </p>
        <p class="auto-style1">
            Nombre de usuario&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txbUserReg" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUser" runat="server" ControlToValidate="txbUserReg" ErrorMessage="No ingreso un nombre de usuario" ForeColor="Red">*</asp:RequiredFieldValidator>
                </p>
        <p class="auto-style1">
            Contraseña&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txbContra1" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbContra1" ErrorMessage="No ingreso una contraseña" ForeColor="Red">*</asp:RequiredFieldValidator>
                </p>
        <p class="auto-style1">
            Repetir contraseña&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txbContra2" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="cvContra" runat="server" ControlToCompare="txbContra1" ControlToValidate="txbContra2" ErrorMessage="Las contraseñas no coinciden" ForeColor="Red">*</asp:CompareValidator>
                <p class="auto-style1">
            Numero de Dni&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txbDni" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUser0" runat="server" ControlToValidate="txbUserReg" ErrorMessage="No ingreso un nombre de usuario" ForeColor="Red">*</asp:RequiredFieldValidator>
                <div class="auto-style1">
                    <asp:ValidationSummary ID="vsSummary" runat="server" ForeColor="Red" />
                </div>
        <p class="auto-style1">
                    <asp:Button ID="btnRegis" runat="server" Text="Registrarse" OnClick="btnRegis_Click" />
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                    <p class="auto-style1">
                    Ya tenes cuenta?
                    <asp:HyperLink ID="hpLogin" runat="server" NavigateUrl="~/Login.aspx">Iniciar sesión</asp:HyperLink>
                </p>
        <div class="auto-style1">
            <asp:HyperLink ID="HLVolverRegistro" runat="server" NavigateUrl="~/Tienda.aspx">Volver</asp:HyperLink>
        </div>
    </form>
</body>
</html>
