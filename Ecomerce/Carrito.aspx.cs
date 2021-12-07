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
                Label2.Text = "";
            else if (U != null)
                Label2.Text = "Bienvenido, " + U.Nombre_U.ToString();
            if (!IsPostBack)
            {
                if (U != null)
                {
                    if (Application[$"Carrito{U.Dni_U}"] != null)
                    {
                        CargarCarrito();
                        CargarTotal();
                    }
                    else
                    {
                        LblMsj.Text = "Carrito vacio.";
                        BtnComprar.Visible = false;
                        LblTextoTotal.Visible = false;
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        void CargarTotal()
        {
            decimal TOTAL = 0;
            foreach (DataListItem item in DlCarrito.Items)
            {
                TOTAL += decimal.Parse(((Label)item.FindControl("LblPU_AxCantidad")).Text);
            }
            LblTotal.Text = TOTAL.ToString();
            LblTextoTotal.Visible = true;

        }
        void CargarCarrito()
        {
            NegocioArticulo neg = new NegocioArticulo();
            Usuario U = Session["Usuario"] as Usuario;
            Dictionary<int, int> dic = (Dictionary<int, int>)Application[$"Carrito{U.Dni_U}"];
            DataTable dt = NegArticulo.GetArticulosCarrito(dic);

            DlCarrito.DataSource = dt;
            DlCarrito.DataBind();
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
        protected void BtnSumarCarrito_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoButtonSumar")
            {
                Usuario U = Session["Usuario"] as Usuario;
                string[] argument = e.CommandArgument.ToString().Split('-');
                int cod_a = int.Parse(argument[0]);
                int stock = int.Parse(argument[1]);
                Dictionary<int, int> dic;
                dic = (Dictionary<int, int>)Application[$"Carrito{U.Dni_U}"];
                if (dic[cod_a] < stock)
                {
                    dic[cod_a]++;
                    Application[$"Carrito{U.Dni_U}"] = dic;
                    CargarCarrito();
                    CargarTotal();
                }
                else
                {
                    LblMsj.Text = "Alcanzaste el maximo de productos en stock.";
                }
            }
        }
        protected void BtnRestarCarrito_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoButtonRestar")
            {
                Usuario U = Session["Usuario"] as Usuario;
                int cod_a = int.Parse(e.CommandArgument.ToString());
                Dictionary<int, int> dic;
                dic = (Dictionary<int, int>)Application[$"Carrito{U.Dni_U}"];
                if (dic[cod_a] == 1)
                {
                    QuitarProductoCarrito(cod_a);
                }
                else
                {
                    dic[cod_a]--;
                    Application[$"Carrito{U.Dni_U}"] = dic;
                    CargarCarrito();
                    CargarTotal();
                }

            }
        }

        protected void BtnQuitarCarrito_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoButtonQuitar")
            {
                QuitarProductoCarrito(int.Parse(e.CommandArgument.ToString()));
            }
        }
        void QuitarProductoCarrito(int cod_a)
        {
            Usuario U = Session["Usuario"] as Usuario;
            Dictionary<int, int> dic;
            dic = (Dictionary<int, int>)Application[$"Carrito{U.Dni_U}"];
            dic.Remove(cod_a);
            Application[$"Carrito{U.Dni_U}"] = dic;
            if (dic.Count == 0)
            {
                Application[$"Carrito{U.Dni_U}"] = null;
                DlCarrito.DataSource = null;
                DlCarrito.DataBind();
                LblMsj.Text = "Carrito vacio.";
                LblTextoTotal.Visible = false;
                LblTotal.Text = string.Empty;
                BtnComprar.Visible = false;
            }
            else
            {
                CargarCarrito();
                CargarTotal();
                LblMsj.Text = "Se quito del carrito correctamente.";
            }
        }
        protected void BtnComprar_Click(object sender, EventArgs e)
        {
            NegocioVenta negVenta = new NegocioVenta();
            float total = float.Parse(LblTotal.Text);
            Usuario u = Session["Usuario"] as Usuario;
            List<float> pu = new List<float>();
            foreach (DataListItem item in DlCarrito.Items)
            {
                pu.Add(float.Parse(((Label)item.FindControl("PU_ALabel")).Text));
            }
            Dictionary<int, int> dic;
            dic = (Dictionary<int, int>)Application[$"Carrito{u.Dni_U}"];
            if (negVenta.CargarCompra(u, total, dic, pu))
            {
                Usuario U = Session["Usuario"] as Usuario;
                LblMsj.Text = "Compro correctamente su carrito de compras.Carrito vacio.";
                Application[$"Carrito{U.Dni_U}"] = null;
                DlCarrito.DataSource = null;
                DlCarrito.DataBind();
                LblTextoTotal.Visible = false;
                LblTotal.Text = string.Empty;
                BtnComprar.Visible = false;
            }
            else
            {
                LblMsj.Text = "Huvo un error al comprar el carrito.";
            }
        }
    }

}