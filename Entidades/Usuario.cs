using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        private int dni_U;
        private string nombre_U;
        private string apellido_U;
        private string direccion_U;
        private string ciudad_U;
        private string provincia_U;
        private string email_U;
        private string contrasenia_U;
        private bool administrador_U;
        public Usuario()
        {
        }
        //gets y sets
        public int Dni_U { get => dni_U; set => dni_U = value; }
        public string Nombre_U { get => nombre_U; set => nombre_U = value; }
        public string Apellido_U { get => apellido_U; set => apellido_U = value; }
        public string Direccion_U { get => direccion_U; set => direccion_U = value; }
        public string Ciudad_U { get => ciudad_U; set => ciudad_U = value; }
        public string Provincia_U { get => provincia_U; set => provincia_U = value; }
        public string Email_U { get => email_U; set => email_U = value; }
        public bool Administrador_U { get => administrador_U; set => administrador_U = value; }
        public string Contrasenia_U { get => contrasenia_U; set => contrasenia_U = value; }
    }
}
