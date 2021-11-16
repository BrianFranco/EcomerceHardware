using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;

namespace Negocio
{
    public class NegocioUsuario
    {
        public Usuario LoginUsuario(Usuario us)
        {
            DaoUsuario dao = new DaoUsuario();
            return dao.LoginUsuario(us);
        }

        public bool LoginUsuarioAdmin(String admin)
        {
            DaoUsuario dao = new DaoUsuario();
            return dao.LoginUsuarioAdmin(admin);
        }

        public bool RegistroUsuario(String nom, String pass, int dni)
        {
            DaoUsuario dao = new DaoUsuario();
            Usuario us = new Usuario();
            us.Nombre_U = nom;
            us.Contrasenia_U = pass;
            us.Dni_U = dni;
            if (dao.RegistroUsuario(us))
            {
                return true;
            }
            else
            {
                return false;
            }


        }
    }

    
}
