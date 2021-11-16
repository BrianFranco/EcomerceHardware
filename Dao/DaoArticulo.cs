﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;

namespace Dao
{
    public class DaoArticulo
    {
        SqlConexion Cn = new SqlConexion();
        public DataTable getTablaArticulos(string j)
        {
            return Cn.ObtenerTablaxConsulta(j);
        }
        public int AgregarArticulo(String j)
        {
            return Cn.EjecutarTransaccion(j);
        }

        public int EliminarArticulo(Articulo reg)
        {
            return Cn.EjecutarTransaccion("DELETE from Articulos WHERE Cod_A = " + reg.Cod_A);
        }

        public bool ActualizarArticulo(string ID, Articulo art)
        {
            try
            {
                Cn.EjecutarTransaccion("UPDATE Articulos SET Nombre_A = N'"+art.Nombre_A
                                        +"', Descripcion_A = N'"+art.Descripcion_A
                                        +"', PU_A = "+art.Pu_A+", Stock_A = "+ art.Stock
                                        +", Img_Url_A = N'"+art.ImgUrl_A+"' WHERE Cod_A = " + ID+";");
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public DataTable GetArticulosFiltro(string filtro)
        {
            string consulta = $"select * from Articulos where Cod_A = {int.Parse(filtro)}";
            return Cn.ObtenerTablaxConsulta(consulta);
        }
        public DataTable GetArticulos()
        {
            string consulta = "select * from Articulos";
            return Cn.ObtenerTablaxConsulta(consulta);
        }
    }
}