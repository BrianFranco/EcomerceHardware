using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class DetalleVenta
    {
        private Venta num_V_DV;
        private Articulo cod_A_DV;
        private int cant_DV;
        private decimal pu_DV;

        public DetalleVenta()
        {

        }

        public Venta Num_V_DV { get => num_V_DV; set => num_V_DV = value; }
        public Articulo Cod_A_DV { get => cod_A_DV; set => cod_A_DV = value; }
        public int Cant_DV { get => cant_DV; set => cant_DV = value; }
        public decimal Pu_DV { get => pu_DV; set => pu_DV = value; }
    }
}
