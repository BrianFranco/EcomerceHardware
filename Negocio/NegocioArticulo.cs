﻿using System;
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
        public DataTable GetArticulosFiltro(string consulta)
        {
            return dao.GetArticulosFiltro(consulta);
        }
        public DataTable GetArticulosCarrito(string carrito)
        {
            string consulta = "Cod_A=" + carrito.Replace("-", " OR Cod_A=");
            DataTable dt = dao.GetArticulos();
            DataRow[] dr = dt.Select(consulta);
            DataTable dt2 = dt.Clone();
            foreach (DataRow row in dr)
            {
                dt2.ImportRow(row);
            }
            return dt2;
        }
    }
}
