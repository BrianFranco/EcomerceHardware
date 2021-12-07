<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tienda.aspx.cs" Inherits="Ecomerce.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link type="text/css" rel="stylesheet" href="Css/Estilos.css" />
    <style type="text/css">
        .auto-style1 {
            width: 242px;
        }
        .auto-style2 {
            width: 149px;
        }
        .auto-style4 {
            font-size: x-large;
        }
    </style>
    </head>
<body class="body-flex">
    <header class="header">
        <div class="header-content">
            <h2>Ecomerce</h2>
            <div>
                <input type="text"  />
                <asp:HyperLink ID="HLBuscar" NavigateUrl="~/BuscarProductos.aspx" runat="server">Buscar</asp:HyperLink>
             </div>
            <div>
                <asp:HyperLink ID="HPLGestionArt" runat="server" ForeColor="Black" NavigateUrl="~/AdminMenu.aspx">Gestionar articulos</asp:HyperLink>
                <a>
                    &nbsp;</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="LBLUsuarioTienda" runat="server"></asp:Label>
&nbsp;&nbsp;
                <asp:HyperLink ID="HLLogin" runat="server" NavigateUrl="~/Login.aspx">Iniciar sesión</asp:HyperLink>
&nbsp;
                <asp:HyperLink ID="HLRegistrarse" runat="server" NavigateUrl="~/Registro.aspx">Registrarse</asp:HyperLink>
            </div>
        </div>
    </header>
    <main>
        <form id="form1" runat="server">
            <div class="content-grid">
            <aside class="aside-flex">
                <span class="auto-style4">Productos<br />
                </span>
                <asp:DataList ID="DataList1" runat="server">
                    <HeaderTemplate>
                        <asp:Button ID="BtnTodos" runat="server" OnClick="BtnTodos_Click" Text="Todos" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <br />
                        <asp:Button ID="BtnCategorias" runat="server" CommandArgument='<%# Eval("Cod_Cat") %>' CommandName="ComandoBtnCat" OnCommand="BtnCategorias_Command" Text='<%# Eval("Nombre_Cat") %>' />
                    </ItemTemplate>
                </asp:DataList>
            </aside>
                <asp:ListView ID="ListView1" runat="server" GroupItemCount="3" OnPagePropertiesChanged="ListView1_PagePropertiesChanged">
                    <%--<AlternatingItemTemplate>
                        <td runat="server" style="background-color: #FFFFFF;color: #284775;">Nombre_A:
                            <asp:Label ID="Nombre_ALabel" runat="server" Text='<%# Eval("Nombre_A") %>' />
                            <br />
                            PU_A:
                            <asp:Label ID="PU_ALabel" runat="server" Text='<%# Eval("PU_A") %>' />
                            <br />
                            Cod_A:
                            <asp:Label ID="Cod_ALabel" runat="server" Text='<%# Eval("Cod_A") %>' />
                            <br />
                        </td>
                    </AlternatingItemTemplate>--%>
                    <EditItemTemplate>
                        <td runat="server" style="background-color: #999999;">Nombre_A:
                            <asp:TextBox ID="Nombre_ATextBox" runat="server" Text='<%# Bind("Nombre_A") %>' />
                            <br />
                            PU_A:
                            <asp:TextBox ID="PU_ATextBox" runat="server" Text='<%# Bind("PU_A") %>' />
                            <br />
                            Cod_A:
                            <asp:Label ID="Cod_ALabel1" runat="server" Text='<%# Eval("Cod_A") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                            <br />
                        </td>
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
                            <br />
                            PU_A:
                            <asp:TextBox ID="PU_ATextBox" runat="server" Text='<%# Bind("PU_A") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                            <br />
                        </td>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <td runat="server" style="background-color: #FFFFFF; color: #333333; text-align: center;" class="auto-style2">
                            <asp:ImageButton ID="ImgBtnProducto" runat="server" CommandArgument='<%# Eval("Cod_A") %>' CommandName="ComandoVerProducto" Height="125px" ImageUrl='<%# Eval("Img_Url_A") %>' OnCommand="ImgBtnProducto_Command" Width="125px" />
                            <br />
                            <asp:Label ID="Nombre_ALabel" runat="server" Text='<%# Eval("Nombre_A") %>' />
                            <br />
                            <br />
                            $<asp:Label ID="PU_ALabel" runat="server" Text='<%# Eval("PU_A") %>' />
                            <br />
                            <br />
                            <asp:Button ID="BtnAgregarCarrito" runat="server" Text="Ver Producto" />
                            <br />
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server" class="auto-style1">
                                    <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF" class="auto-style1">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="9">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                            <asp:NumericPagerField />
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">Nombre_A:
                            <asp:Label ID="Nombre_ALabel" runat="server" Text='<%# Eval("Nombre_A") %>' />
                            <br />
                            PU_A:
                            <asp:Label ID="PU_ALabel" runat="server" Text='<%# Eval("PU_A") %>' />
                            <br />
                            Cod_A:
                            <asp:Label ID="Cod_ALabel" runat="server" Text='<%# Eval("Cod_A") %>' />
                            <br />
                        </td>
                    </SelectedItemTemplate>
                </asp:ListView>
                </div>
            </section>
                </div>
        </form>
    </main>
    <footer class="footer-flex">
        <div class="footer-content">
            <hr class="hr" />
            <span class="copyright">Copyright © 2021 - Ecomerce - Todos los derechos reservados</span>
        </div>
    </footer>
</body>
</html>
