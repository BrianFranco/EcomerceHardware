using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

namespace Ecomerce
{
    public partial class AdminMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario U = new Usuario();
            U = (Usuario)Session["Usuario"];

            if (U == null)
            {
                LBLUsuarioAdminMenu.Text = "";
            }
            else if (U != null)
            {
                LBLUsuarioAdminMenu.Text = "Bienvenido, " + U.Nombre_U.ToString();
            }
        }
    }
}