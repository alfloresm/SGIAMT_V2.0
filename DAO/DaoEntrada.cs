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
    public class DaoEntrada
    {
        SqlConnection conexion;
        public DaoEntrada()
        {
            conexion = new SqlConnection(ConexionBD.CadenaConexion);
        }
        public DataSet desplegableConcursoNoRealizado()
        {
            SqlDataAdapter tipomol = new SqlDataAdapter("SP_Desplegable_Concursos_NR", conexion);
            tipomol.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet DS = new DataSet();
            tipomol.Fill(DS);
            return DS;
        }

        //desplegable fechas segun concurso seleccionado
        public DataSet desplegableFechasConcurso(int codcon)
        {
            DataSet dtFechasConcurso = null;
            conexion.Open();
            SqlCommand command = new SqlCommand("SP_Desplegable_Fechas_Concurso_NR", conexion);
            command.Parameters.AddWithValue("@cod_con", codcon);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            dtFechasConcurso = new DataSet();
            daAdaptador.Fill(dtFechasConcurso);
            conexion.Close();
            return dtFechasConcurso;

        }

        //registrar compra entrada
        public int RegistrarCompraEntrada(DtoEspectador objEspectador)
        {
            SqlCommand command = new SqlCommand("SP_Comprar_Entrada", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@dni", objEspectador.VES_Dni);
            command.Parameters.AddWithValue("@nombre", objEspectador.VES_NombreCompleto);
            command.Parameters.AddWithValue("@email", objEspectador.VES_Email);
            command.Parameters.AddWithValue("@fkIdCon", objEspectador.FK_IC_IdConcurso);
            command.Parameters.AddWithValue("@cantEntrada", objEspectador.IES_NumEntrada);
            command.Parameters.AddWithValue("@fecha", objEspectador.VES_TipoFecha);
            command.Parameters.Add("@NewId", SqlDbType.Int).Direction = ParameterDirection.Output;
            conexion.Open();
            command.ExecuteNonQuery();
            objEspectador.PK_VES_cod = Convert.ToInt32(command.Parameters["@NewId"].Value.ToString());
            conexion.Close();
            return objEspectador.PK_VES_cod;

        }

        //registrar venta entrada
        public string RegistrarVentaEntrada(DtoEspectador objEspectador)
        {
            SqlCommand command = new SqlCommand("SP_Vender_Entrada", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@dni", objEspectador.VES_Dni);
            command.Parameters.AddWithValue("@nombre", objEspectador.VES_NombreCompleto);
            command.Parameters.AddWithValue("@email", objEspectador.VES_Email);
            command.Parameters.AddWithValue("@fkIdCon", objEspectador.FK_IC_IdConcurso);
            command.Parameters.AddWithValue("@cantEntrada", objEspectador.IES_NumEntrada);
            command.Parameters.AddWithValue("@fecha", objEspectador.VES_TipoFecha);
            conexion.Open();
            command.ExecuteNonQuery();
            //objConcurso.PK_IC_IdConcurso = Convert.ToInt32(command.Parameters["@id"].Value.ToString());
            conexion.Close();
            return objEspectador.VES_Dni;

        }
        public DataTable ListarMisEntradas(string id)
        {
            DataTable dtEntradas = null;
            conexion.Open();
            SqlCommand command = new SqlCommand("SP_Listar_Mis_Entradas", conexion);
            command.Parameters.AddWithValue("@id", id);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            dtEntradas = new DataTable();
            daAdaptador.Fill(dtEntradas);
            conexion.Close();
            return dtEntradas;
        }
        public void RegistrarImgVoucherEntrada(byte[] bytes, int id)
        {
            SqlCommand command = new SqlCommand("SP_Registrar_Imagen_Entrada", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@id", id);
            command.Parameters.AddWithValue("@imagen", bytes);
            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();
        }

        public DataTable ListarEntradasByConcurso(int id)
        {
            DataTable dtEntradas = null;
            conexion.Open();
            SqlCommand command = new SqlCommand("SP_Listar_Validar_Entradas", conexion);
            command.Parameters.AddWithValue("@id", id);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            dtEntradas = new DataTable();
            daAdaptador.Fill(dtEntradas);
            conexion.Close();
            return dtEntradas;
        }
        public DataTable ListarEntradasByConcurso()
        {
            DataTable dtEntradas = null;
            conexion.Open();
            SqlCommand command = new SqlCommand("SP_Listar_Validar_Entradas_inicio", conexion);
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            command.CommandType = CommandType.StoredProcedure;
            dtEntradas = new DataTable();
            daAdaptador.Fill(dtEntradas);
            conexion.Close();
            return dtEntradas;
        }
        public void ValidarEntrada(int id,string op,string desc)
        {
            SqlCommand command = new SqlCommand("SP_Validar_Entrada", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@id", id);
            command.Parameters.AddWithValue("@op", op);
            command.Parameters.AddWithValue("@descripcion", desc);
            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();
        }
        //Disponibilidad entradas
        public int EntradasDisponibles(string fecha,int concurso)
        {
            SqlCommand command = new SqlCommand("SP_Obtener_Disponibilidad_Entradas", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@fecha", fecha);
            command.Parameters.AddWithValue("@concurso", concurso);
            command.Parameters.Add("@result", SqlDbType.Int).Direction = ParameterDirection.Output;
            conexion.Open();
            command.ExecuteNonQuery();
            int result;
            result = Convert.ToInt32(command.Parameters["@result"].Value.ToString());
            conexion.Close();
            return result;
        }
    }
}
