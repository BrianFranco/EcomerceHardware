using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Categoria
    {
        private int cod_cat;
        private string nombre_cat;

        public Categoria()
        {
        }

        ///sets y gets
        public int Cod_Cat { get => cod_cat; set => cod_cat = value; }
        public string Nombre_Cat { get => nombre_cat; set => nombre_cat = value; }
    }
}
