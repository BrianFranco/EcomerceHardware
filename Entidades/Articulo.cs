using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Articulo
    {
        private int cod_A;
        private Categoria categoria_A;
        private string nombre_A;
        private string descripcion_A;
        private string pu_A;
        private int stock;
        private string imgurl_A;

        public Articulo()
        {
        }
        //gets y sets
        public int Cod_A { get => cod_A; set => cod_A = value; }
        public Categoria Categoria_A { get => categoria_A; set => categoria_A = value; }
        public string Nombre_A { get => nombre_A; set => nombre_A = value; }
        public string Descripcion_A { get => descripcion_A; set => descripcion_A = value; }
        public string Pu_A { get => pu_A; set => pu_A = value; }
        public int Stock { get => stock; set => stock = value; }
        public string ImgUrl_A { get => imgurl_A; set => imgurl_A = value; }
    }
}
