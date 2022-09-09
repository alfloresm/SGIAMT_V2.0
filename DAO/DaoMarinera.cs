﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DTO;

namespace DAO
{
    public class DaoMarinera
    {
        SqlConnection conexion;

        public DaoMarinera()
        {
            conexion = new SqlConnection(ConexionBD.CadenaConexion);
        }

        public string Elegir_Marinera (int dific)
        {
            try
            {
                string valor_retornado = "";
                SqlCommand cmd = new SqlCommand("select top 1 m.VM_Nombre from T_Marinera m where IM_FlagDificultad = " + dific + " order by NEWID()", conexion);
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
    }
}
