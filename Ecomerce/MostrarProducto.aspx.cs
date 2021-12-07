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
            if (Session["Usuario"] != null)
            {
                Usuario U = Session["Usuario"] as Usuario;
                int cod_a = int.Parse(Request.Cookies["Seleccionado"].Value);
                Dictionary<int, int> dic;
                if (Application[$"Carrito{U.Dni_U}"] == null)
                {
                    dic = new Dictionary<int, int>();
                }
                else
                {
                    dic = (Dictionary<int, int>)Application[$"Carrito{U.Dni_U}"];
                }
                //Busca si el id ya fue cargado o no
                if (dic.ContainsKey(cod_a))
                {
                    dic[cod_a]++;
                }
                else
                {
                    dic.Add(cod_a, 1);
                }
                Application[$"Carrito{U.Dni_U}"] = dic;
                LblMsj.Text = "Se agrego al carrito.";
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        void CargarSeleccionado()
        {
            Articulo art = negArticulo.GetArticulosFiltroxID((string)Session["Seleccionado"]);
            LblNombreCat.Text = art.Categoria_A.Nombre_Cat;
            LblNombre.Text = art.Nombre_A;
            LblDescripcion.Text = art.Descripcion_A;
            LblPrecio.Text = art.Pu_A.ToString();
            ImgProducto.ImageUrl = art.ImgUrl_A;
            if (art.Stock == 0)
            {
                BtnAgregar.Enabled = false;
                LblMsj.Text = "Articulo temporalmente sin stock.";
            }
        }
    }
}