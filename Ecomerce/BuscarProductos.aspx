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
                                <br />
                                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Carrito.aspx" runat="server">Carrito</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3"><strong>Buscar producto</strong></td>
                            <td class="auto-style6"></td>
                            <td class="auto-style6"></td>
                        </tr>
                        <tr>
                            <td class="auto-style8">Nombre Producto:
                                <asp:TextBox ID="TBXBuscarProducto" runat="server"></asp:TextBox>
                            </td>
                                                        <td class="auto-style9">
            <asp:HyperLink ID="HPLVolverBuscarProducto" runat="server" ForeColor="Blue" NavigateUrl="~/Tienda.aspx">Volver</asp:HyperLink>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="BTNBuscarProducto" runat="server" Text="Buscar" OnClick="BTNBuscarProducto_Click" />
                            </td>
                            <td class="auto-style7"></td>
                            <td class="auto-style7"></td>
                        </tr>
                        <tr>
                            <td class="auto-style9">
                                <asp:ListView ID="LvProductos" runat="server" GroupItemCount="3">
                                    <AlternatingItemTemplate>
                                        <td runat="server" style="background-color:#FFF8DC;">
                                            <asp:ImageButton ID="ImgBtnProducto" runat="server" Height="100px" ImageUrl='<%# Eval("Img_Url_A") %>' Width="100px" CommandArgument='<%# Eval("Cod_A")%>' CommandName="eventoImagen" OnCommand="ImgBtnProducto_Command" />
                                            <br />Nombre_A:
                                            <asp:Label ID="Nombre_ALabel" AssociatedControlID="ImgBtnProducto" runat="server" Text='<%# Eval("Nombre_A") %>' />
                                            <br />PU_A:
                                            <asp:Label ID="PU_ALabel" runat="server" Text='<%# Eval("PU_A") %>' />
                                            <br />
                                            <asp:Button ID="BtnAgregarCarrito" Enabled='<%# !Eval("Stock_A").Equals(0)%>' runat="server" Text="Agregar al Carrito" CommandArgument='<%# Eval("Cod_A") %>' CommandName="eventoButton" OnCommand="BtnAgregarCarrito_Command" />
                                            <br />
                                        </td>
                                    </AlternatingItemTemplate>
                                    <EditItemTemplate>
                                        <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">Nombre_A:
                                            <asp:TextBox ID="Nombre_ATextBox" runat="server" Text='<%# Bind("Nombre_A") %>' />
                                            <br />PU_A:
                                            <asp:TextBox ID="PU_ATextBox" runat="server" Text='<%# Bind("PU_A") %>' />
                                            <br />Img_Url_A:
                                            <asp:TextBox ID="Img_Url_ATextBox" runat="server" Text='<%# Bind("Img_Url_A") %>' />
                                            <br />
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                                            <br />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                                            <br /></td>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                            <tr>
                                                <td>No se han devuelto datos.</td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                    <EmptyItemTemplate>
                                    <td runat="server" />
                                    </EmptyItemTemplate>
                                    <GroupTemplate>
                                        <tr id="itemPlaceholderContainer" runat="server">
                                            <td id="itemPlaceholder" runat="server"></td>
                                        </tr>
                                    </GroupTemplate>
                                    <InsertItemTemplate>
                                        <td runat="server" style="">Nombre_A:
                                            <asp:TextBox ID="Nombre_ATextBox" runat="server" Text='<%# Bind("Nombre_A") %>' />
                                            <br />PU_A:
                                            <asp:TextBox ID="PU_ATextBox" runat="server" Text='<%# Bind("PU_A") %>' />
                                            <br />Img_Url_A:
                                            <asp:TextBox ID="Img_Url_ATextBox" runat="server" Text='<%# Bind("Img_Url_A") %>' />
                                            <br />
                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                                            <br />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                                            <br /></td>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <td runat="server" style="background-color:#DCDCDC;color: #000000;">
                                            <asp:ImageButton ID="ImgBtnProducto" runat="server" Height="100px" ImageUrl='<%# Eval("Img_Url_A") %>' Width="100px" CommandArgument='<%# Eval("Cod_A")%>' CommandName="eventoImagen" OnCommand="ImgBtnProducto_Command" />
                                            <br />
                                            Nombre_A:
                                            <asp:Label ID="Nombre_ALabel" AssociatedControlID="ImgBtnProducto" runat="server" Text='<%# Eval("Nombre_A") %>' />
                                            <br />PU_A:
                                            <asp:Label ID="PU_ALabel" runat="server" Text='<%# Eval("PU_A") %>' />
                                            <br />
                                            <asp:Button ID="BtnAgregarCarrito" Enabled='<%# !Eval("Stock_A").Equals(0)%>' runat="server" Text="Agregar al Carrito" CommandArgument='<%# Eval("Cod_A") %>' CommandName="eventoButton" OnCommand="BtnAgregarCarrito_Command" />
                                            <br /></td>
                                    </ItemTemplate>
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
                                    <SelectedItemTemplate>
                                        <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">Nombre_A:
                                            <asp:Label ID="Nombre_ALabel" runat="server" Text='<%# Eval("Nombre_A") %>' />
                                            <br />PU_A:
                                            <asp:Label ID="PU_ALabel" runat="server" Text='<%# Eval("PU_A") %>' />
                                            <br />Img_Url_A:
                                            <asp:Label ID="Img_Url_ALabel" runat="server" Text='<%# Eval("Img_Url_A") %>' />
                                            <br /></td>
                                    </SelectedItemTemplate>
                                </asp:ListView>

                                <asp:Label ID="LBLBuscarProducto" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style10"></td>
                            <td class="auto-style10"></td>
                        </tr>
                        <tr>

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
