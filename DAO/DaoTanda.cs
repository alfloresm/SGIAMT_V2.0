using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DTO;

namespace DAO
{
    public class DaoTanda
    {
        SqlConnection conexion;

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
                conexion.Open();
                command.ExecuteNonQuery();
                conexion.Close();
            }
            catch (Exception)
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

        //agregado para listar tandas y marineras
        public DataTable listar_Tanda_marinera()
        {
            DataTable dtTanda = null;
            conexion.Open();
            SqlCommand command = new SqlCommand("SP_Listar_Tanda_Marinera", conexion);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            dtTanda = new DataTable();
            daAdaptador.Fill(dtTanda);
            conexion.Close();
            return dtTanda;
        }
    }
}
