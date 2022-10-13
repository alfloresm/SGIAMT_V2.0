using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using DTO;
using System.Configuration;

namespace DAO
{
    public class DaoConcurso
    {
        SqlConnection conexion;
        SqlConnection _conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
        public DaoConcurso()
        {
            conexion = new SqlConnection(ConexionBD.CadenaConexion);
        }
        public DataTable ListarConcursos()
        {
            DataTable dtconcurso = null;
            conexion.Open();
            SqlCommand command = new SqlCommand("SP_Listar_Concursos", conexion);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            dtconcurso = new DataTable();
            daAdaptador.Fill(dtconcurso);
            conexion.Close();
            return dtconcurso;
        }
        public int RegistrarConcurso(DtoConcurso objConcurso)
        {

            SqlCommand command = new SqlCommand("SP_Registrar_Concurso", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@nombre", objConcurso.VC_NombreCon);
            command.Parameters.AddWithValue("@direccion", objConcurso.VC_LugarCon);
            command.Parameters.AddWithValue("@fechaI", objConcurso.DTC_FechaI);
            command.Parameters.AddWithValue("@fechaF", objConcurso.DTC_FechaF);
            command.Parameters.AddWithValue("@cap", objConcurso.IC_Capacidad1);
            command.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output;
            conexion.Open();
            command.ExecuteNonQuery();
            objConcurso.PK_IC_IdConcurso = Convert.ToInt32(command.Parameters["@id"].Value.ToString());
            conexion.Close();
            return objConcurso.PK_IC_IdConcurso;
            
        }
        public void ActualizarConcurso(DtoConcurso objConcurso)
        {

            SqlCommand command = new SqlCommand("SP_Actualizar_Concurso", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@id", objConcurso.PK_IC_IdConcurso);
            command.Parameters.AddWithValue("@nombre", objConcurso.VC_NombreCon);
            command.Parameters.AddWithValue("@direccion", objConcurso.VC_LugarCon);
            command.Parameters.AddWithValue("@fechaI", objConcurso.DTC_FechaI);
            command.Parameters.AddWithValue("@fechaF", objConcurso.DTC_FechaF);
            command.Parameters.AddWithValue("@cap", objConcurso.IC_Capacidad1);
            command.Parameters.AddWithValue("@est", objConcurso.VC_Estado);
            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();
        }
        public void ObtenerConcurso(DtoConcurso objConcurso)
        {
            SqlCommand command = new SqlCommand("SP_Obtener_Concurso", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@id", objConcurso.PK_IC_IdConcurso);
            DataSet ds = new DataSet();
            conexion.Open();
            SqlDataAdapter moldura = new SqlDataAdapter(command);
            moldura.Fill(ds);
            moldura.Dispose();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                objConcurso.PK_IC_IdConcurso = int.Parse(reader[0].ToString());
                objConcurso.VC_NombreCon = reader[1].ToString();
                objConcurso.VC_LugarCon = reader[2].ToString();
                objConcurso.DTC_FechaI = Convert.ToDateTime(reader[3].ToString());
                objConcurso.DTC_FechaF = Convert.ToDateTime(reader[4].ToString());
                objConcurso.IC_Capacidad1 = Convert.ToInt32(reader[5].ToString());
                objConcurso.VC_Estado = reader[6].ToString();
            }
            conexion.Close();
            conexion.Dispose();
        }
        public DataSet desplegableConcurso()
        {
            SqlDataAdapter tipomol = new SqlDataAdapter("SP_Desplegable_Concurso", conexion);
            tipomol.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet DS = new DataSet();
            tipomol.Fill(DS);
            return DS;
        }
        public DataSet desplegableModalidades()
        {
            SqlDataAdapter tipomol = new SqlDataAdapter("SP_Desplegable_Modalidad", conexion);
            tipomol.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet DS = new DataSet();
            tipomol.Fill(DS);
            return DS;
        }
        public DataSet desplegableConcursoEnProceso()
        {
            SqlDataAdapter tipomol = new SqlDataAdapter("SP_Desplegable_Concursos_En_Proceso", conexion);
            tipomol.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet DS = new DataSet();
            tipomol.Fill(DS);
            return DS;
        }
        public void ActualizarEstadoConcursoEnProceso(int id,string operacion)
        {

            SqlCommand command = new SqlCommand("SP_Actualizar_Estado_Concurso", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@id", id);
            command.Parameters.AddWithValue("@operacion", operacion);
            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();
        }
        public void ObtenerDatosConcurso(DtoConcurso objConcurso)
        {
            SqlCommand command = new SqlCommand("SP_Obtener_Datos_Concurso", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@id", objConcurso.PK_IC_IdConcurso);
            DataSet ds = new DataSet();
            conexion.Open();
            SqlDataAdapter moldura = new SqlDataAdapter(command);
            moldura.Fill(ds);
            moldura.Dispose();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                objConcurso.PK_IC_IdConcurso = int.Parse(reader[0].ToString());
                objConcurso.VC_NombreCon = reader[1].ToString();
                objConcurso.VC_LugarCon = reader[2].ToString();
                objConcurso.DTC_FechaI = Convert.ToDateTime(reader[3].ToString());
                objConcurso.DTC_FechaF = Convert.ToDateTime(reader[4].ToString());
                objConcurso.IC_Capacidad1 = Convert.ToInt32(reader[5].ToString());
                objConcurso.IC_Capacidad2 = Convert.ToInt32(reader[6].ToString());
                objConcurso.precio_entrada = Convert.ToDouble(reader[7].ToString());
            }
            conexion.Close();
            conexion.Dispose();
        }
        public Boolean existePrecioEntrada(int id)
        {
            
            SqlCommand command = new SqlCommand("SP_Obtener_Datos_Concurso", _conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@id", id);
            _conn.Open();
            SqlDataReader reader = command.ExecuteReader();
            bool hayRegistros = reader.Read();
            
            _conn.Close();
            return hayRegistros;
        }
    }
}
