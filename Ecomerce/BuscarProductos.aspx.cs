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
                if(e.CommandName == "eventoButton")
                {
                    HttpCookie ck;
                    if (this.Request.Cookies["Carrito"] == null)
                    {
                        ck = new HttpCookie("Carrito", e.CommandArgument.ToString())
                        {
                            Path = "/"
                        };
                    } else {
                        ck = Request.Cookies["Carrito"];
                        ck.Value = $"{ck.Value}-{e.CommandArgument}";
                    }
                    
                    ck.Expires = DateTime.Now.AddMinutes(10);
                    Response.Cookies.Add(ck);
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