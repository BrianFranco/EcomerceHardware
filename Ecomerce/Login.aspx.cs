using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Ecomerce
{
    public partial class WebForm1 : System.Web.UI.Page
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

        }

        protected void BTNLogin_Click(object sender, EventArgs e)
        {
            if (RFVLoginContraseña.IsValid && RFVLoginNombreUsuario.IsValid)
            {
                NegocioUsuario usuario = new NegocioUsuario();
                Usuario us = new Usuario();
                us.Dni_U = int.Parse(TBXLoginNombreUsuario.Text);
                us.Contrasenia_U = TBXLoginContraseña.Text;

                Usuario user = usuario.LoginUsuario(us);
                if (user == null)
                {
                    LBLLoginUsuarioInvalido.Text = "Ingreso un nombre y/o contraseña incorrectos.";
                }
                else
                {
                    Session["Usuario"] = user;
                    if (user.Administrador_U)
                    {
                        Response.Redirect("AdminMenu.aspx");
                    }
                    else
                    {
                        Response.Redirect("Tienda.aspx");
                    }
                }
            }
        }
    }
}