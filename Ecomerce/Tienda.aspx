<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tienda.aspx.cs" Inherits="Ecomerce.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link type="text/css" rel="stylesheet" href="Css/Estilos.css" />
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
                <a class="items"><span>Gabinetes</span></a>
                <a class="items"><span>Cpus</span></a>
                <a class="items"><span>Gpus</span></a>
                <a class="items"><span>Memorias</span></a>
                <a class="items"><span>Discos</span></a>
                <a class="items"><span>Perifericos</span></a>
                <a class="items"><span>Mothers</span></a>
                <a class="items"><span>Equipos</span></a>
                <a class="items"><span>Notebooks</span></a>
            </aside>
            <section class="section-grid" id="section" runat="server">
                <div class="card">
                    <img class="img" src="Imagenes/img1.jpg"/>
                    <span>Intel Core I7</span>
                    <asp:Button ID="Button1" runat="server" Text="Agregar al Carrito" />
                </div>
                <div class="card">
                    <img class="img" src="Imagenes/img2.jpg"/>
                    <span>Ryzen 5</span>
                    <asp:Button ID="Button2" runat="server" Text="Agregar al Carrito" />
                </div>
                <div class="card">
                    <img class="img" src="Imagenes/img3.jpg"/>
                    <span>Gabinete Kolink</span>
                    <asp:Button ID="Button3" runat="server" Text="Agregar al Carrito" />
                </div>
                <div class="card">
                    <img class="img" src="Imagenes/img4.jpg"/>
                    <span>Mouse Glorious</span>
                    <asp:Button ID="Button4" runat="server" Text="Agregar al Carrito" />
                </div>
                <div class="card">
                    <img class="img" src="Imagenes/img5.jpg"/>
                    <span>Zotac Rtx 3070</span>
                    <asp:Button ID="Button5" runat="server" Text="Agregar al Carrito" />
                </div>
                <div class="card">
                    <img class="img" src="Imagenes/img6.jpg"/>
                    <span>ASUS ROG STRIX 750G</span>
                    <asp:Button ID="Button6" runat="server" Text="Agregar al Carrito" />
                </div>
                <div class="card">
                    <img class="img" src="Imagenes/img7.jpg"/>
                    <span>Gabinete Kolink</span>
                    <asp:Button ID="Button7" runat="server" Text="Agregar al Carrito" />
                </div>
                <div class="card">
                    <img class="img" src="Imagenes/img8.jpg"/>
                    <span>Mouse ROG STRIX </span>
                    <asp:Button ID="Button8" runat="server" Text="Agregar al Carrito" />
                </div>
                <div class="card">
                    <img class="img" src="Imagenes/img9.jpg"/>
                    <span>Fuente ASUS TUF</span>
                    <asp:Button ID="Button9" runat="server" Text="Agregar al Carrito" />
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
