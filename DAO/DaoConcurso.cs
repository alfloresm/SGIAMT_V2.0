﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using DTO;


namespace DAO
{
    public class DaoConcurso
    {
        SqlConnection conexion;
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
            command.Parameters.AddWithValue("@cap", objConcurso.IC_Capacidad);
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
            command.Parameters.AddWithValue("@cap", objConcurso.DTC_FechaF);
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
                objConcurso.VC_Estado = reader[5].ToString();
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
    }
}
