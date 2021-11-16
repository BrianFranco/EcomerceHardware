<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EliminarProducto.aspx.cs" Inherits="Ecomerce.EliminarProducto" %>

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
        .auto-style5 {
            text-align: left;
        }
        .auto-style6 {
            text-align: left;
            height: 46px;
        }
        .auto-style7 {
            height: 46px;
        }
        .auto-style8 {
            text-align: left;
            font-size: x-large;
            height: 29px;
        }
        .auto-style9 {
            height: 29px;
        }
        .auto-style10 {
            height: 75px;
        }
        .auto-style11 {
            text-align: left;
            height: 50px;
        }
        .auto-style12 {
            height: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style8"></td>
                            <td class="auto-style9"></td>
                            <td class="auto-style9">
                    <asp:Label ID="LBLUsuarioEliminarProducto" runat="server" Text="Bienvenido, Usuario"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3"><strong>Eliminar Producto</strong></td>
                            <td class="auto-style10"></td>
                            <td class="auto-style10"></td>
                        </tr>
                        <tr>
                            <td class="auto-style11">ID Producto:
                                <asp:TextBox ID="TBXIdProducto" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="REGIdProducto" runat="server" ControlToValidate="TBXIdProducto" ForeColor="Red" ValidationExpression="^\+?(0|[1-9]\d*)$"></asp:RegularExpressionValidator>
                            </td>
                            <td class="auto-style12"></td>
                            <td class="auto-style12"></td>
                        </tr>
                        <tr>
                            <td class="auto-style6">
                                <asp:ListView ID="LVEliminarProducto" runat="server" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" GroupItemCount="3">
                                    <AlternatingItemTemplate>
                                        <td runat="server" style="background-color: #FFFFFF;color: #284775;">
                                            <asp:Label ID="NombreCatLabel" runat="server" Text='<%# Eval("NombreCat") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="Nombre_ALabel" runat="server" Text='<%# Eval("Nombre_A") %>' />
                                            <br />
                                            <asp:Label ID="Descripcion_ALabel" runat="server" Text='<%# Eval("Descripcion_A") %>' />
                                            <br />$<asp:Label ID="PU_ALabel" runat="server" Text='<%# Eval("PU_A") %>' />
                                            <br />Stock:
                                            <asp:Label ID="Stock_ALabel" runat="server" Text='<%# Eval("Stock_A") %>' />
                                            <br />
                                            <asp:ImageButton ID="ImageButton1" runat="server" Height="150px" ImageUrl='<%# Eval("Img_Url_A") %>' Width="150px" />
                                            <br />
                                            <asp:Button ID="BtnEliminar" runat="server" CommandArgument='<%# Eval("Cod_A") %>' CommandName="EventoEliminar" OnCommand="BtnEliminar_Command" Text="Eliminar" />
                                            <br /></td>
                                    </AlternatingItemTemplate>
                                    <EditItemTemplate>
                                        <td runat="server" style="background-color: #999999;">Nombre_A:
                                            <asp:TextBox ID="Nombre_ATextBox" runat="server" Text='<%# Bind("Nombre_A") %>' />
                                            <br />Descripcion_A:
                                            <asp:TextBox ID="Descripcion_ATextBox" runat="server" Text='<%# Bind("Descripcion_A") %>' />
                                            <br />NombreCat:
                                            <asp:TextBox ID="NombreCatTextBox" runat="server" Text='<%# Bind("NombreCat") %>' />
                                            <br />PU_A:
                                            <asp:TextBox ID="PU_ATextBox" runat="server" Text='<%# Bind("PU_A") %>' />
                                            <br />Stock_A:
                                            <asp:TextBox ID="Stock_ATextBox" runat="server" Text='<%# Bind("Stock_A") %>' />
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
                                            <br />Descripcion_A:
                                            <asp:TextBox ID="Descripcion_ATextBox" runat="server" Text='<%# Bind("Descripcion_A") %>' />
                                            <br />NombreCat:
                                            <asp:TextBox ID="NombreCatTextBox" runat="server" Text='<%# Bind("NombreCat") %>' />
                                            <br />PU_A:
                                            <asp:TextBox ID="PU_ATextBox" runat="server" Text='<%# Bind("PU_A") %>' />
                                            <br />Stock_A:
                                            <asp:TextBox ID="Stock_ATextBox" runat="server" Text='<%# Bind("Stock_A") %>' />
                                            <br />Img_Url_A:
                                            <asp:TextBox ID="Img_Url_ATextBox" runat="server" Text='<%# Bind("Img_Url_A") %>' />
                                            <br />
                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                                            <br />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                                            <br /></td>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <td runat="server" style="background-color: #E0FFFF;color: #333333;">
                                            <asp:Label ID="NombreCatLabel" runat="server" Text='<%# Eval("NombreCat") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="Nombre_ALabel" runat="server" Text='<%# Eval("Nombre_A") %>' />
                                            <br />
                                            <asp:Label ID="Descripcion_ALabel" runat="server" Text='<%# Eval("Descripcion_A") %>' />
                                            <br />$<asp:Label ID="PU_ALabel" runat="server" Text='<%# Eval("PU_A") %>' />
                                            <br />Stock:
                                            <asp:Label ID="Stock_ALabel" runat="server" Text='<%# Eval("Stock_A") %>' />
                                            <br />
                                            <asp:ImageButton ID="ImageButton1" runat="server" Height="150px" ImageUrl='<%# Eval("Img_Url_A") %>' Width="150px" />
                                            <br />
                                            <asp:Button ID="BtnEliminar" runat="server" CommandArgument='<%# Eval("Cod_A") %>' CommandName="EventoEliminar" OnCommand="BtnEliminar_Command" Text="Eliminar" />
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
                                                <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
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
                                            <br />Descripcion_A:
                                            <asp:Label ID="Descripcion_ALabel" runat="server" Text='<%# Eval("Descripcion_A") %>' />
                                            <br />NombreCat:
                                            <asp:Label ID="NombreCatLabel" runat="server" Text='<%# Eval("NombreCat") %>' />
                                            <br />PU_A:
                                            <asp:Label ID="PU_ALabel" runat="server" Text='<%# Eval("PU_A") %>' />
                                            <br />Stock_A:
                                            <asp:Label ID="Stock_ALabel" runat="server" Text='<%# Eval("Stock_A") %>' />
                                            <br />Img_Url_A:
                                            <asp:Label ID="Img_Url_ALabel" runat="server" Text='<%# Eval("Img_Url_A") %>' />
                                            <br /></td>
                                    </SelectedItemTemplate>
                                </asp:ListView>
                                <asp:Label ID="LBLEliminarProducto" runat="server" ForeColor="Black"></asp:Label>
                            </td>
                            <td class="auto-style7"></td>
                            <td class="auto-style7"></td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
            <asp:HyperLink ID="HPLVolverEliminarProducto" runat="server" ForeColor="Blue" NavigateUrl="~/AdminMenu.aspx">Volver</asp:HyperLink>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="BTNBuscarProductoAEliminar" runat="server" Text="Buscar" OnClick="BTNBuscarProductoAEliminar_Click" />
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                <br />
        </div>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
