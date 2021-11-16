using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Entidades;
using Negocio;

namespace Ecomerce
{
    public partial class EliminarProducto : System.Web.UI.Page
    {
        NegocioArticulo neg = new NegocioArticulo();
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

            if(!IsPostBack)
            {
                ActualizarListView(getConsulta());
            }

            Usuario U = new Usuario();
            U = (Usuario)Session["Usuario"];

            if (U == null)
            {
                LBLUsuarioEliminarProducto.Text = "";
            }
            else if (U != null)
            {
                LBLUsuarioEliminarProducto.Text = "Bienvenido, " + U.Nombre_U.ToString();
            }
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BTNBuscarProductoAEliminar_Click(object sender, EventArgs e)
        {
            string j = getConsulta();
            if (TBXIdProducto.Text != "")
                j += " AND Cod_A = " + TBXIdProducto.Text;
            ActualizarListView(j);
            TBXIdProducto.Text = "";

        }

        protected void BtnEliminar_Command(object sender, CommandEventArgs e)
        {
            if(e.CommandName == "EventoEliminar")
            {
                Articulo reg = new Articulo();
                reg.Cod_A = int.Parse(e.CommandArgument.ToString());
                if (neg.EliminarArticulo(reg) > 0)
                    LBLEliminarProducto.Text = "El producto se elimino correctamente";
                else
                    LBLEliminarProducto.Text = "";
                ActualizarListView(getConsulta());
            }
        }

        string getConsulta()
        {
            return "SELECT [Cod_A], [Nombre_A], [Descripcion_A], [NombreCat], [PU_A], [Stock_A], [Img_Url_A] FROM [Articulos] INNER JOIN [Categorias] ON Articulos.Cat_A = Categorias.Cod_Cat WHERE Baja_A = 0";
        }

        void ActualizarListView(string j)
        {
            LVEliminarProducto.DataSource = neg.getTablaArticulos(j);
            LVEliminarProducto.DataBind();
        }
    }
}