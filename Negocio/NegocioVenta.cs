using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using Entidades;

namespace Negocio
{
    public class NegocioVenta
    {
        DaoVenta daoVenta = new DaoVenta();
        public bool CargarCompra(Usuario u,float total,Dictionary<int,int> dic,List<float> pu)
        {
            string DDMMYYYY = DateTime.Now.ToString("dd-MM-yyyy");
            string HHMMSS = DateTime.Now.ToString("HH-mm-ss");
            int retornoVenta = daoVenta.CargarCompra(u,total,DDMMYYYY,HHMMSS);
            if (retornoVenta > 0)
            {
                int num_V=daoVenta.UltimaCompra();
                DaoDetalleVenta daoDetalle = new DaoDetalleVenta();
                daoDetalle.CargarDetalleVenta(dic, num_V, pu);
                    return true;
            }
            return false;
        }
    }
}
