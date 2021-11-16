using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Categoria
    {
        private int id;
        private string nombre_cat;

        public Categoria()
        {
        }

        ///sets y gets
        public int Id { get => id; set => id = value; }
        public string Nombre_cat { get => nombre_cat; set => nombre_cat = value; }
    }
}
