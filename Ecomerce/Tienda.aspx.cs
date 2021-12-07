using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.Drawing;
using Entidades;
using Negocio;

namespace Ecomerce
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario U = new Usuario();
            U = (Usuario)Session["Usuario"];
            NegocioArticulo neg = new NegocioArticulo();

            if (U == null)
            {
                HPLGestionArt.Visible = false;
                LBLUsuarioTienda.Text = "";
                HLLogin.Visible = true;
                HLRegistrarse.Visible = true;
            }
            else if (U.Administrador_U.Equals(true))
            {
                HPLGestionArt.Visible = true;
                LBLUsuarioTienda.Text = "Bienvenido, " + U.Nombre_U.ToString();
                LBLUsuarioTienda.Visible = true;
                HLLogin.Visible = false;
                HLRegistrarse.Visible = false;
            }
            else if (U.Administrador_U.Equals(false))
            {
                HPLGestionArt.Visible = false;
                LBLUsuarioTienda.Text = "Bienvenido, " + U.Nombre_U.ToString();
                LBLUsuarioTienda.Visible = true;
                HLLogin.Visible = false;
                HLRegistrarse.Visible = false;
            }

            if (!IsPostBack)
            {
                if(Session["consulta"] == null)
                {
                    Session["consulta"] = "SELECT [Cod_A], [Img_Url_A], [Nombre_A], [PU_A] FROM Articulos";
                    Session["cat"] = "0";
                }
                DataList1.DataSource = neg.getTablaArticulos("SELECT [Nombre_Cat], [Cod_Cat] FROM[Categorias]");
                DataList1.DataBind();
                ActualizarListView();
            }
        }

        protected void BtnCategorias_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "ComandoBtnCat")
            {
                CambiarColorDataList(Color.White);
                Session["cat"] = e.CommandArgument;
                CambiarColorDataList(Color.Blue);
                ActualizarListView();
                
            }
        }

        protected void BtnTodos_Click(object sender, EventArgs e)
        {
            CambiarColorDataList(Color.White);
            Session["cat"] = "0";
            CambiarColorDataList(Color.Blue);
            ActualizarListView();
        }

        void CambiarColorDataList(Color c)
        {
            DataListItem dli = DataList1.Controls[int.Parse(Session["cat"].ToString())] as DataListItem;
            Button btn;
            if (Session["cat"].ToString() == "0")
                btn = dli.FindControl("BtnTodos") as Button;
            else
                btn = dli.FindControl("BtnCategorias") as Button;
            btn.BackColor = c;
        }

        void CambiarPagina()
        {
            DataPager pgr = ListView1.FindControl("DataPager1") as DataPager;
            if (pgr != null && ListView1.Items.Count != pgr.TotalRowCount)
                pgr.SetPageProperties(0, pgr.MaximumRows, false);
        }

        void ActualizarListView()
        {
            NegocioArticulo neg = new NegocioArticulo();
            if(Session["cat"].ToString() == "0")
            {
                ListView1.DataSource = neg.getTablaArticulos((string)Session["consulta"]);
                ListView1.DataBind();
            }
            else
            {
                ListView1.DataSource = neg.getTablaArticulos((string)Session["consulta"] + " WHERE [Cod_Cat_A] = " + (string)Session["cat"]);
                ListView1.DataBind();
            }
        }

        protected void ListView1_PagePropertiesChanged(object sender, EventArgs e)
        {
            ActualizarListView();
            CambiarPagina();
        }

        protected void ImgBtnProducto_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "ComandoVerProducto")
            {
                Session["Seleccionado"] = e.CommandArgument;
                Response.Redirect("MostrarProducto.aspx");
            }
        }
    }
}