using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
    }
}
