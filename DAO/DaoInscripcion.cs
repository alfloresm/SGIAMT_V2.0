using System;
using System.Collections.Generic;
using System.Configuration;
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
        SqlConnection _conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
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
        public int registrarInscripcionV(DtoInscripcion objdtoInscripcion)
        {
            SqlCommand command = new SqlCommand("SP_Registrar_Inscripcion_V", conexion);
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

            return objdtoInscripcion.PK_II_Cod;

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
        public DataSet desplegableConcursoNoRealizado()
        {
            SqlDataAdapter tipomol = new SqlDataAdapter("SP_Desplegable_Concursos_NR", conexion);
            tipomol.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet DS = new DataSet();
            tipomol.Fill(DS);
            return DS;
        }
        public DataTable ListarInscripcionesByConcurso(int id)
        {
            DataTable dtEntradas = null;
            conexion.Open();
            SqlCommand command = new SqlCommand("SP_Listar_Validar_Inscripcion", conexion);
            command.Parameters.AddWithValue("@cod", id);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            dtEntradas = new DataTable();
            daAdaptador.Fill(dtEntradas);
            conexion.Close();
            return dtEntradas;
        }
        public DataTable ListarInscripcionesByConcurso()
        {
            DataTable dtEntradas = null;
            conexion.Open();
            SqlCommand command = new SqlCommand("SP_Listar_Validar_Inscripcion_inicio", conexion);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            dtEntradas = new DataTable();
            daAdaptador.Fill(dtEntradas);
            conexion.Close();
            return dtEntradas;
        }
        public void ValidarInscripcion(int id, int estado)
        {
            SqlCommand command = new SqlCommand("SP_Validar_Inscripcion", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@id", id);
            command.Parameters.AddWithValue("@estado", estado);
            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();
        }
        public DataTable ListarInscripcionesBydni(string dni)
        {
            DataTable dtInscripciones = null;
            _conn.Open();
            SqlCommand command = new SqlCommand("SP_Listar_Mis_Inscripciones", _conn);
            command.Parameters.AddWithValue("@cod", dni);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            dtInscripciones = new DataTable();
            daAdaptador.Fill(dtInscripciones);
            _conn.Close();
            return dtInscripciones;
        }
        public DataTable ListarConcursosParticipadosBydni(string dni)
        {
            DataTable dtEntradas = null;
            conexion.Open();
            SqlCommand command = new SqlCommand("SP_Listar_Concurso_Participado", conexion);
            command.Parameters.AddWithValue("@cod", dni);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            dtEntradas = new DataTable();
            daAdaptador.Fill(dtEntradas);
            conexion.Close();
            return dtEntradas;
        }
    }
}
