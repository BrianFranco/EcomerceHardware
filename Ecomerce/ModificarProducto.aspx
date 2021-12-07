<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarProducto.aspx.cs" Inherits="Ecomerce.ModificarProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
            width: 399px;
        }
        .auto-style4 {
            text-align: right;
        }
        .auto-style5 {
            width: 399px;
            height: 23px;
            text-align: left;
        }
        .auto-style6 {
            text-align: left;
            height: 23px;
        }
        .auto-style7 {
            text-align: left;
            height: 30px;
        }
        .auto-style8 {
            width: 399px;
            height: 30px;
            margin-left: 40px;
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
                        <asp:Label ID="Label1" runat="server" Text="Bienvenido, Usuario"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
            <strong><span class="auto-style1">Modificar producto</span></strong></td>
                    <td class="auto-style4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">
                        Ingrese el ID del producto que desea modificar: <asp:TextBox ID="txtID" runat="server" Width="50px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegexID" runat="server" ControlToValidate="txtID" ErrorMessage="Debe ingresar un numero entero positivo" ForeColor="Red" ValidationExpression="^[1-9]\d*$" ValidationGroup="G1">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style7">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5" dir="ltr">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Height="22px" ValidationGroup="G1" Width="316px" />
&nbsp;</td>
                    <td class="auto-style6" aria-required="False">
            <asp:Button ID="BTNBuscarModifProducto" runat="server" Text="Buscar" ValidationGroup="G1" OnClick="BTNBuscarModifProducto_Click" />
                        </td>
                </tr>
            </table>

            <br />
            <asp:GridView ID="gvModif" runat="server" AutoGenerateEditButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowEditing="gvModif_RowEditing" AutoGenerateColumns="False" OnRowCancelingEdit="gvModif_RowCancelingEdit" OnRowUpdating="gvModif_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <EditItemTemplate>
                            <asp:Label ID="lbl_ed_ID" runat="server" Text='<%# Bind("Cod_A") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_ID" runat="server" Text='<%# Bind("Cod_A") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="txb_ed_NomA" runat="server" Text='<%# Bind("Nombre_A") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_NombreA" runat="server" Text='<%# Bind("Nombre_A") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Descripcion">
                        <EditItemTemplate>
                            <asp:TextBox ID="txb_ed_DescA" runat="server" Text='<%# Bind("Descripcion_A") %>' TextMode="MultiLine"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_DescripcionA" runat="server" Text='<%# Bind("Descripcion_A") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio por Unidad">
                        <EditItemTemplate>
                            <asp:TextBox ID="txb_ed_PUA" runat="server" Text='<%# Bind("PU_A") %>' ValidationGroup="G1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_PU" runat="server" Text='<%# Bind("PU_A") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Stock">
                        <EditItemTemplate>
                            <asp:TextBox ID="txb_ed_StockA" runat="server" Text='<%# Bind("Stock_A") %>' TextMode="Number"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Stock" runat="server" Text='<%# Bind("Stock_A") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ruta de IMG">
                        <EditItemTemplate>
                            <asp:TextBox ID="txb_ed_IMGPATH" runat="server" Text='<%# Bind("Img_Url_A") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_IMGPATH" runat="server" Text='<%# Bind("Img_Url_A") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
            <br />
            <asp:HyperLink ID="HPLVolverAgregarProducto" runat="server" ForeColor="Blue" NavigateUrl="~/AdminMenu.aspx">Volver</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LblMensaje2" runat="server"></asp:Label>
            </div>
    </form>
</body>
</html>
