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
    }
}
