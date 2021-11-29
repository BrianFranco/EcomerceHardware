using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocio;
using Entidades;

namespace Ecomerce
{
    public partial class Carrito : System.Web.UI.Page
    {
        NegocioArticulo NegArticulo = new NegocioArticulo();
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario U = new Usuario();
            U = (Usuario)Session["Usuario"];

            if (U == null)
            {
                Label2.Text = "";
            }
            else if (U != null)
            {
                Label2.Text = "Bienvenido, " + U.Nombre_U.ToString();
            }
            if (!IsPostBack)
            {
                if (U != null)
                {
                    if (Application[$"Carrito{U.Dni_U}"] != null)
                    {
                        CargarCarrito();
                    }
                    else
                    {
                        LblMsj.Text = "Carrito vacio.";
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                } 
            }
        }
        void CargarCarrito()
        {
            Usuario U = Session["Usuario"] as Usuario;
            Dictionary<int, int> dic = (Dictionary<int, int>)Application[$"Carrito{U.Dni_U}"];
            DataTable dt = NegArticulo.GetArticulosCarrito(dic);
            lvCarrito.DataSource = dt;
            lvCarrito.DataBind();
            DlCarrito.DataSource = dt;
            DlCarrito.DataBind();
        }

        protected void BtnAgregarCarrito_Command(object sender, CommandEventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                if (e.CommandName == "eventoButton")
                {
                    Usuario U = Session["Usuario"] as Usuario;
                    int cod_a = int.Parse(e.CommandArgument.ToString());
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
                    CargarCarrito();
                }
            }
        }

        protected void ImgBtnProducto_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoImagen")
            {
                HttpCookie ck;
                if (this.Request.Cookies["Seleccionado"] == null)
                {
                    ck = new HttpCookie("Seleccionado")
                    {
                        Value = e.CommandArgument.ToString(),
                        Path = "/"
                    };
                }
                else
                {
                    ck = Request.Cookies["Seleccionado"];
                    ck.Value = e.CommandArgument.ToString();
                }
                ck.Expires = DateTime.Now.AddMinutes(5);
                Response.Cookies.Add(ck);
                Response.Redirect("MostrarProducto.aspx");
            }
        }
    }
    
}