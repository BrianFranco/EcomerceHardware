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
    public partial class BuscarProductos : System.Web.UI.Page
    {
        NegocioArticulo NegArticulo = new NegocioArticulo();
        protected void Page_Load(object sender, EventArgs e)
        {
            string JQueryVer = "1.7.1";
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery-" + JQueryVer + ".min.js",
                DebugPath = "~/Scripts/jquery-" + JQueryVer + ".js",
                CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + JQueryVer + ".min.js",
                CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + JQueryVer + ".js",
                CdnSupportsSecureConnection = true,
                LoadSuccessExpression = "window.jQuery"
            });

            Usuario U = new Usuario();
            U = (Usuario)Session["Usuario"];

            if (U == null)
            {
                LBLUsuarioBuscarProducto.Text = "";
            }
            else if (U != null)
            {
                LBLUsuarioBuscarProducto.Text = "Bienvenido, " + U.Nombre_U.ToString();
            }

            if (!IsPostBack)
            {
                CargarGridView();
            }
        }
        void CargarGridView()
        {
            GvBuscarProducto.DataSource = NegArticulo.GetArticulos();
            GvBuscarProducto.DataBind();
        }

        protected void BTNBuscarProducto_Click(object sender, EventArgs e)
        {
            if (TBXBuscarProducto.Text != string.Empty)
            {
                GvBuscarProducto.DataSource = NegArticulo.GetArticulosFiltro(TBXBuscarProducto.Text);
                GvBuscarProducto.DataBind();
                TBXBuscarProducto.Text = string.Empty;
            }
            else
            {
                CargarGridView();
            }

        }
    }
}