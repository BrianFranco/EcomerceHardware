using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Ecomerce
{
    public partial class Carrito : System.Web.UI.Page
    {
        NegocioArticulo NegArticulo = new NegocioArticulo();
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario U = new Usuario();
            U = (Usuario)Session["Usuario"];

            if (U == null)
            {
                Label2.Text = "";
            }
            else if (U != null)
            {
                Label2.Text = "Bienvenido, " + U.Nombre_U.ToString();
            }
            if (!IsPostBack)
            {
                if (this.Request.Cookies["Carrito"] != null)
                {
                    CargarCarrito();
                }
                else
                {
                    LblMsj.Text = "Carrito vacio.";
                }
            }
        }
        void CargarCarrito()
        {
            
            lvCarrito.DataSource = NegArticulo.GetArticulosCarrito(Request.Cookies["Carrito"].Value);
            lvCarrito.DataBind();
        }
    }
    
}