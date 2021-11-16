using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using Entidades;

namespace Negocio
{
    public class NegocioCategoria
    {
        DaoCategoria dao = new DaoCategoria();
        public int InsertarCategoria(Categoria cat)
        {
            return dao.InsertarCategoria(cat);
        }
    }
}
