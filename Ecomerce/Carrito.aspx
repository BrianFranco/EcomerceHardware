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
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Carrito de Compras"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:HyperLink ID="HLBuscar" NavigateUrl="~/BuscarProductos.aspx" runat="server">Volver</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Label ID="LblMsj" runat="server"></asp:Label>
        <p>
            <asp:DataList ID="DlCarrito" runat="server">
                <ItemTemplate>
                    <td runat="server" style="background-color: #DCDCDC; color: #000000;">
                        <asp:ImageButton ID="ImgBtnProducto" runat="server" Height="100px" ImageUrl='<%# Eval("Img_Url_A") %>' Width="100px" CommandArgument='<%# Eval("Cod_A")%>' CommandName="eventoImagen" OnCommand="ImgBtnProducto_Command" />
                        <asp:Label ID="Nombre_ALabel" runat="server" Text='<%# Eval("Nombre_A") %>' />
                        <asp:Label ID="PU_ALabel" runat="server" Visible="false" Text='<%# Eval("PU_A") %>'></asp:Label>
                        <asp:Button ID="BtnSumarCarrito" runat="server" Text="+" CommandArgument='<%# Eval("Cod_A") +"-"+Eval("Stock_A")%>' CommandName="eventoButtonSumar" OnCommand="BtnSumarCarrito_Command" />
                        <asp:Label ID="LblCantidad" runat="server" Text='<%# Eval("PU_A") %>'></asp:Label>
                        <asp:Button ID="BtnRestarCarrito" runat="server" Text="-" CommandArgument='<%# Eval("Cod_A") %>' CommandName="eventoButtonRestar" OnCommand="BtnRestarCarrito_Command" />
                        $<asp:Label ID="LblPU_AxCantidad" runat="server" Text='<%#(float.Parse(Eval("PU_A").ToString())) %>' />
                        <!-- *int.Parse(Eval("Cantidad").ToString()) -->
                        <asp:Button ID="BtnQuitarCarrito" runat="server" Text="Quitar del Carrito" CommandArgument='<%# Eval("Cod_A") %>' CommandName="eventoButtonQuitar" OnCommand="BtnQuitarCarrito_Command" />
                    </td>
                </ItemTemplate>
            </asp:DataList>
        </p>
        <div >
            <asp:Label ID="LblTextoTotal" runat="server" Text="TOTAL: $ "></asp:Label>
            <asp:Label ID="LblTotal" runat="server"></asp:Label>
        </div>
        <p>
            <asp:Button ID="BtnComprar" runat="server" Text="Comprar" OnClick="BtnComprar_Click"/>
        </p>
    </form>
</body>
</html>
