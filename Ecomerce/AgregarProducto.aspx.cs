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
    public partial class AgregarProducto : System.Web.UI.Page
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
                DDLCategoriaProducto.DataSource = neg.getTablaArticulos("SELECT [NombreCat], [Cod_Cat] FROM[Categorias]");
                DDLCategoriaProducto.DataTextField = "NombreCat";
                DDLCategoriaProducto.DataValueField = "Cod_Cat";
                DDLCategoriaProducto.DataBind();
            }

            Usuario U = new Usuario();
            U = (Usuario)Session["Usuario"];

            if (U == null)
            {
                LBLUsuarioAgregarProducto.Text = "";
            }
            else if (U != null)
            {
                LBLUsuarioAgregarProducto.Text = "Bienvenido, " + U.Nombre_U.ToString();
            }
        }

        protected void BTNAgregarProducto_Click(object sender, EventArgs e)
        {
            if(RFVIdProducto.IsValid && RFVDescripcionProducto.IsValid && RFVPrecioProducto.IsValid && RFVStockProducto.IsValid && FUPUrlImagen.HasFile)
            {
                if (neg.AgregarArticulo("INSERT INTO Articulos (Nombre_A, Descripcion_A, Cat_A, PU_A, Stock_A, Img_Url_A)" +
                    "Values ('" + TBXNombreProducto.Text + "','" + TBXDescripcionProducto.Text + "'," + DDLCategoriaProducto.SelectedValue + "," + TBXPrecioProducto.Text + "," + TBXStockProducto.Text + ",'~/Imagenes/" + FUPUrlImagen.FileName + "')") > 0)
                    LBLConfirmacionAgregarProducto.Text = "El producto se agrego correctamente";
                else
                    LBLConfirmacionAgregarProducto.Text = "El producto no se pudo agregar correctamente";
                VaciarTBX();
            }
            else
                LBLConfirmacionAgregarProducto.Text = "";
        }
        
        void VaciarTBX()
        {
            TBXNombreProducto.Text = "";
            TBXDescripcionProducto.Text = "";
            TBXPrecioProducto.Text = "";
            TBXStockProducto.Text = "";
        }
    }
}