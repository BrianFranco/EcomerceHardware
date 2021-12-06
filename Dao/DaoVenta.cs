using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Dao
{
    public class DaoVenta
    {
        SqlConexion Cn = new SqlConexion();
        public int CargarCompra(Usuario u,float total,string DDMMYYYY,string HHMMSS)
        {
            SqlCommand cmd = ParametrosCompra(u,total,DDMMYYYY,HHMMSS);
            return Cn.EjecutarProcedimientoAlmacenado(cmd, "spCargarCompra");
        }
        public int UltimaCompra()
        {
            DataRow dr = Cn.ObtenerTablaxConsulta("SELECT MAX(Num_V) FROM Ventas").Rows[0];
            return (int)dr[0];
        }

        SqlCommand ParametrosCompra(Usuario u, float total, string DDMMYYYY, string HHMMSS)
        {
            SqlCommand cmd = new SqlCommand();
            SqlParameter parametros = new SqlParameter();

            parametros = cmd.Parameters.Add("@FECHA_V", SqlDbType.VarChar);
            parametros.Value = DDMMYYYY;
            parametros = cmd.Parameters.Add("@DNI_USU_V", SqlDbType.Int);
            parametros.Value = u.Dni_U;
            parametros = cmd.Parameters.Add("@DIRECCION_V", SqlDbType.VarChar);
            parametros.Value = u.Direccion_U;
            parametros = cmd.Parameters.Add("@HORARIO_V", SqlDbType.VarChar);
            parametros.Value = HHMMSS;
            parametros = cmd.Parameters.Add("@TOTAL_V", SqlDbType.Float);
            parametros.Value = total;
            return cmd;
        }
    }
}
