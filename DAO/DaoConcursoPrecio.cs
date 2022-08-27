using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using DTO;

namespace DAO
{
    public class DaoConcursoPrecio
    {
        SqlConnection conexion;
        public DaoConcursoPrecio()
        {
            conexion = new SqlConnection(ConexionBD.CadenaConexion);
        }
        public DataTable ListarPrecioByConcurso(int id)
        {
            DataTable dtconcursoPrecio = null;
            conexion.Open();
            SqlCommand command = new SqlCommand("SP_Listar_Concurso_Precio_By_Concurso", conexion);
            command.Parameters.AddWithValue("@idConcurso", id);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            dtconcursoPrecio = new DataTable();
            daAdaptador.Fill(dtconcursoPrecio);
            conexion.Close();
            return dtconcursoPrecio;
        }

        public void RegistrarConcursoPrecio(DtoConcursoPrecio objConcursoPrecio)
        {
            SqlCommand command = new SqlCommand("SP_Registrar_Concurso_Precio", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@PK_ICP_IdConcurso", objConcursoPrecio.PK_ICP_IdConcurso);
            command.Parameters.AddWithValue("@Pk_ICP_CodPrecio", objConcursoPrecio.PK_ICP_CodPrecio);
            command.Parameters.AddWithValue("@Monto", objConcursoPrecio.DCP_Monto);
            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();
        }

        public DataSet DesplegablePrecio()
        {
            SqlDataAdapter tipoPre = new SqlDataAdapter("SP_Desplegable_Precio", conexion);
            tipoPre.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet DS = new DataSet();
            tipoPre.Fill(DS);
            return DS;
        }

        public double ObtenerConcursoPrecio(int codConcurso, string modalidad)
        {
            try
            {
                SqlCommand command = new SqlCommand("SP_Obtener_Precio", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@CodConcurso", codConcurso);
                command.Parameters.AddWithValue("@Modalidad", modalidad);
                command.Parameters.Add("@PRECIO", SqlDbType.Decimal).Direction = ParameterDirection.Output;
                conexion.Open();
                command.ExecuteNonQuery();
                double precio;
                if (command.Parameters["@PRECIO"].Value != null)
                {
                    precio = Convert.ToDouble(command.Parameters["@PRECIO"].Value.ToString());
                }
                else
                {
                    precio = 0.0;
                }

                conexion.Close();
                return precio;
            }
            catch (Exception ex)
            {

                throw;
            }

        }
    }
}
