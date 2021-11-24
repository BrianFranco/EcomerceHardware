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
    public partial class MostrarProducto : System.Web.UI.Page
    {
        NegocioArticulo negArticulo = new NegocioArticulo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarSeleccionado();
            }
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            if (Session["Usuario"]!=null)
            {
                if (this.Request.Cookies["Carrito"] == null)
                {
                    HttpCookie ck = new HttpCookie("Carrito", Request.Cookies["Seleccionado"].Value)
                    {
                        Expires = DateTime.Now.AddMinutes(10),
                        Path = "/"
                    };
                    Response.Cookies.Add(ck);
                }else{
                    HttpCookie ck = Request.Cookies["Carrito"];
                    ck.Value = $"{ck.Value}-{Request.Cookies["Seleccionado"].Value}";
                    Response.Cookies.Add(ck);
                }
                LblMsj.Text = "Se agrego al carrito.";
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        void CargarSeleccionado()
        {
            HttpCookie ck = Request.Cookies["Seleccionado"];
            Articulo art = negArticulo.GetArticulosFiltroxID(ck.Value);
            LblDescripcion.Text = art.Descripcion_A;
            LblNombre.Text = art.Nombre_A;
            LblPrecio.Text = art.Pu_A.ToString();
            ImgProducto.ImageUrl = art.ImgUrl_A;
            if(art.Stock == 0)
            {
                BtnAgregar.Enabled = false;
                LblMsj.Text = "Articulo temporalmente sin stock.";
            }
        }
    }
}