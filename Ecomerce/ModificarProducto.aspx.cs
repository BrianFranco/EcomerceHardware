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
            LblMensaje2.Visible = false;

            Usuario U = new Usuario();
            U = (Usuario)Session["Usuario"];

            if (U == null)
            {
                Label1.Text = "";
            }
            else if (U != null)
            {
                Label1.Text = "Bienvenido, " + U.Nombre_U.ToString();
            }
        }

        protected void BTNBuscarModifProducto_Click(object sender, EventArgs e)
        {
            gvModif.DataSource = na.getTablaArticulos("Select * from Articulos where Cod_A = " + txtID.Text.Trim());
            gvModif.DataBind();
            gvModif.Visible = true;
            LblMensaje2.Visible = false;

        }

        protected void gvModif_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvModif.EditIndex = e.NewEditIndex;
            gvModif.DataSource = na.getTablaArticulos("Select * from Articulos where Cod_A = " + txtID.Text.Trim());
            gvModif.DataBind();
        }

        protected void gvModif_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Articulo art = new Articulo();

            String s_ID = ((Label)gvModif.Rows[e.RowIndex].FindControl("lbl_ed_ID")).Text;
            art.Nombre_A = ((TextBox)gvModif.Rows[e.RowIndex].FindControl("txb_ed_NomA")).Text;
            art.Descripcion_A = ((TextBox)gvModif.Rows[e.RowIndex].FindControl("txb_ed_DescA")).Text;
            art.Pu_A = Convert.ToDecimal(((TextBox)gvModif.Rows[e.RowIndex].FindControl("txb_ed_PUA")).Text);
            art.Stock = Convert.ToInt32(((TextBox)gvModif.Rows[e.RowIndex].FindControl("txb_ed_StockA")).Text);
            art.ImgUrl_A = ((TextBox)gvModif.Rows[e.RowIndex].FindControl("txb_ed_IMGPATH")).Text;
            if(na.ActualizarArticulo(s_ID, art))
            {
                LblMensaje2.Text = "Modificacion efectuada exitosamente!!";
                LblMensaje2.Visible = true;
            }
            else
            {
                LblMensaje2.Text = "La modifiacion de datos fallo...";
                LblMensaje2.Visible = true;
            }

            gvModif.EditIndex = -1;
            gvModif.DataSource = na.getTablaArticulos("Select * from Articulos where Cod_A = " + txtID.Text.Trim());
            gvModif.DataBind();


        }

        protected void gvModif_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvModif.EditIndex = -1;
            gvModif.DataSource = na.getTablaArticulos("Select * from Articulos where Cod_A = " + txtID.Text.Trim());
            gvModif.DataBind();

        }
    }
}