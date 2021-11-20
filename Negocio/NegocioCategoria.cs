using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Dao;
using Entidades;

namespace Negocio
{
    public class NegocioCategoria
    {
        DaoCategoria dao = new DaoCategoria();
        //public int InsertarCategoria(Categoria cat)
        //{
        //    return dao.InsertarCategoria(cat);
        //}
        public DataTable getTablaCategorias(String j)
        {
            return dao.getTablaCategorias(j);
        }

        public int InsertarCategoria(String j)
        {
            return dao.InsertarCategoria(j);
        }

        public int EliminarCategoria(Categoria reg)
        {
            return dao.EliminarCategoria(reg);
        }

        public int CategoriaExistente(String j)
        {
            DataTable DT = new DataTable();
            DT = dao.getTablaCategorias("SELECT * FROM Categorias");
            foreach (DataRow fila in DT.Rows)
            {
                if (fila[DT.Columns[1]].ToString() == j)
                {
                    return 1;
                }
            }
            return 0;
        }
    }
}
