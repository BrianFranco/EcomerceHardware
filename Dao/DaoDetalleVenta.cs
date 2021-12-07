using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dao
{
    public class DaoDetalleVenta
    {
        SqlConexion Cn = new SqlConexion();
        public void CargarDetalleVenta(Dictionary<int, int> dic,int num_V,List<float> pu)
        {
            SqlCommand cmd;
            int i=0;
            foreach (int key in dic.Keys)
            {
                //string consulta = $"INSERT INTO Detalle de Ventas(Num_V_DV,Cod_A_DV,Cant_DV,PU_DV) VALUES({num_V},{key},{dic[key]},{pu[i++]})";
                cmd = ParametrosDetalleCompra(num_V, key, dic[key], pu[i++]);
                Cn.EjecutarProcedimientoAlmacenado(cmd, "spCargarDetalleVenta");
            }
        }

        SqlCommand ParametrosDetalleCompra(int num_V, int cod_a, int cant, float pu)
        {
            SqlCommand cmd = new SqlCommand();
            SqlParameter parametros = new SqlParameter();

            parametros = cmd.Parameters.Add("@NUM_V_DV", SqlDbType.Int);
            parametros.Value = num_V;
            parametros = cmd.Parameters.Add("@COD_A_DV", SqlDbType.Int);
            parametros.Value = cod_a;
            parametros = cmd.Parameters.Add("@CANT_DV", SqlDbType.Int);
            parametros.Value = cant;
            parametros = cmd.Parameters.Add("@PU_DV", SqlDbType.Float);
            parametros.Value = pu;
            return cmd;
        }
    }
}
