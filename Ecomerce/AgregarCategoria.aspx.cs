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
        NegocioCategoria neg = new NegocioCategoria();
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
                try
                {
                    int existente = neg.CategoriaExistente(txbNomCat.Text.ToString());
                    if (existente == 0)
                    {
                        int AltaCat = neg.InsertarCategoria(txbNomCat.Text.ToString());
                        if (AltaCat == 1)
                        {
                            LBLDevolucion.ForeColor = System.Drawing.Color.Green;
                            LBLDevolucion.Text = "La categoria '" + txbNomCat.Text.ToString() + "' se agrego con exito!";
                            txbNomCat.Text = "";
                        }
                        else
                        {
                            LBLDevolucion.ForeColor = System.Drawing.Color.Red;
                            LBLDevolucion.Text = "Se produjo un error al intentar agregar la categoria " + txbNomCat.Text.ToString() + "'";
                            txbNomCat.Text = "";
                        }
                    }
                    else
                    {
                        LBLDevolucion.ForeColor = System.Drawing.Color.Red;
                        LBLDevolucion.Text = "La categoria que intenta agregar ya existe";
                        txbNomCat.Text = "";
                    }
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
        }
    }
}