using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

namespace Ecomerce
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario U = new Usuario();
            U = (Usuario)Session["Usuario"];

            if (U == null)
            {
                HPLGestionArt.Visible = false;
                LBLUsuarioTienda.Text = "";
                HLLogin.Visible = true;
                HLRegistrarse.Visible = true;
            }
            else if (U.Administrador_U.Equals(true))
            {
                HPLGestionArt.Visible = true;
                LBLUsuarioTienda.Text = "Bienvenido, " + U.Nombre_U.ToString();
                LBLUsuarioTienda.Visible = true;
                HLLogin.Visible = false;
                HLRegistrarse.Visible = false;
            }
            else if (U.Administrador_U.Equals(false))
            {
                HPLGestionArt.Visible = false;
                LBLUsuarioTienda.Text = "Bienvenido, " + U.Nombre_U.ToString();
                LBLUsuarioTienda.Visible = true;
                HLLogin.Visible = false;
                HLRegistrarse.Visible = false;
            }   
        }
    }
}