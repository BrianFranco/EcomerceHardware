using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Venta
    {
        private int num_V;
        private Fecha fecha_V;
        private Usuario dni_Usu_V;
        private string telefono_V;
        private string direccion_V;
        private string horario_V;
        private string contacto_V;
        private decimal total_V;

        public Venta()
        {

        }

        public int Num_V { get => num_V; set => num_V = value; }
        public Fecha Fecha_V { get => fecha_V; set => fecha_V = value; }
        public Usuario Dni_Usu_V { get => dni_Usu_V; set => dni_Usu_V = value; }
        public string Telefono_V { get => telefono_V; set => telefono_V = value; }
        public string Direccion_V { get => direccion_V; set => direccion_V = value; }
        public string Horario_V { get => horario_V; set => horario_V = value; }
        public string Contacto_V { get => contacto_V; set => contacto_V = value; }
        public decimal Total_V { get => total_V; set => total_V = value; }
    }
}
