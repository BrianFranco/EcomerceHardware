using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Fecha
    {
        private int dia;
        private int mes;
        private int anio;

        public Fecha()
        {
            Dia = 0;
            Mes = 0;
            Anio = 0;
        }

        public int Dia { get => dia; set => dia = value; }
        public int Mes { get => mes; set => mes = value; }
        public int Anio { get => anio; set => anio = value; }
    }
}
