using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;

namespace DAO
{
    public class DaoInscripcion
    {
        SqlConnection conexion;
        public DaoInscripcion()
        {
            conexion = new SqlConnection(ConexionBD.CadenaConexion);
        }
        public void registrarInscripcionP(DtoInscripcion objdtoInscripcion)
        {
            try
            {

                SqlCommand command = new SqlCommand("SP_Registrar_Inscripcion", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@monto", objdtoInscripcion.DI_Monto);
                command.Parameters.AddWithValue("@id", objdtoInscripcion.FK_IUM_CodUm);

                conexion.Open();
                command.ExecuteNonQuery();
                conexion.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataTable ListarModalidadesbyconcurso(int id)
        {
            DataTable dtconcurso = null;
            conexion.Open();
            SqlCommand command = new SqlCommand("SP_Listar_Modalidad_by_Concurso", conexion);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@id", id);
            dtconcurso = new DataTable();
            daAdaptador.Fill(dtconcurso);
            conexion.Close();
            return dtconcurso;
        }
        public void registrarInscripcionV(DtoInscripcion objdtoInscripcion)
        {
            SqlCommand command = new SqlCommand("SP_Registrar_Inscripcion", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@monto", objdtoInscripcion.DI_Monto);
            command.Parameters.AddWithValue("@id", objdtoInscripcion.FK_IUM_CodUm);
            command.Parameters.Add("@NewId", SqlDbType.Int).Direction = ParameterDirection.Output;

            conexion.Open();

            using (SqlDataReader dr = command.ExecuteReader())
            {
                objdtoInscripcion.PK_II_Cod = Convert.ToInt32(command.Parameters["@NewId"].Value);
            }
            conexion.Close();

        }
        public void RegistrarImgVoucherInscripcion(byte[] bytes, int id)
        {
            SqlCommand command = new SqlCommand("SP_Registrar_Imagen_Inscripcion", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@id", id);
            command.Parameters.AddWithValue("@imagen", bytes);
            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();
        }
    }
}
