using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;

namespace Dao
{
    public class DaoCategoria
    {
        SqlConexion Cn = new SqlConexion();

        public int InsertarCategoria(Categoria cat)
        {
            string consulta = $"INSERT INTO Categorias(NombreCat) Values ('{cat.Nombre_cat}')";
            return Cn.EjecutarTransaccion(consulta);
        }

        public DataTable getTablaCategorias(string j)
        {
            return Cn.ObtenerTablaxConsulta(j);
        }

        public int InsertarCategoria(String j)
        {
            return Cn.EjecutarTransaccion("EXEC sp_InsertarCategoria " + j);
        }

        public int EliminarCategoria(Categoria reg)
        {
            return Cn.EjecutarTransaccion("DELETE from Categorias WHERE Cod_Cat = " + reg.Id);
        }
    }
}
