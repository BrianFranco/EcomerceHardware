using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using Negocio;
using Entidades;

namespace Ecomerce
{
    public partial class ModificarProducto : System.Web.UI.Page
    {
        NegocioArticulo na = new NegocioArticulo();
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

            if (!IsPostBack)
            {
                Usuario U = new Usuario();
                U = (Usuario)Session["Usuario"];

                if (U == null)
                    Label1.Text = "";
                else if (U != null)
                    Label1.Text = "Bienvenido, " + U.Nombre_U.ToString();

                Session["ID"] = txtID.Text;
                gvModif.DataSource = na.getTablaArticulos("Select * from Articulos");
                gvModif.DataBind();
            }
        }

        protected void BTNBuscarModifProducto_Click(object sender, EventArgs e)
        {
            if (RegexID.IsValid)
            {
                Session["ID"] = txtID.Text;
                ActualizarGridView();
                LblMensaje2.Text = "";
            }
        }

        protected void gvModif_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvModif.EditIndex = e.NewEditIndex;
            ActualizarGridView();
        }

        protected void gvModif_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Articulo art = new Articulo();

            String s_ID = ((Label)gvModif.Rows[e.RowIndex].FindControl("lbl_ed_ID")).Text;
            art.Nombre_A = ((TextBox)gvModif.Rows[e.RowIndex].FindControl("txb_ed_NomA")).Text;
            art.Descripcion_A = ((TextBox)gvModif.Rows[e.RowIndex].FindControl("txb_ed_DescA")).Text;
            art.Pu_A = ((TextBox)gvModif.Rows[e.RowIndex].FindControl("txb_ed_PUA")).Text;
            art.Stock = Convert.ToInt32(((TextBox)gvModif.Rows[e.RowIndex].FindControl("txb_ed_StockA")).Text);
            art.ImgUrl_A = ((TextBox)gvModif.Rows[e.RowIndex].FindControl("txb_ed_IMGPATH")).Text;
            if (na.ActualizarArticulo(s_ID, art))
                LblMensaje2.Text = "Modificacion efectuada exitosamente!!";
            else
                LblMensaje2.Text = "La modifiacion de datos fallo...";

            gvModif.EditIndex = -1;
            ActualizarGridView();
        }

        protected void gvModif_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvModif.EditIndex = -1;
            ActualizarGridView();

        }

        void ActualizarGridView()
        {
            if ((string)Session["ID"] == string.Empty)
                gvModif.DataSource = na.getTablaArticulos("Select * from Articulos");
            else
                gvModif.DataSource = na.getTablaArticulos("Select * from Articulos where Cod_A = " + txtID.Text.Trim());
            gvModif.DataBind();
        }
    }
}