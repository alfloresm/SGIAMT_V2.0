﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;

namespace DAO
{
    public class DaoUsuarioxModalidad
    {
        SqlConnection conexion;
        public DaoUsuarioxModalidad()
        {
            conexion = new SqlConnection(ConexionBD.CadenaConexion);
        }

        public void RegistrarUXM_S(DtoUsuarioxModalidad objdtouxm)
        {
            try
            {
                SqlCommand command = new SqlCommand("SP_Registrar_Usuario_modalidad", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@FK_Mod", objdtouxm.FK_IM_IdModalidad);
                command.Parameters.AddWithValue("@fk_dni", objdtouxm.FK_VU_Dni);
                command.Parameters.AddWithValue("@fk_concurso", objdtouxm.FK_IC_IdConcurso);
                command.Parameters.Add("@NewId", SqlDbType.Int).Direction = ParameterDirection.Output;

                conexion.Open();

                using (SqlDataReader dr = command.ExecuteReader())
                {
                    objdtouxm.PK_IUM_CodUM = Convert.ToInt32(command.Parameters["@NewId"].Value);
                }
                conexion.Close();
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public void RegistrarUXM_N(DtoUsuarioxModalidad objdtouxm)
        {
            try
            {
                SqlCommand command = new SqlCommand("SP_Registrar_Usuario_modalidad_conPareja", conexion);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@FK_Mod", objdtouxm.FK_IM_IdModalidad);
                command.Parameters.AddWithValue("@fk_dni", objdtouxm.FK_VU_Dni);
                command.Parameters.AddWithValue("@fk_concurso", objdtouxm.FK_IC_IdConcurso);
                command.Parameters.AddWithValue("@fk_pareja", objdtouxm.FK_DNI_Pareja);
                command.Parameters.Add("@NewId", SqlDbType.Int).Direction = ParameterDirection.Output;

                conexion.Open();

                using (SqlDataReader dr = command.ExecuteReader())
                {
                    objdtouxm.PK_IUM_CodUM = Convert.ToInt32(command.Parameters["@NewId"].Value);
                }
                conexion.Close();
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public bool existeUXM_Seriado(DtoUsuarioxModalidad objuxm)//encuentra usuario con ese dni
        {
            string Select = "SELECT COUNT (*) from T_Usuario_Modalidad where FK_VU_Dni ='" + objuxm.FK_VU_Dni +
                            "' and FK_IC_IdConcurso=" + objuxm.FK_IC_IdConcurso + " and FK_IM_IdModalidad=1";
            SqlCommand unComando = new SqlCommand(Select, conexion);
            conexion.Open();

            int count = Convert.ToInt32(unComando.ExecuteScalar());
            conexion.Close();
            if (count == 0)
            {
                return false;

            }
            else
            { return true; }
        }
        public bool existeUXM_conPareja(DtoUsuarioxModalidad objuxm)//encuentra usuario con ese dni
        {

            string Select = "select COUNT (*) from (select * from T_Usuario_Modalidad " +
                "where FK_VU_Dni in ('" + objuxm.FK_VU_Dni + "', '" + objuxm.FK_DNI_Pareja + "') or FK_VU_DniPareja in ('"
                + objuxm.FK_VU_Dni + "', '" + objuxm.FK_DNI_Pareja + "'))a where a.FK_IC_IdConcurso =" + objuxm.FK_IC_IdConcurso
                + " and a.FK_IM_IdModalidad <> 1";
            SqlCommand unComando = new SqlCommand(Select, conexion);
            conexion.Open();
            int count = Convert.ToInt32(unComando.ExecuteScalar());
            conexion.Close();
            if (count == 0)
            {
                return false;

            }
            else
            { return true; }
        }
        public void RegistrarUXM_S_V(DtoUsuarioxModalidad objdtouxm)
        {
            SqlCommand command = new SqlCommand("SP_Registrar_Usuario_modalidad_V", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@FK_Mod", objdtouxm.FK_IM_IdModalidad);
            command.Parameters.AddWithValue("@fk_dni", objdtouxm.FK_VU_Dni);
            command.Parameters.AddWithValue("@fk_concurso", objdtouxm.FK_IC_IdConcurso);
            command.Parameters.Add("@NewId", SqlDbType.Int).Direction = ParameterDirection.Output;

            conexion.Open();

            using (SqlDataReader dr = command.ExecuteReader())
            {
                objdtouxm.PK_IUM_CodUM = Convert.ToInt32(command.Parameters["@NewId"].Value);
            }
            conexion.Close();
        }
        public void RegistrarUXM_N_V(DtoUsuarioxModalidad objdtouxm)
        {
            SqlCommand command = new SqlCommand("SP_Registrar_Usuario_modalidad_conPareja_V", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@FK_Mod", objdtouxm.FK_IM_IdModalidad);
            command.Parameters.AddWithValue("@fk_dni", objdtouxm.FK_VU_Dni);
            command.Parameters.AddWithValue("@fk_concurso", objdtouxm.FK_IC_IdConcurso);
            command.Parameters.AddWithValue("@fk_pareja", objdtouxm.FK_DNI_Pareja);
            command.Parameters.Add("@NewId", SqlDbType.Int).Direction = ParameterDirection.Output;

            conexion.Open();

            using (SqlDataReader dr = command.ExecuteReader())
            {
                objdtouxm.PK_IUM_CodUM = Convert.ToInt32(command.Parameters["@NewId"].Value);
            }
            conexion.Close();
        }
        public void ValidarInscripcion(int id, int est)
        {
            SqlCommand command = new SqlCommand("SP_Validar_Entrada", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@id", id);
            command.Parameters.AddWithValue("@estado", est);
            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();
        }
        public void actualizar_estadoParticipantes(DtoTanda objT)
        {
            SqlCommand command = new SqlCommand("SP_Actualiza_Estado_Participantes", conexion);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@id", objT.PK_IT_CodTan);
            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();
        }
    }
}
