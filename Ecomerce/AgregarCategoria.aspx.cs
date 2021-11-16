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
    public partial class AgregarCategoria : System.Web.UI.Page
    {
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
                LBLUsuarioAgregarCategoria.Text = "";
            }
            else if (U != null)
            {
                LBLUsuarioAgregarCategoria.Text = "Bienvenido, " + U.Nombre_U.ToString();
            }
        }

        protected void BtnAgregarCategoria_Click(object sender, EventArgs e)
        {
            if (rfvNomCat.IsValid)
            {
                Categoria cat = new Categoria();
                cat.Nombre_cat = txbNomCat.Text;
                NegocioCategoria NegCategoria = new NegocioCategoria();

                if (NegCategoria.InsertarCategoria(cat) > 0)
                {
                    LblMsj.Text = "Se agrego correctamente.";
                }
                else
                {
                    LblMsj.Text = "No se agrego la categoria.";
                }
                txbNomCat.Text = string.Empty;
            }
        }
    }
}