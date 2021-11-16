using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;

namespace Dao
{
    public class DaoUsuario
    {
        SqlConexion Cn = new SqlConexion();
       public Usuario LoginUsuario(Usuario us)
        {
            Usuario usuario = new Usuario();
            String consulta = $"select * from Usuarios where Dni_U = {us.Dni_U} and Contraseña_U = '{us.Contrasenia_U}' ;";
            try
            {
                DataRow dr = Cn.ObtenerTablaxConsulta(consulta).Rows[0];
                usuario.Administrador_U = (bool)dr["Administrador_U"];
                usuario.Apellido_U = dr["Apellido_U"].ToString();
                usuario.Ciudad_U = dr["Ciudad_U"].ToString();
                usuario.Contrasenia_U = dr["Contraseña_U"].ToString();
                usuario.Direccion_U = dr["Direccion_U"].ToString();
                usuario.Dni_U = (int)dr["Dni_U"];
                usuario.Email_U = dr["Email_U"].ToString();
                usuario.Nombre_U = dr["Nombre_U"].ToString();
                usuario.Provincia_U = dr["Provincia_U"].ToString();

                return usuario;
            }
            catch (Exception)
            {
                return null;
            }
        }
        public bool RegistroUsuario(Usuario us)
        {

            if (Cn.EjecutarTransaccion("Insert into Usuarios (Dni_U,Nombre_U,Contraseña_U) Values (N'" + us.Dni_U + "',N'" + us.Nombre_U.Trim() + "',N'" + us.Contrasenia_U.Trim() + "')") == 1) return true;
            else return false;

        }
        public bool LoginUsuarioAdmin(String admin)
        {
            if (Cn.ObtenerConsulta("SELECT Administrador_U FROM Usuarios WHERE Nombre_U = '" + admin + "'") == "1") {
                return true;
            }
            else return false;
        }
    }
}
