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
                        <asp:HyperLink ID="HLBuscar" NavigateUrl="~/BuscarProductos.aspx" runat="server">Volver</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
        <asp:ListView ID="lvCarrito" runat="server" GroupItemCount="3">
            <ItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;color: #000000;">
                                            <asp:ImageButton ID="ImgBtnProducto" runat="server" Height="100px" ImageUrl='<%# Eval("Img_Url_A") %>' Width="100px" CommandArgument='<%# Eval("Cod_A")%>' CommandName="eventoImagen" OnCommand="ImgBtnProducto_Command" />
                                            <br />
                                            Nombre_A:
                                            <asp:Label ID="Nombre_ALabel" runat="server" Text='<%# Eval("Nombre_A") %>' />
                                            <br />PU_A:
                                            <asp:Label ID="PU_ALabel" runat="server" Text='<%# Eval("PU_A") %>' />
                                            <br />Cantidad: 
                                            <asp:Label ID="LblCantidad" runat="server" Text='<%# Eval("Cantidad") %>'></asp:Label>
                                            <br />
                                            <asp:Button ID="BtnAgregarCarrito" runat="server" Text="Agregar al Carrito" CommandArgument='<%# Eval("Cod_A") %>' CommandName="eventoButton" OnCommand="BtnAgregarCarrito_Command" />
                                            <br /></td>
            </ItemTemplate>
            <GroupTemplate>
                                        <tr id="itemPlaceholderContainer" runat="server">
                                            <td id="itemPlaceholder" runat="server"></td>
                                        </tr>
                                    </GroupTemplate>
            <LayoutTemplate>
                                        <table runat="server">
                                            <tr runat="server">
                                                <td runat="server">
                                                    <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                        <tr id="groupPlaceholder" runat="server">
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr runat="server">
                                                <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                                            </tr>
                                        </table>
                                    </LayoutTemplate>
        </asp:ListView>
        <asp:Label ID="LblMsj" runat="server"></asp:Label>
    </form>
</body>
</html>
