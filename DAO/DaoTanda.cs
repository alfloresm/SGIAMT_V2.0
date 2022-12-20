using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DTO;
using System.Configuration;

namespace DAO
{
    public class DaoTanda
    {
        SqlConnection conexion;
        SqlConnection _conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);

        public DaoTanda()
        {
            conexion = new SqlConnection(ConexionBD.CadenaConexion);
        }
        public DataTable listar_Tanda_NC()
        {
            DataTable dtTanda = null;
            conexion.Open();
            SqlCommand command = new SqlCommand("SP_Listar_Tanda_NC", conexion);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            dtTanda = new DataTable();
            daAdaptador.Fill(dtTanda);
            conexion.Close();
            return dtTanda;
        }
        
        public void registrarTanda(DtoTanda dtoTanda)
        {
            try
            {
                SqlCommand command = new SqlCommand("SP_Registrar_Tanda", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@CodConcurso", dtoTanda.IT_CodigoConcurso);
                command.Parameters.AddWithValue("@tipotanda", dtoTanda.VT_TipoTanda);
                command.Parameters.AddWithValue("@cat", dtoTanda.VT_Descripcion);
                command.Parameters.Add("@NewId", SqlDbType.Int).Direction = ParameterDirection.Output;
                conexion.Open();

                using (SqlDataReader dr = command.ExecuteReader())
                {
                    dtoTanda.PK_IT_CodTan = Convert.ToInt32(command.Parameters["@NewId"].Value);
                }
                conexion.Close();
            }
            catch (Exception)
            {

                throw;
            }

        }
        public void registrarUMT(DtoUsuarioModalidadTanda objUMT)
        {
            try
            {
                SqlCommand command = new SqlCommand("SP_Asignar_Tanda", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ID", objUMT.PK_IUMT_CodUsuModTan);
                command.Parameters.AddWithValue("@cod", objUMT.FK_IUM_CodUM);
                command.Parameters.AddWithValue("@idT", objUMT.FK_IT_CodTan);
                command.Parameters.AddWithValue("@pista", objUMT.IUMT_Pista);
                command.Parameters.AddWithValue("@Bloque", objUMT.VUMT_Bloque);
                conexion.Open();
                command.ExecuteNonQuery();
                conexion.Close();
            }
            catch (Exception)
            {

                throw;
            }
        }
        public bool SelectTanda(DtoTanda objTan)//encuentra tanda
        {
            string Select = "SELECT * from T_Tanda where PK_IT_CodTan =" + objTan.PK_IT_CodTan;
            SqlCommand unComando = new SqlCommand(Select, conexion);
            conexion.Open();
            SqlDataReader reader = unComando.ExecuteReader();
            bool hayRegistros = reader.Read();
            if (hayRegistros)
            {

                objTan.PK_IT_CodTan = Convert.ToInt32(reader[0].ToString());
            }

            conexion.Close();
            return hayRegistros;
        }
        public void ObtenerTanda(DtoTanda objTanda)
        {
            SqlCommand command = new SqlCommand("SP_Buscar_Tanda", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@id", objTanda.PK_IT_CodTan);
            DataSet ds = new DataSet();
            conexion.Open();
            SqlDataAdapter moldura = new SqlDataAdapter(command);
            moldura.Fill(ds);
            moldura.Dispose();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                objTanda.PK_IT_CodTan = Convert.ToInt32(reader[0].ToString());
                objTanda.VT_TipoTanda = Convert.ToInt32(reader[4].ToString());
                objTanda.VT_Estado = reader[5].ToString();
                objTanda.VT_Descripcion = reader[6].ToString();

            }
            conexion.Close();
            conexion.Dispose();
        }
        public DataTable ListarParticipantesXtanda(DtoUsuarioModalidadTanda objUMT)
        {

            DataTable dtParticipantes = null;
            conexion.Open();
            SqlCommand command = new SqlCommand("SP_Obtener_Participante_x_Tanda", conexion);
            command.Parameters.AddWithValue("@idT", objUMT.FK_IT_CodTan);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            dtParticipantes = new DataTable();
            daAdaptador.Fill(dtParticipantes);
            conexion.Close();
            return dtParticipantes;
        }
        public DataTable ListarParticipantesXtanda_Seriado(int codTanda,string bloque)
        {

            DataTable dtParticipantes = null;
            conexion.Open();
            SqlCommand command = new SqlCommand("SP_Obtener_Participante_x_Tanda_Seriado", conexion);
            command.Parameters.AddWithValue("@idT", codTanda);
            command.Parameters.AddWithValue("@bloque", bloque);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            dtParticipantes = new DataTable();
            daAdaptador.Fill(dtParticipantes);
            conexion.Close();
            return dtParticipantes;
        }
        public void actualizar_estado_umt(DtoUsuarioModalidadTanda objUMT)
        {
            try
            {
                SqlCommand command = new SqlCommand("SP_Actualizar_Estado_UMT", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@id", objUMT.PK_IUMT_CodUsuModTan);
                conexion.Open();
                command.ExecuteNonQuery();
                conexion.Close();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        //agregado para actualizar el registro de tanda y marinera
        public void updateTandaMar(DtoTanda dtotanda)
        {
            try
            {
                SqlCommand command = new SqlCommand("SP_Update_Tanda", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@marinera", dtotanda.FK_IM_CodMar);
                conexion.Open();

                using (SqlDataReader dr = command.ExecuteReader())
                {
                    dtotanda.PK_IT_CodTan = Convert.ToInt32(command.Parameters["@NewId"].Value);
                }
                conexion.Close();
            }
            catch (Exception)
            {
                throw;
            }
        }

        //agregado para obtener nombre de marinera
       
        public string ObtenerMarinera(int codmar)
        {
            try
            {
                string valor_retornado = "";
                SqlCommand cmd = new SqlCommand("select m.VM_Nombre from T_Marinera m inner join T_Tanda t on m.PK_IM_CodMar = t.FK_IM_CodMar where m.PK_IM_CodMar = " + codmar, conexion);
                Console.WriteLine(cmd);
                conexion.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    valor_retornado = reader[0].ToString();
                }
                conexion.Close();
                return valor_retornado;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void ObtenerTandaP_SG(DtoTanda objTanda)
        {

            SqlCommand command = new SqlCommand("SP_Buscar_Tanda_P_SG", _conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@id", objTanda.PK_IT_CodTan);
            DataSet ds = new DataSet();
            _conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(command);
            da.Fill(ds);
            da.Dispose();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                objTanda.PK_IT_CodTan = Convert.ToInt32(reader[0].ToString());
                objTanda.VT_TipoTanda = Convert.ToInt32(reader[1].ToString());
                objTanda.VT_Estado = reader[2].ToString();
                objTanda.VT_Descripcion = reader[3].ToString();
                objTanda.IT_CodigoConcurso= Convert.ToInt32(reader[4].ToString());
            }
            _conn.Close();
            _conn.Dispose();
        }
        public void ObtenerTandaP(DtoTanda objTanda)
        {
            
            SqlCommand command = new SqlCommand("SP_Buscar_Tanda_P", _conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@id", objTanda.PK_IT_CodTan);
            DataSet ds = new DataSet();
            _conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(command);
            da.Fill(ds);
            da.Dispose();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                objTanda.PK_IT_CodTan = Convert.ToInt32(reader[0].ToString());
                if (!string.IsNullOrEmpty(reader[1].ToString()))
                {
                    objTanda.IT_GanadorA = Convert.ToInt32(reader[1].ToString());
                }
                if (!string.IsNullOrEmpty(reader[2].ToString()))
                {
                    objTanda.IT_GanadorB = Convert.ToInt32(reader[2].ToString());
                }
                if (!string.IsNullOrEmpty(reader[3].ToString()))
                {
                    objTanda.IT_GanadorC = Convert.ToInt32(reader[3].ToString());
                }

                objTanda.VT_TipoTanda = Convert.ToInt32(reader[4].ToString());
                objTanda.VT_Estado = reader[5].ToString();
                objTanda.VT_Descripcion = reader[6].ToString();

            }
            _conn.Close();
            _conn.Dispose();
        }

        public String ObtenerModalidad(int id)
        {
            try
            {
                
                string valor_retornado = "";
                SqlCommand cmd = new SqlCommand("select VM_NombreMod from T_Modalidad_Concurso where PK_IM_CodigoMod = " + id, _conn);
                Console.WriteLine(cmd);
                _conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    valor_retornado = reader[0].ToString();
                }
                _conn.Close();
                _conn.Close();
                return valor_retornado;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void actualizar_estadoT(DtoTanda objT)
        {
            try
            {
                SqlCommand command = new SqlCommand("SP_Actualiza_Estado_Tanda", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@id", objT.PK_IT_CodTan);
                conexion.Open();
                command.ExecuteNonQuery();
                conexion.Close();
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public int sumaPuntaje(DtoUsuarioModalidadTanda objUMT)
        {
            try
            {
                SqlCommand command = new SqlCommand("SP_SumarPuntaje_UMT", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@id", objUMT.PK_IUMT_CodUsuModTan);
                DataSet ds = new DataSet();
                conexion.Open();
                SqlDataAdapter moldura = new SqlDataAdapter(command);
                moldura.Fill(ds);
                moldura.Dispose();

                SqlDataReader reader = command.ExecuteReader();
                int suma = 0;
                while (reader.Read())
                {
                    suma = Convert.ToInt32(reader[0].ToString());
                }
                conexion.Close();
                return suma;
            }
            catch (Exception)
            {

                throw;
            }

        }
        public void actualizar_PuntajeT_umt(DtoUsuarioModalidadTanda objUMT)
        {
            try
            {
                SqlCommand command = new SqlCommand("SP_Actualiza_PuntajeT", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@id", objUMT.PK_IUMT_CodUsuModTan);
                command.Parameters.AddWithValue("@suma", objUMT.IUMT_PuntajeTotal);
                conexion.Open();
                command.ExecuteNonQuery();
                conexion.Close();
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public void actualizar_ganadorT(DtoTanda objT)
        {
            try
            {
                SqlCommand command = new SqlCommand("SP_Actualiza_Ganador", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@id", objT.PK_IT_CodTan);
                conexion.Open();
                command.ExecuteNonQuery();
                conexion.Close();
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public DataTable ListarParticipantesXtanda_Puntaje(int codTanda)
        {

            DataTable dtParticipantes = null;
            conexion.Open();
            SqlCommand command = new SqlCommand("SP_Obtener_Tanda_orderBy_Bloque", conexion);
            command.Parameters.AddWithValue("@id", codTanda);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            dtParticipantes = new DataTable();
            daAdaptador.Fill(dtParticipantes);
            conexion.Close();
            return dtParticipantes;
        }
        public DataTable puntajePorParticipante(string codtan)
        {
            try
            {
                DataTable dtParticipantes = null;
                conexion.Open();
                SqlCommand command = new SqlCommand("SP_Obtener_Puntajes_por_Participante", conexion);
                command.Parameters.AddWithValue("@id", codtan);
                SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
                command.CommandType = CommandType.StoredProcedure;
                dtParticipantes = new DataTable();
                daAdaptador.Fill(dtParticipantes);
                conexion.Close();
                return dtParticipantes;
            }
            catch (Exception)
            {

                throw;
            }

        }
        //Listar Marinera
        public DataTable listar_Tanda_EM()
        {
            DataTable dtTanda = null;
            conexion.Open();
            SqlCommand command = new SqlCommand("SP_Listar_Tanda_Mar", conexion);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            dtTanda = new DataTable();
            daAdaptador.Fill(dtTanda);
            conexion.Close();
            return dtTanda;
        }
        public DataTable listar_Tanda_EM_By_Concurso(int cod)
        {
            DataTable dtTanda = null;
            conexion.Open();
            SqlCommand command = new SqlCommand("SP_Listar_Tanda_Mar_by_concurso", conexion);
            command.Parameters.AddWithValue("@codCon", cod);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            dtTanda = new DataTable();
            daAdaptador.Fill(dtTanda);
            conexion.Close();
            return dtTanda;
        }
    }
}
