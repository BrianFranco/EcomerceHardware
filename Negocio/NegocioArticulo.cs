using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using Dao;

namespace Negocio
{
    public class NegocioArticulo
    {
        DaoArticulo dao = new DaoArticulo();
        public DataTable getTablaArticulos(string j)
        {
            return dao.getTablaArticulos(j);
        }
        public int AgregarArticulo(String j)
        {
            return dao.AgregarArticulo(j);
        }

        public int EliminarArticulo(Articulo reg)
        {
            return dao.EliminarArticulo(reg);
        }

        public bool ActualizarArticulo(string ID, Articulo art)
        {
            return dao.ActualizarArticulo(ID, art);
        }

        public DataTable GetArticulos()
        {
            return dao.GetArticulos();
        }
        public Articulo GetArticulosFiltroxID(string consulta)
        {
            DataTable dt = dao.GetArticulosFiltroxID(consulta);

            Articulo art = new Articulo();
            art.Cod_A = (int)dt.Rows[0]["Cod_A"];
            art.Nombre_A = dt.Rows[0]["Nombre_A"].ToString();
            art.Descripcion_A = dt.Rows[0]["Descripcion_A"].ToString();
            art.ImgUrl_A = dt.Rows[0]["Img_Url_A"].ToString();
            art.Pu_A = decimal.Parse(dt.Rows[0]["PU_A"].ToString());
            art.Stock = (int)dt.Rows[0]["Stock_A"];
            
            return art;
        }
        public DataTable GetArticulosFiltroxNombre(string consulta)
        {
            return dao.GetArticulosFiltroxNombre(consulta);
        }
        public DataTable GetArticulosCarrito(Dictionary<int,int> dic)
        {
            StringBuilder consulta = new StringBuilder("Cod_A=");
            int i=1;
            foreach (int key in dic.Keys)
            {
                consulta.Append(key);
                if (i++<dic.Count)
                {
                    consulta.Append(" OR Cod_A=");
                }
            }
            DataTable dt = dao.GetArticulos();
            dt.Columns.Add("Cantidad",typeof(int));
            DataRow[] dr = dt.Select(consulta.ToString());
            DataTable dt2 = dt.Clone();
            foreach (DataRow row in dr)
            {
                row["Cantidad"] = dic[int.Parse(row["Cod_A"].ToString())];
                dt2.ImportRow(row);
            }
            return dt2;
        }
        public DataTable GetArticulosFiltradosxNombreCategoria(string nombre,string categoria)
        {
            return dao.GetArticulosFiltroxNombreCategoria(nombre, categoria);
        }
        public DataTable GetBuscarProductoFiltros(string nombre,string categoria,string precio)
        {
            return dao.GetBuscarProductoFiltros(nombre,categoria,precio);
        }
    }
}
