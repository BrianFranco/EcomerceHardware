using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Ecomerce
{
    public partial class Registro : System.Web.UI.Page
    {
        NegocioUsuario ns = new NegocioUsuario();
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
            lblMsg.Visible = false;
        }

        protected void btnRegis_Click(object sender, EventArgs e)
        {
            if (ns.RegistroUsuario(txbUserReg.Text.Trim(), txbContra1.Text.Trim(),int.Parse(txbDni.Text)))
            {
                lblMsg.Text = "Registro exitoso!!";
                lblMsg.Visible = true;
                return;
            }
            else
            {
                lblMsg.Text = "El usuario ya fue registrado";
                lblMsg.Visible = true;
                return;
            }
        }
    }
}