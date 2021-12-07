using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Dao
{
    public class SqlConexion
    {
        private string ruta = "Data Source=localhost\\sqlexpress;Initial Catalog=BDGrupo4;Integrated Security=True";
        public SqlConexion(string ruta_aux)
        {
            ruta = ruta_aux;
        }
        public SqlConexion() { }


        public DataTable ObtenerTablaxConsulta(string consulta)
        {
            DataTable dt = new DataTable();

            SqlConnection cn = new SqlConnection(ruta);
            cn.Open();
            SqlDataAdapter adp = new SqlDataAdapter(consulta, cn);
            adp.Fill(dt);
            cn.Close();

            return dt;
        }

        public string ObtenerConsulta(string consulta)
        {
            string aux;
            using (SqlConnection cn = new SqlConnection(ruta))
            {
                SqlCommand comando = new SqlCommand(consulta, cn);
                cn.Open();
                aux = (string)comando.ExecuteScalar();
                cn.Close();
            }

            return aux;
        }

        public int EjecutarTransaccion(string consulta)
        {
            SqlConnection cn = new SqlConnection(ruta);
            cn.Open();
            SqlCommand comando = new SqlCommand(consulta, cn);
            int filasAfectadas = comando.ExecuteNonQuery();
            cn.Close();

            return filasAfectadas;
        }

        public SqlDataReader CargarTabla(string consulta)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ruta;
            con.Open();
            SqlCommand cmd = new SqlCommand(consulta, con);
            SqlDataReader dr = cmd.ExecuteReader();
            con.Close();

            return dr;
        }

        public int EjecutarProcedimientoAlmacenado(SqlCommand cmd, string procedimientoAlmacenado)
        {
            int filas = 0;
            SqlConnection Cn = new SqlConnection(ruta);
            try
            {
                Cn.Open();
                cmd.Connection = Cn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = procedimientoAlmacenado;
                filas = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Cn.Close();
            }

            return filas;
        }
    }
}
