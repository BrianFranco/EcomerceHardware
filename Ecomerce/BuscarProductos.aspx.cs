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
    public partial class BuscarProductos : System.Web.UI.Page
    {
        NegocioArticulo NegArticulo = new NegocioArticulo();
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
                LBLUsuarioBuscarProducto.Text = "";
            }
            else if (U != null)
            {
                LBLUsuarioBuscarProducto.Text = "Bienvenido, " + U.Nombre_U.ToString();
            }

            if (!IsPostBack)
            {
                CargarGridView();
            }
        }
        void CargarGridView()
        {
            LvProductos.DataSource = NegArticulo.GetArticulos();
            LvProductos.DataBind();
        }

        protected void BTNBuscarProducto_Click(object sender, EventArgs e)
        {
            if (TBXBuscarProducto.Text != string.Empty)
            {
                LvProductos.DataSource = NegArticulo.GetArticulosFiltroxNombre(TBXBuscarProducto.Text);
                LvProductos.DataBind();
                TBXBuscarProducto.Text = string.Empty;
            }
            else
            {
                CargarGridView();
            }

        }
        protected void BtnAgregarCarrito_Command(object sender, CommandEventArgs e)
        {
            if (Session["Usuario"]!=null)
            {
                Usuario U = Session["Usuario"] as Usuario;
                if (e.CommandName == "eventoButton")
                {
                    int cod_a = int.Parse(e.CommandArgument.ToString());
                    Dictionary<int, int> dic;
                    if (Application[$"Carrito{U.Dni_U}"]==null)
                    {
                        dic = new Dictionary<int, int>();
                    }
                    else
                    {
                        dic = (Dictionary<int,int>)Application[$"Carrito{U.Dni_U}"];
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
                    LBLBuscarProducto.Text = "Se agrego al carrito.";
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
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
                        Value= e.CommandArgument.ToString(),
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